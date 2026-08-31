<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor version="1.0.0"
  xmlns="http://www.opengis.net/sld"
  xmlns:ogc="http://www.opengis.net/ogc"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.0.0/StyledLayerDescriptor.xsd">
  <NamedLayer>
    <Name>plan_acquisition</Name>
    <UserStyle>
      <Title>Үндсэн төлөвлөлтийн хил</Title>
      <Abstract>Нэг төлөвлөгөөний дугаарт хамаарах БҮХ чөлөөлөлтийн хил (бор/хүрэн).</Abstract>
      <FeatureTypeStyle>
        <Rule>
          <!-- 1) Дүүргэлт 70% (fill-opacity 0.70) + цайвар дэвсгэр хүрээ.
                  Хүрээний зузаан/тунгалаг нь acquisition_plan.sld-тэй адил
                  (дэвсгэр 6px/0.75, үндсэн шугам 4px). -->
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#8b5e34</CssParameter>
              <CssParameter name="fill-opacity">0.70</CssParameter>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#ffffff</CssParameter>
              <CssParameter name="stroke-width">6</CssParameter>
              <CssParameter name="stroke-opacity">0.75</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
          <!-- 2) ҮНДСЭН ХҮРЭЭ: хүрэн, ЭНГИЙН (тасралтгүй) шугам.
                  Төлөвлөгөөний хилээс зөвхөн ӨНГӨӨРӨӨ ялгарна. -->
          <PolygonSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#6b3f1d</CssParameter>
              <CssParameter name="stroke-width">4</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>
      </FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>
