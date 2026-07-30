# Official GeoServer — startup-д юу ч татдаггүй, PostGIS datastore core-д байдаг
FROM docker.osgeo.org/geoserver:2.25.2

# TZ=Asia/Ulaanbaatar-г container-ийн систем цагт бодитоор хэрэгжүүлэхийн тулд
# base image-д байхгүй tzdata-г нэмнэ.
RUN apt-get update && apt-get install -y --no-install-recommends tzdata && rm -rf /var/lib/apt/lists/*

# COG (Cloud Optimized GeoTIFF) — HTTP range reader.
#
# Дроны ортофотог ФАЙЛЫН СИСТЕМЭЭС (MinIO) ШУУД уншихад хэрэгтэй: granule-ийн
# зам нь http://minio:9000/... болох ба GeoServer зөвхөн шаардлагатай tile-ийн
# байтыг Range хүсэлтээр авна. Ингэснээр backend дээр растрын хуулбар
# (рендерийн кэш) хадгалах шаардлага бүрмөсөн арилна.
#
# Яагаад build үед татаж, image дотор нь хийж байна: startup дээр татвал
# GeoServer асахдаа интернетээс хамааралтай болно. /opt/install-extensions.sh
# нь ADDITIONAL_LIBS_DIR дотор байгаа zip-ийг татахгүйгээр шууд unzip хийдэг
# (INSTALL_EXTENSIONS=false үед ч) — тиймээс нэрийг түүний хүлээж байгаа
# хэлбэрээр (geoserver-<version>-<extension>-plugin.zip) тавина.
#
# cog-http нь community модуль тул stable extensions дунд байхгүй; 2.25.x
# branch-ийн build-ээс авна. Zip дотор gs-cog-core + gs-cog-http +
# imageio-ext range reader бүгд агуулагдсан (нэмэлт хамаарал шаардахгүй).
ARG GEOSERVER_VERSION=2.25.2
ARG COG_PLUGIN_URL=https://build.geoserver.org/geoserver/2.25.x/community-latest/geoserver-2.25-SNAPSHOT-cog-http-plugin.zip
RUN mkdir -p /opt/additional_libs \
    && curl -fsSL "$COG_PLUGIN_URL" \
       -o "/opt/additional_libs/geoserver-${GEOSERVER_VERSION}-cog-http-plugin.zip" \
    && unzip -l "/opt/additional_libs/geoserver-${GEOSERVER_VERSION}-cog-http-plugin.zip" >/dev/null

ENV GEOSERVER_DATA_DIR=/opt/geoserver_data
