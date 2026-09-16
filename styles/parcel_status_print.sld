<?xml version="1.0" encoding="UTF-8"?>
<!--
  Нэгж талбарын төлөвийн НЭГДСЭН загвар — өнгө нь БҮРТГЭЛЭЭС ирнэ (ХЭВЛЭХ).

  Өнгө нь `v_parcel_status` харагдацын `color` баганаас ШУУД уншигдана
  (`parcel_status` хүснэгтээс, migration 000033). Хүсэлтээр ДАМЖУУЛАХГҮЙ —
  шалтгааныг `parcel_status.sld`-ээс үзнэ үү.

  ХЭВЛЭХ хувилбарын ялгаа: дүүргэлт 40% (дэлгэц дээр 70%), зураас 4px. Цаасан
  дээр 70% дүүргэлт нь доорх хиймэл дагуул/дроны зургийг бүрэн халхалдаг.

  ӨГӨГДМӨЛ ӨНГӨ нь харагдац дотор (COALESCE) баригдсан тул энд NULL шалгах
  дүрэм шаардлагагүй.
-->
<StyledLayerDescriptor version="1.0.0"
  xmlns="http://www.opengis.net/sld"
  xmlns:ogc="http://www.opengis.net/ogc"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.0.0/StyledLayerDescriptor.xsd">
  <NamedLayer>
    <Name>parcel_status_print</Name>
    <UserStyle>
      <Title>Нэгж талбар — төлөв (өнгө нь бүртгэлээс, ХЭВЛЭХ)</Title>
      <FeatureTypeStyle>
        <Rule>
          <Name>parcel_status_print</Name>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">
                <ogc:PropertyName>color</ogc:PropertyName>
              </CssParameter>
              <CssParameter name="fill-opacity">0.40</CssParameter>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">
                <ogc:PropertyName>color</ogc:PropertyName>
              </CssParameter>
              <CssParameter name="stroke-width">4</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>
      </FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>
