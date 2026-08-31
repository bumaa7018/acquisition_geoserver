<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor version="1.0.0"
  xmlns="http://www.opengis.net/sld"
  xmlns:ogc="http://www.opengis.net/ogc"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.0.0/StyledLayerDescriptor.xsd">
  <NamedLayer>
    <Name>au1_boundary_print</Name>
    <UserStyle>
      <Title>Аймаг/Нийслэлийн хил (хэвлэх)</Title>
      <FeatureTypeStyle>
        <Rule>
          <!-- ХЭВЛЭХИЙН хувилбар: canvas нь хуудасныхаа ~3 дахин том пикселтэй
               тул дэлгэцийн 2px зураас хуудсан дээр 0.7px болж АЛГА БОЛДОГ.
               Иймд зөвхөн энд өргөнийг 3 дахин (2 → 6) нэмнэ. Дэлгэцийн
               au1_boundary style хэвээрээ. -->
          <PolygonSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#334155</CssParameter>
              <CssParameter name="stroke-width">6</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>
      </FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>
