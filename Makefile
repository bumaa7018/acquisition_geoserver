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

# ГУС-ийн (ЛМ) БҮРТГЭЛИЙН САН — зөвхөн УНШИХ.
#
# Дундын сервис (goverment-middleware) нь ЭНЭ л сан руу ханддаг: түүний
# AUTH_DB_* тохиргоо нь `lm_0003` руу заадаг. GeoServer мөн ЯГ ТЭР эрхээр
# (ижил хэрэглэгч) холбогдоно — өөр эрх үүсгэхгүй.
#
# АНХААР: энэ сан руу ЗӨВХӨН SELECT явна. GeoServer-ийн WFS-T (гүйлгээ) нь
# proxy дээр хаалттай (зөвхөн GetMap/GetFeatureInfo/GetFeature), мөн доорх
# датастор дээр бичих тохиргоо огт өгөгдөөгүй.
GUS_DB_HOST ?= $(shell grep '^GUS_DB_HOST'     $(ENV_FILE) 2>/dev/null | cut -d= -f2)
GUS_DB_PORT ?= $(shell grep '^GUS_DB_PORT'     $(ENV_FILE) 2>/dev/null | cut -d= -f2)
GUS_DB_PORT := $(or $(GUS_DB_PORT),5432)
GUS_DB_NAME ?= $(shell grep '^GUS_DB_NAME'     $(ENV_FILE) 2>/dev/null | cut -d= -f2)
GUS_DB_USER ?= $(shell grep '^GUS_DB_USER'     $(ENV_FILE) 2>/dev/null | cut -d= -f2)
GUS_DB_PASS ?= $(shell grep '^GUS_DB_PASSWORD' $(ENV_FILE) 2>/dev/null | cut -d= -f2)
GUS_DB_SCHEMA ?= $(shell grep '^GUS_DB_SCHEMA' $(ENV_FILE) 2>/dev/null | cut -d= -f2)
GUS_DB_SCHEMA := $(or $(GUS_DB_SCHEMA),data_landuse)

# ГУС-аас шууд нийтлэгдэх давхаргууд (data_landuse схем).
GUS_LAYERS = ca_agreed_parcel ca_sec_parcel

