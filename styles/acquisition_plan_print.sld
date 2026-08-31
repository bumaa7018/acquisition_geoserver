<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor version="1.0.0"
  xmlns="http://www.opengis.net/sld"
  xmlns:ogc="http://www.opengis.net/ogc"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.0.0/StyledLayerDescriptor.xsd">
  <NamedLayer>
    <Name>acquisition_plan_print</Name>
    <UserStyle>
      <Title>Төлөвлөгөөний хил</Title>
      <FeatureTypeStyle>
      <!-- ХЭВЛЭХЭД зориулсан хувилбар: ДҮҮРГЭЛТГҮЙ, зөвхөн хил.
           Дэлгэцийн (default) style нь дүүргэлттэй хэвээр — энэ style-ыг
           зөвхөн хэвлэх мөчид WMS-ийн STYLES параметрээр сольж дуудна. -->
        <Rule>
          <!-- 1) ДҮҮРГЭЛТ + ЦАГААН ДЭВСГЭР ХҮРЭЭ: хиймэл дагуулын зураг дээр
                  улбар шар шууд тавихад бараан газарт уусдаг тул доор нь
                  цайвар зузаан шугам тавьж хилийг тодруулна. -->
          <PolygonSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#ffffff</CssParameter>
              <CssParameter name="stroke-width">12</CssParameter>
              <CssParameter name="stroke-opacity">0.75</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
          <!-- 2) ҮНДСЭН ХҮРЭЭ: улбар шар, өмнөхөөс 2 дахин зузаан (2 → 4) -->
          <PolygonSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#ff7a00</CssParameter>
              <CssParameter name="stroke-width">8</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>
      </FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>
