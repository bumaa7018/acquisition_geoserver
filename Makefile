.PHONY: up down logs build config

GS_DIR     := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
ENV_FILE   := $(GS_DIR).env

GEOSERVER_PORT  ?= $(shell grep '^GEOSERVER_PORT'  $(ENV_FILE) 2>/dev/null | cut -d= -f2)
GEOSERVER_PORT  := $(or $(GEOSERVER_PORT),8600)
GEOSERVER_ADMIN ?= $(shell grep '^GEOSERVER_ADMIN' $(ENV_FILE) 2>/dev/null | cut -d= -f2)
GEOSERVER_ADMIN := $(or $(GEOSERVER_ADMIN),admin)
GEOSERVER_PASS  ?= $(shell grep '^GEOSERVER_PASS'  $(ENV_FILE) 2>/dev/null | cut -d= -f2)
GEOSERVER_PASS  := $(or $(GEOSERVER_PASS),geoserver)

DB_USER ?= $(shell grep '^DB_USER'     $(ENV_FILE) 2>/dev/null | cut -d= -f2)
DB_USER := $(or $(DB_USER),postgres)
DB_PASS ?= $(shell grep '^DB_PASSWORD' $(ENV_FILE) 2>/dev/null | cut -d= -f2)
DB_NAME ?= $(shell grep '^DB_NAME'     $(ENV_FILE) 2>/dev/null | cut -d= -f2)
DB_NAME := $(or $(DB_NAME),appdb)
DB_HOST ?= $(shell grep '^DB_HOST'     $(ENV_FILE) 2>/dev/null | cut -d= -f2)
DB_HOST := $(or $(DB_HOST),postgres)

GS_URL  = http://localhost:$(GEOSERVER_PORT)/geoserver/rest
GS_AUTH = -u $(GEOSERVER_ADMIN):$(GEOSERVER_PASS)

build:
	@echo "▶ GeoServer image бүтээж байна..."
	docker compose build geoserver
	@echo "✓ Image бэлэн (дараа нь cache-аас ашиглана)"

up: build
	@docker network inspect gov_network >/dev/null 2>&1 || \
		(echo "▶ gov_network үүсгэж байна..." && docker network create gov_network)
	@echo "▶ GeoServer асааж байна..."
	docker compose up -d geoserver
	@echo "⏳ GeoServer бэлэн болтол хүлээж байна..."
	@until curl -sf $(GS_AUTH) $(GS_URL)/about/version.json >/dev/null 2>&1; do sleep 5; done
	@echo "✓ GeoServer ажиллаж эхэллээ"
	@$(MAKE) config

down:
	docker compose down

logs:
	docker compose logs -f geoserver