GS_URL  = http://localhost:$(GEOSERVER_PORT)/geoserver/rest
GS_AUTH = -u $(GEOSERVER_ADMIN):$(GEOSERVER_PASS)
STYLES_DIR = $(GS_DIR)styles

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
	@echo "▶ [1/4] Geometry view-уудыг үүсгэж байна..."
	@docker run --rm --network gov_network \
		-e PGPASSWORD=$(DB_PASS) \
		postgres:16-alpine psql \
		-h $(DB_HOST) -U $(DB_USER) -d $(DB_NAME) \
		-c "DROP VIEW IF EXISTS v_acquisition_boundary; \
		    CREATE VIEW v_acquisition_boundary AS \
		      SELECT id AS acquisition_id, plan_code, \
		             COALESCE(acquisition_name, '') AS acquisition_name, \
		             status, start_date, end_date, area_m2, \
		             geometry::geometry(Polygon, 4326) AS geometry \
		      FROM land_acquisition \
		      WHERE geometry IS NOT NULL" \
		-c "DROP VIEW IF EXISTS v_acquisition_plan; \
		    CREATE VIEW v_acquisition_plan AS \
		      SELECT id AS acquisition_id, plan_code, \
		             COALESCE(acquisition_name, '') AS acquisition_name, \
		             status, start_date, end_date, plan_area_m2, \
		             plan_geom::geometry(Polygon, 4326) AS geometry \
		      FROM land_acquisition \
		      WHERE plan_geom IS NOT NULL" \
		-c "DROP VIEW IF EXISTS v_plan_acquisition; \
		    CREATE VIEW v_plan_acquisition AS \
		      SELECT id AS acquisition_id, plan_code, \
		             COALESCE(acquisition_name, '') AS acquisition_name, \
		             status, start_date, end_date, area_m2, \
		             geometry::geometry(Polygon, 4326) AS geometry \
		      FROM land_acquisition \
		      WHERE geometry IS NOT NULL AND deleted_at IS NULL" \
		-c "DROP VIEW IF EXISTS v_parcel_acquisition; \
		    CREATE VIEW v_parcel_acquisition AS \
		      SELECT p.id, p.parcel_id, p.acquisition_id, p.acquisition_area_m2, \
		             p.status, \
		             p.acquisition_geom::geometry(Polygon, 4326) AS geometry \
		      FROM parcel p \
		      WHERE p.acquisition_geom IS NOT NULL" \
		-c "DROP VIEW IF EXISTS v_parcel_s0; \
		    CREATE VIEW v_parcel_s0 AS \
		      SELECT p.id, p.parcel_id, p.acquisition_id, p.acquisition_area_m2, \
		             p.status, \
		             p.acquisition_geom::geometry(Polygon, 4326) AS geometry, \
		             EXTRACT(YEAR FROM ( \
		                 SELECT MAX(psh.status_date) FROM parcel_status_history psh \
		                 WHERE psh.parcel_id = p.parcel_id \
		             ))::INTEGER AS status_year, \
		             COALESCE(',' || (SELECT string_agg(laa.user_id::text, ',') \
		                 FROM land_acquisition_assignee laa \
		                 WHERE laa.acquisition_id = p.acquisition_id) || ',', '') AS assignee_user_ids \
		      FROM parcel p \
		      WHERE p.acquisition_geom IS NOT NULL AND p.status = 0" \
		-c "DROP VIEW IF EXISTS v_parcel_s1; \
		    CREATE VIEW v_parcel_s1 AS \
		      SELECT p.id, p.parcel_id, p.acquisition_id, p.acquisition_area_m2, \
		             p.status, \
		             p.acquisition_geom::geometry(Polygon, 4326) AS geometry, \
		             EXTRACT(YEAR FROM ( \
		                 SELECT MAX(psh.status_date) FROM parcel_status_history psh \
		                 WHERE psh.parcel_id = p.parcel_id \
		             ))::INTEGER AS status_year, \
		             COALESCE(',' || (SELECT string_agg(laa.user_id::text, ',') \
		                 FROM land_acquisition_assignee laa \
		                 WHERE laa.acquisition_id = p.acquisition_id) || ',', '') AS assignee_user_ids \
		      FROM parcel p \
		      WHERE p.acquisition_geom IS NOT NULL AND p.status = 1" \
		-c "DROP VIEW IF EXISTS v_parcel_s2; \
		    CREATE VIEW v_parcel_s2 AS \
		      SELECT p.id, p.parcel_id, p.acquisition_id, p.acquisition_area_m2, \
		             p.status, \
		             p.acquisition_geom::geometry(Polygon, 4326) AS geometry, \
		             EXTRACT(YEAR FROM ( \
		                 SELECT MAX(psh.status_date) FROM parcel_status_history psh \
		                 WHERE psh.parcel_id = p.parcel_id \
		             ))::INTEGER AS status_year, \
		             COALESCE(',' || (SELECT string_agg(laa.user_id::text, ',') \
		                 FROM land_acquisition_assignee laa \
		                 WHERE laa.acquisition_id = p.acquisition_id) || ',', '') AS assignee_user_ids \
		      FROM parcel p \
		      WHERE p.acquisition_geom IS NOT NULL AND p.status = 2" \
		-c "DROP VIEW IF EXISTS v_parcel_s3; \
		    CREATE VIEW v_parcel_s3 AS \
		      SELECT p.id, p.parcel_id, p.acquisition_id, p.acquisition_area_m2, \
		             p.status, \
		             p.acquisition_geom::geometry(Polygon, 4326) AS geometry, \
		             EXTRACT(YEAR FROM ( \
		                 SELECT MAX(psh.status_date) FROM parcel_status_history psh \
		                 WHERE psh.parcel_id = p.parcel_id \
		             ))::INTEGER AS status_year, \
		             COALESCE(',' || (SELECT string_agg(laa.user_id::text, ',') \
		                 FROM land_acquisition_assignee laa \
		                 WHERE laa.acquisition_id = p.acquisition_id) || ',', '') AS assignee_user_ids \
		      FROM parcel p \
		      WHERE p.acquisition_geom IS NOT NULL AND p.status = 3" \
		-c "DROP VIEW IF EXISTS v_parcel_s4; \
		    CREATE VIEW v_parcel_s4 AS \
		      SELECT p.id, p.parcel_id, p.acquisition_id, p.acquisition_area_m2, \
		             p.status, \
		             p.acquisition_geom::geometry(Polygon, 4326) AS geometry, \
		             EXTRACT(YEAR FROM ( \
		                 SELECT MAX(psh.status_date) FROM parcel_status_history psh \
		                 WHERE psh.parcel_id = p.parcel_id \
		             ))::INTEGER AS status_year, \
		             COALESCE(',' || (SELECT string_agg(laa.user_id::text, ',') \
		                 FROM land_acquisition_assignee laa \
		                 WHERE laa.acquisition_id = p.acquisition_id) || ',', '') AS assignee_user_ids \
		      FROM parcel p \
		      WHERE p.acquisition_geom IS NOT NULL AND p.status = 4" \
		-c "DROP VIEW IF EXISTS v_parcel_s5; \
		    CREATE VIEW v_parcel_s5 AS \
		      SELECT p.id, p.parcel_id, p.acquisition_id, p.acquisition_area_m2, \
		             p.status, \
		             p.acquisition_geom::geometry(Polygon, 4326) AS geometry, \
		             EXTRACT(YEAR FROM ( \
		                 SELECT MAX(psh.status_date) FROM parcel_status_history psh \
		                 WHERE psh.parcel_id = p.parcel_id \
		             ))::INTEGER AS status_year, \
		             COALESCE(',' || (SELECT string_agg(laa.user_id::text, ',') \
		                 FROM land_acquisition_assignee laa \
		                 WHERE laa.acquisition_id = p.acquisition_id) || ',', '') AS assignee_user_ids \
		      FROM parcel p \
		      WHERE p.acquisition_geom IS NOT NULL AND p.status = 5" \
		-c "DROP VIEW IF EXISTS v_parcel_status; \
		    CREATE VIEW v_parcel_status AS \
		      SELECT p.id, p.parcel_id, p.acquisition_id, p.acquisition_area_m2, \
		             p.status, \
		             COALESCE(ps.color, '#94a3b8') AS color, \
		             p.acquisition_geom::geometry(Polygon, 4326) AS geometry, \
		             EXTRACT(YEAR FROM ( \
		                 SELECT MAX(psh.status_date) FROM parcel_status_history psh \
		                 WHERE psh.parcel_id = p.parcel_id \
		             ))::INTEGER AS status_year, \
		             COALESCE(',' || (SELECT string_agg(laa.user_id::text, ',') \
		                 FROM land_acquisition_assignee laa \
		                 WHERE laa.acquisition_id = p.acquisition_id) || ',', '') AS assignee_user_ids \
		      FROM parcel p \
		      LEFT JOIN parcel_status ps ON ps.id = p.status \
		      WHERE p.acquisition_geom IS NOT NULL" \
		-c "DROP VIEW IF EXISTS v_parcel_public; \
		    CREATE VIEW v_parcel_public AS \
		      SELECT p.id, p.parcel_id, \
		             p.au1_code, p.au2_code, p.au3_code, \
		             COALESCE(a1.name, '') AS au1_name, \
		             COALESCE(a2.name, '') AS au2_name, \
		             COALESCE(a3.name, '') AS au3_name, \
		             p.status, COALESCE(ps.name, '') AS status_name, \
		             COALESCE(p.acquisition_area_m2, 0) AS acquisition_area_m2, \
		             COALESCE(p.acquisition_geom, p.geometry)::geometry(Polygon, 4326) AS geometry \
		      FROM parcel p \
		      JOIN land_acquisition la ON la.id = p.acquisition_id AND la.deleted_at IS NULL \
		      LEFT JOIN parcel_status ps ON ps.id = p.status \
		      LEFT JOIN au1 a1 ON a1.code = p.au1_code \
		      LEFT JOIN au2 a2 ON a2.code = p.au2_code \
		      LEFT JOIN au3 a3 ON a3.code = p.au3_code \
		      WHERE COALESCE(p.acquisition_geom, p.geometry) IS NOT NULL"
	@echo "▶ [2/4] Workspace болон PostGIS DataStore тохируулж байна..."
	@if ! curl -sf $(GS_AUTH) "$(GS_URL)/workspaces/land.json" >/dev/null; then \
		curl -sf $(GS_AUTH) -XPOST $(GS_URL)/workspaces \
			-H "Content-Type: application/json" \
			-d '{"workspace":{"name":"land"}}' >/dev/null; \
	fi
