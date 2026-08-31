<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor version="1.0.0"
  xmlns="http://www.opengis.net/sld"
  xmlns:ogc="http://www.opengis.net/ogc"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.0.0/StyledLayerDescriptor.xsd">
  <NamedLayer>
    <Name>parcel_s1_print</Name>
    <UserStyle>
      <Title>Нэгж талбар — Зөвшилцөх шатандаа</Title>
      <FeatureTypeStyle>
      <!-- ХЭВЛЭХЭД зориулсан хувилбар: дүүргэлт 30% (дэлгэц дээр 70%).
           Цаасан дээр 70% дүүргэлт нь доорх хиймэл дагуулын зураг/дроны
           ортофотог бүрэн халхалдаг тул сулруулсан. Дэлгэцийн (default)
           style ХЭВЭЭР — энэ style-ыг зөвхөн хэвлэх мөчид WMS-ийн STYLES
           параметрээр сольж дуудна. -->
        <Rule>
          <Name>parcel_s1</Name>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#eab308</CssParameter>
              <CssParameter name="fill-opacity">0.40</CssParameter>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#eab308</CssParameter>
              <CssParameter name="stroke-width">4</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>
      </FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>
