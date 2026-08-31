<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor version="1.0.0"
  xmlns="http://www.opengis.net/sld"
  xmlns:ogc="http://www.opengis.net/ogc"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.0.0/StyledLayerDescriptor.xsd">
  <NamedLayer>
    <Name>parcel_s5_print</Name>
    <UserStyle>
      <Title>Нэгж талбар — Чөлөөлсөн</Title>
      <FeatureTypeStyle>
      <!-- ХЭВЛЭХЭД зориулсан хувилбар: ДҮҮРГЭЛТГҮЙ, зөвхөн хил.
           Дэлгэцийн (default) style нь дүүргэлттэй хэвээр — энэ style-ыг
           зөвхөн хэвлэх мөчид WMS-ийн STYLES параметрээр сольж дуудна. -->
        <Rule>
          <Name>parcel_s5</Name>
          <PolygonSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#22c55e</CssParameter>
              <CssParameter name="stroke-width">1.5</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>
      </FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>