# ЗААВАЛ "Expose primary keys": GeoServer нь PK баганыг үндсэн байдлаар НУУДАГ.
# au1/au2/au3-ийн PK нь `code` тул үүнгүйгээр `CQL_FILTER=code IN (...)` нь
# "Property 'code' could not be found" алдаа өгч, аймаг/сум/хорооны хил ОГТ
# зурагддаггүй байв (frontend-ийн buildCodeCql үүнийг ашигладаг).
	@if curl -sf $(GS_AUTH) "$(GS_URL)/workspaces/land/datastores/postgis_main.json" >/dev/null; then \
		curl -sf $(GS_AUTH) -XPUT "$(GS_URL)/workspaces/land/datastores/postgis_main" \
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
			        <entry key="Expose primary keys">true</entry>\
			      </connectionParameters>\
			    </dataStore>' >/dev/null; \
	else \
		curl -sf $(GS_AUTH) -XPOST "$(GS_URL)/workspaces/land/datastores" \
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
			        <entry key="Expose primary keys">true</entry>\
			      </connectionParameters>\
			    </dataStore>' >/dev/null; \
	fi
	@$(MAKE) config-gus
	@echo "▶ [3/4] Layer-уудыг нийтэлж байна..."
	@for layer in au1 au2 au3 v_acquisition_plan v_acquisition_boundary v_plan_acquisition parcel building v_parcel_acquisition v_parcel_status v_parcel_s0 v_parcel_s1 v_parcel_s2 v_parcel_s3 v_parcel_s4 v_parcel_s5 v_parcel_public; do \
		echo "  → $$layer"; \
		if curl -sf $(GS_AUTH) "$(GS_URL)/workspaces/land/datastores/postgis_main/featuretypes/$$layer.json" >/dev/null; then \
			curl -sf $(GS_AUTH) -XPUT "$(GS_URL)/workspaces/land/datastores/postgis_main/featuretypes/$$layer.json?recalculate=nativebbox,latlonbbox" \
				-H "Content-Type: application/json" \
				-d "{\"featureType\":{\"name\":\"$$layer\",\"nativeName\":\"$$layer\",\"srs\":\"EPSG:4326\",\"projectionPolicy\":\"FORCE_DECLARED\",\"enabled\":true}}" \
				>/dev/null; \
		else \
			curl -sf $(GS_AUTH) -XPOST "$(GS_URL)/workspaces/land/datastores/postgis_main/featuretypes?recalculate=nativebbox,latlonbbox" \
				-H "Content-Type: application/json" \
				-d "{\"featureType\":{\"name\":\"$$layer\",\"nativeName\":\"$$layer\",\"srs\":\"EPSG:4326\",\"projectionPolicy\":\"FORCE_DECLARED\",\"enabled\":true}}" \
				>/dev/null; \
		fi; \
	done
	@echo "▶ [4/4] Layer style-уудыг frontend-тэй тааруулж байна..."
	@for spec in \
		"au1 au1_boundary au1_boundary.sld" \
		"au2 au2_boundary au2_boundary.sld" \
		"au3 au3_boundary au3_boundary.sld" \
		"v_acquisition_plan acquisition_plan acquisition_plan.sld" \
		"v_acquisition_boundary acquisition_boundary acquisition_boundary.sld" \
		"v_plan_acquisition plan_acquisition plan_acquisition.sld" \
		"parcel parcel_boundary parcel_boundary.sld" \
		"building building_boundary building_boundary.sld" \
		"v_parcel_acquisition parcel_acquisition parcel_acquisition.sld" \
		"v_parcel_status parcel_status parcel_status.sld" \
		"v_parcel_s0 parcel_s0 parcel_s0.sld" \
		"v_parcel_s1 parcel_s1 parcel_s1.sld" \
		"v_parcel_s2 parcel_s2 parcel_s2.sld" \
		"v_parcel_s3 parcel_s3 parcel_s3.sld" \
		"v_parcel_s4 parcel_s4 parcel_s4.sld" \
		"v_parcel_s5 parcel_s5 parcel_s5.sld" \
		"v_parcel_public parcel_public parcel_public.sld"; do \
		set -- $$spec; layer=$$1; style=$$2; file=$$3; \
		echo "  → $$layer = $$style"; \
		if curl -sf $(GS_AUTH) "$(GS_URL)/workspaces/land/styles/$$style.sld" >/dev/null; then \
			curl -sf $(GS_AUTH) -XPUT "$(GS_URL)/workspaces/land/styles/$$style" \
				-H "Content-Type: application/vnd.ogc.sld+xml" \
				--data-binary "@$(STYLES_DIR)/$$file" >/dev/null; \
		else \
			curl -sf $(GS_AUTH) -XPOST "$(GS_URL)/workspaces/land/styles?name=$$style" \
				-H "Content-Type: application/vnd.ogc.sld+xml" \
				--data-binary "@$(STYLES_DIR)/$$file" >/dev/null; \
		fi; \
		curl -sf $(GS_AUTH) -XPUT "$(GS_URL)/layers/land:$$layer" \
			-H "Content-Type: application/json" \
			-d "{\"layer\":{\"defaultStyle\":{\"name\":\"$$style\",\"workspace\":\"land\"}}}" >/dev/null; \
	done
	@echo "▶ [4/4b] ХЭВЛЭХИЙН дүүргэлтгүй style-уудыг ачаалж байна..."
	@# Эдгээр нь давхаргын ӨГӨГДМӨЛ style БОЛОХГҮЙ — зөвхөн байршуулна.
	@# Frontend хэвлэх мөчид WMS-ийн STYLES параметрээр нэрээр нь дуудна.
	@for style in acquisition_plan_print plan_acquisition_print \
	              au1_boundary_print au2_boundary_print au3_boundary_print \
		parcel_status_print \
		parcel_s0_print parcel_s1_print parcel_s2_print \
		parcel_s3_print parcel_s4_print parcel_s5_print; do \
		echo "  → $$style"; \
		if curl -sf $(GS_AUTH) "$(GS_URL)/workspaces/land/styles/$$style.sld" >/dev/null; then \
			curl -sf $(GS_AUTH) -XPUT "$(GS_URL)/workspaces/land/styles/$$style" \
				-H "Content-Type: application/vnd.ogc.sld+xml" \
				--data-binary "@$(STYLES_DIR)/$$style.sld" >/dev/null; \
		else \
			curl -sf $(GS_AUTH) -XPOST "$(GS_URL)/workspaces/land/styles?name=$$style" \
				-H "Content-Type: application/vnd.ogc.sld+xml" \
				--data-binary "@$(STYLES_DIR)/$$style.sld" >/dev/null; \
		fi; \
	done
	@echo "▶ [5/5] Каталогийг дахин ачаалж байна..."
	@# ЗААВАЛ: шинээр үүсгэсэн style-ыг WMS хөдөлгүүр ШУУД танихгүй —
	@# reload хийхгүй бол GetMap "No such style: <нэр>" алдаа өгнө.
	@curl -sf $(GS_AUTH) -XPOST "$(GS_URL)/reload" >/dev/null || true
	@echo ""
	@echo "✓ GeoServer тохиргоо амжилттай дууслаа"
	@echo "  Дроны ортофотогийн давхаргыг API өөрөө үүсгэнэ (COG, MinIO-с шууд)"
	@echo "  НЭЭЛТТЭЙ давхарга (гадны систем, эрх шалгахгүй): land:v_parcel_public"
	@echo "    → frontend-ийн /api/public/geoserver/land/wms гарцаар (дүүргээр: CQL_FILTER=au2_code='\''...'\'')"
	@echo "  Web UI : http://localhost:$(GEOSERVER_PORT)/geoserver/web"
	@echo "  WMS    : http://localhost:$(GEOSERVER_PORT)/geoserver/land/wms"
	@echo "  Нэвтрэх: $(GEOSERVER_ADMIN) / $(GEOSERVER_PASS)"