# Workspace / DataStore / Layer тохиргоо — дахин ажиллуулж болно (idempotent)
# Шаардлага: backend postgres container ажиллаж, land_acquisition/parcel хүснэгтүүд байна
config:
	@echo "▶ [1/3] Geometry view-уудыг үүсгэж байна..."
	@docker run --rm --network gov_network \
		-e PGPASSWORD=$(DB_PASS) \
		postgres:16-alpine psql \
		-h $(DB_HOST) -U $(DB_USER) -d $(DB_NAME) \
		-c "DROP VIEW IF EXISTS v_acquisition_boundary; \
		    CREATE VIEW v_acquisition_boundary AS \
		      SELECT id, plan_code, status, start_date, end_date, area_m2, geometry \
		      FROM ( \
		        SELECT id, plan_code, status, start_date, end_date, area_m2, \
		               ST_SetSRID(ST_GeomFromText(geometry), 4326)::geometry(Polygon, 4326) AS geometry \
		        FROM land_acquisition \
		        WHERE geometry IS NOT NULL AND trim(geometry) <> '' \
		      ) s" \
		-c "DROP VIEW IF EXISTS v_acquisition_plan; \
		    CREATE VIEW v_acquisition_plan AS \
		      SELECT id, plan_code, status, plan_area_m2, plan_geom AS geometry \
		      FROM ( \
		        SELECT id, plan_code, status, plan_area_m2, \
		               ST_SetSRID(ST_GeomFromText(plan_geom), 4326)::geometry(Polygon, 4326) AS plan_geom \
		        FROM land_acquisition \
		        WHERE plan_geom IS NOT NULL AND trim(plan_geom) <> '' \
		      ) s" \
		-c "DROP VIEW IF EXISTS v_parcel_acquisition; \
		    CREATE VIEW v_parcel_acquisition AS \
		      SELECT id, parcel_id, acquisition_id, acquisition_area_m2, \
		             acquisition_geom AS geometry \
		      FROM ( \
		        SELECT id, parcel_id, acquisition_id, acquisition_area_m2, \
		               ST_SetSRID(ST_GeomFromText(acquisition_geom), 4326)::geometry(Polygon, 4326) AS acquisition_geom \
		        FROM parcel \
		        WHERE acquisition_geom IS NOT NULL AND trim(acquisition_geom) <> '' \
		      ) s"
	@echo "▶ [2/3] Workspace болон PostGIS DataStore тохируулж байна..."
	@curl -sf $(GS_AUTH) -XPOST $(GS_URL)/workspaces \
		-H "Content-Type: application/json" \
		-d '{"workspace":{"name":"land"}}' 2>/dev/null; true
	@curl -sf $(GS_AUTH) -XPOST $(GS_URL)/workspaces/land/datastores \
		-H "Content-Type: application/xml" \
		-d '<dataStore>\
		      <name>postgis_main</name>\
		      <type>PostGIS</type>\
		      <enabled>true</enabled>\
		      <connectionParameters>\
		        <entry key="host">$(DB_HOST)</entry>\
		        <entry key="port">5432</entry>\
		        <entry key="database">$(DB_NAME)</entry>\
		        <entry key="user">$(DB_USER)</entry>\
		        <entry key="passwd">$(DB_PASS)</entry>\
		        <entry key="dbtype">postgis</entry>\
		        <entry key="schema">public</entry>\
		        <entry key="validate connections">true</entry>\
		      </connectionParameters>\
		    </dataStore>' 2>/dev/null; true
	@echo "▶ [3/3] Layer-уудыг нийтэлж байна..."
	@for layer in au1 au2 au3 v_acquisition_boundary v_acquisition_plan parcel v_parcel_acquisition; do \
		echo "  → $$layer"; \
		curl -sf $(GS_AUTH) -XPOST "$(GS_URL)/workspaces/land/datastores/postgis_main/featuretypes?recalculate=nativebbox,latlonbbox" \
			-H "Content-Type: application/json" \
			-d "{\"featureType\":{\"name\":\"$$layer\",\"nativeName\":\"$$layer\",\"srs\":\"EPSG:4326\",\"projectionPolicy\":\"FORCE_DECLARED\",\"enabled\":true}}" \
			2>/dev/null || \
		curl -sf $(GS_AUTH) -XPUT "$(GS_URL)/workspaces/land/datastores/postgis_main/featuretypes/$$layer.json?recalculate=nativebbox,latlonbbox" \
			-H "Content-Type: application/json" \
			-d "{\"featureType\":{\"name\":\"$$layer\",\"nativeName\":\"$$layer\",\"srs\":\"EPSG:4326\",\"projectionPolicy\":\"FORCE_DECLARED\",\"enabled\":true}}" \
			>/dev/null; \
	done
	@echo ""
	@echo "✓ GeoServer тохиргоо амжилттай дууслаа"
	@echo "  Web UI : http://localhost:$(GEOSERVER_PORT)/geoserver/web"
	@echo "  WMS    : http://localhost:$(GEOSERVER_PORT)/geoserver/land/wms"
	@echo "  Нэвтрэх: $(GEOSERVER_ADMIN) / $(GEOSERVER_PASS)"
