<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor version="1.0.0"
  xmlns="http://www.opengis.net/sld"
  xmlns:ogc="http://www.opengis.net/ogc"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.0.0/StyledLayerDescriptor.xsd">
  <NamedLayer>
    <Name>parcel_acquisition</Name>
    <UserStyle>
      <Title>Нэгж талбар (статусаар)</Title>
      <FeatureTypeStyle>

        <!-- 1: Зөвшилцөх шатандаа — шар -->
        <Rule>
          <Name>status_1</Name>
          <Title>Зөвшилцөх шатандаа</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>status</ogc:PropertyName>
              <ogc:Literal>1</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#eab308</CssParameter>
              <CssParameter name="fill-opacity">0.20</CssParameter>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#eab308</CssParameter>
              <CssParameter name="stroke-width">1.5</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>

        <!-- 2: НОСК — улбар шар -->
        <Rule>
          <Name>status_2</Name>
          <Title>НОСК</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>status</ogc:PropertyName>
              <ogc:Literal>2</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#f97316</CssParameter>
              <CssParameter name="fill-opacity">0.20</CssParameter>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#f97316</CssParameter>
              <CssParameter name="stroke-width">1.5</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>

        <!-- 3: Нөлөөлөгдсөн гарсан — ягаан -->
        <Rule>
          <Name>status_3</Name>
          <Title>Нөлөөлөгдсөн гарсан</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>status</ogc:PropertyName>
              <ogc:Literal>3</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#ec4899</CssParameter>
              <CssParameter name="fill-opacity">0.20</CssParameter>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#ec4899</CssParameter>
              <CssParameter name="stroke-width">1.5</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>

        <!-- 4: Татгалзсан — улаан -->
        <Rule>
          <Name>status_4</Name>
          <Title>Татгалзсан</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>status</ogc:PropertyName>
              <ogc:Literal>4</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#ef4444</CssParameter>
              <CssParameter name="fill-opacity">0.20</CssParameter>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#ef4444</CssParameter>
              <CssParameter name="stroke-width">1.5</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>

        <!-- 5: Чөлөөлсөн — ногоон -->
        <Rule>
          <Name>status_5</Name>
          <Title>Чөлөөлсөн</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>status</ogc:PropertyName>
              <ogc:Literal>5</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#22c55e</CssParameter>
              <CssParameter name="fill-opacity">0.20</CssParameter>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#22c55e</CssParameter>
              <CssParameter name="stroke-width">1.5</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>

        <!-- Бусад / тодорхойгүй — саарал -->
        <Rule>
          <Name>status_other</Name>
          <Title>Бусад</Title>
          <ogc:Filter>
            <ogc:Not>
              <ogc:Or>
                <ogc:PropertyIsEqualTo><ogc:PropertyName>status</ogc:PropertyName><ogc:Literal>1</ogc:Literal></ogc:PropertyIsEqualTo>
                <ogc:PropertyIsEqualTo><ogc:PropertyName>status</ogc:PropertyName><ogc:Literal>2</ogc:Literal></ogc:PropertyIsEqualTo>
                <ogc:PropertyIsEqualTo><ogc:PropertyName>status</ogc:PropertyName><ogc:Literal>3</ogc:Literal></ogc:PropertyIsEqualTo>
                <ogc:PropertyIsEqualTo><ogc:PropertyName>status</ogc:PropertyName><ogc:Literal>4</ogc:Literal></ogc:PropertyIsEqualTo>
                <ogc:PropertyIsEqualTo><ogc:PropertyName>status</ogc:PropertyName><ogc:Literal>5</ogc:Literal></ogc:PropertyIsEqualTo>
              </ogc:Or>
            </ogc:Not>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#94a3b8</CssParameter>
              <CssParameter name="fill-opacity">0.15</CssParameter>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#94a3b8</CssParameter>
              <CssParameter name="stroke-width">1</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>

      </FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>