# ГУС-ийн (ЛМ) давхаргууд — data_landuse схемээс ШУУД уншина.
#
#   ca_agreed_parcel — шинэ зөвшилцсөн зураг
#   ca_sec_parcel    — хамгаалалтын зурвас
#
# Эдгээр нь appdb-д ХУУЛАГДАХГҮЙ: ГУС дээр өөрчлөгдөхөд газрын зураг дээр
# шууд тусна (синхрончлолын алхам байхгүй).
#
# `config`-ийн дотроос дуудагдана. ГУС-ийн тохиргоо (GUS_DB_*) хоосон бол
# ЧИМЭЭГҮЙ алгасана — локал орчинд ГУС руу холбогдох боломжгүй байдаг ба
# үүнээс болж бүхэл `config` унах ёсгүй.
#
# featuretypes-ийг нийтлэхэд recalculate-д "attributes" мөн орсон: ГУС дээр
# харагдацдаа ШИНЭ багана нэмэхэд GeoServer нь хуучин багануудынхаа жагсаалтыг
# сакалж үлддэг ба тэр багана WMS GetFeatureInfo-д ирэхгүй тул зураг дээр
# дарахад гарах цонхонд хоосон харагддаг байв (жишээ: ca_sec_parcel-ийн name).
#
# АНХААР: доорх recipe нь "\"-аар холбогдсон ЕРДӨӨ НЭГ shell командын урсгал.
# Тиймээс дунд нь тайлбар (@# ...) бичиж БОЛОХГҮЙ — shell тэрийг команд гэж
# уншиж "@#: not found" гэж унана, тайлбар дахь backtick нь команд солилцоо
# болж бас унана. Тайлбар зөвхөн ЭНД, target-ын гадна бичигдэнэ.
.PHONY: config-gus
config-gus:
	@if [ -z "$(GUS_DB_HOST)" ] || [ -z "$(GUS_DB_NAME)" ] || [ -z "$(GUS_DB_USER)" ]; then \
		echo "▶ [2b/4] ГУС давхарга: GUS_DB_* тохируулаагүй тул алгаслаа"; \
		exit 0; \
	fi; \
	echo "▶ [2b/4] ГУС-ийн DataStore ($(GUS_DB_NAME)/$(GUS_DB_SCHEMA)) тохируулж байна..."; \
	if curl -sf $(GS_AUTH) "$(GS_URL)/workspaces/land/datastores/postgis_gus.json" >/dev/null; then \
		method=PUT; url="$(GS_URL)/workspaces/land/datastores/postgis_gus"; \
	else \
		method=POST; url="$(GS_URL)/workspaces/land/datastores"; \
	fi; \
	curl -sf $(GS_AUTH) -X$$method "$$url" \
		-H "Content-Type: application/xml" \
		-d '<dataStore>\
		      <name>postgis_gus</name>\
		      <type>PostGIS</type>\
		      <enabled>true</enabled>\
		      <connectionParameters>\
		        <entry key="host">$(GUS_DB_HOST)</entry>\
		        <entry key="port">$(GUS_DB_PORT)</entry>\
		        <entry key="database">$(GUS_DB_NAME)</entry>\
		        <entry key="user">$(GUS_DB_USER)</entry>\
		        <entry key="passwd">$(GUS_DB_PASS)</entry>\
		        <entry key="dbtype">postgis</entry>\
		        <entry key="schema">$(GUS_DB_SCHEMA)</entry>\
		        <entry key="validate connections">true</entry>\
		        <entry key="Expose primary keys">true</entry>\
		        <entry key="max connections">5</entry>\
		        <entry key="Connection timeout">10</entry>\
		      </connectionParameters>\
		    </dataStore>' >/dev/null || \
		{ echo "  ! ГУС-ийн DataStore үүсгэж чадсангүй — давхарга алгаслаа"; exit 0; }; \
	for layer in $(GUS_LAYERS); do \
		echo "  → $$layer"; \
		if curl -sf $(GS_AUTH) "$(GS_URL)/workspaces/land/datastores/postgis_gus/featuretypes/$$layer.json" >/dev/null; then \
			m=PUT; u="$(GS_URL)/workspaces/land/datastores/postgis_gus/featuretypes/$$layer.json?recalculate=nativebbox,latlonbbox,attributes"; \
		else \
			m=POST; u="$(GS_URL)/workspaces/land/datastores/postgis_gus/featuretypes?recalculate=nativebbox,latlonbbox,attributes"; \
		fi; \
		curl -sf $(GS_AUTH) -X$$m "$$u" \
			-H "Content-Type: application/json" \
			-d "{\"featureType\":{\"name\":\"$$layer\",\"nativeName\":\"$$layer\",\"srs\":\"EPSG:4326\",\"projectionPolicy\":\"REPROJECT_TO_DECLARED\",\"enabled\":true}}" \
			>/dev/null || echo "  ! $$layer нийтлэгдсэнгүй (хүснэгт/геометр багана байхгүй байж болно)"; \
	done; \
	for spec in "ca_agreed_parcel ca_agreed_parcel ca_agreed_parcel.sld" \
	            "ca_sec_parcel ca_sec_parcel ca_sec_parcel.sld"; do \
		set -- $$spec; layer=$$1; style=$$2; file=$$3; \
		echo "  → $$layer = $$style"; \
		if curl -sf $(GS_AUTH) "$(GS_URL)/workspaces/land/styles/$$style.sld" >/dev/null; then \
			curl -sf $(GS_AUTH) -XPUT "$(GS_URL)/workspaces/land/styles/$$style" \
				-H "Content-Type: application/vnd.ogc.sld+xml" \
				--data-binary "@$(STYLES_DIR)/$$file" >/dev/null; \
		else \
			curl -sf $(GS_AUTH) -XPOST "$(GS_URL)/workspaces/land/styles?name=$$style" \
				-H "Content-Type: application/vnd.ogc.sld+xml" \
				--data-binary "@$(STYLES_DIR)/$$file" >/dev/null; \
		fi; \
		curl -sf $(GS_AUTH) -XPUT "$(GS_URL)/layers/land:$$layer" \
			-H "Content-Type: application/json" \
			-d "{\"layer\":{\"defaultStyle\":{\"name\":\"$$style\",\"workspace\":\"land\"}}}" >/dev/null || true; \
	done
