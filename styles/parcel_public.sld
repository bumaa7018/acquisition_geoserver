<?xml version="1.0" encoding="UTF-8"?>
<!--
  Чөлөөлөлтөд өртсөн БҮХ нэгж талбар — НЭЭЛТТЭЙ (гадны систем) давхарга.

  Өнгө нь нэгж талбарын ЯВЦЫН (төлөвийн) кодоор тодорхойлогдох ба frontend-ийн
  PARCEL_STATUS_STYLES-тэй ЯГ ижил (src/types/index.ts):
    0 Хүлээгдэж буй        #64748b (саарал)
    1 Зөвшилцөх шатандаа   #facc15 (шар)
    2 Үнэлгээ хийх         #f97316 (улбар шар)
    3 Нөлөөлөгдсөн гарсан  #3b82f6 (цэнхэр)
    4 Татгалзсан           #ef4444 (улаан)
    5 Чөлөөлсөн            #22c55e (ногоон)

  Мөн ЯВЦЫН НЭР (status_name) нь газрын зураг дээр бичээсээр харагдана
  (ойртсон үед — 1:40000-аас том масштаб).
-->
<StyledLayerDescriptor version="1.0.0"
  xmlns="http://www.opengis.net/sld"
  xmlns:ogc="http://www.opengis.net/ogc"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.0.0/StyledLayerDescriptor.xsd">
  <NamedLayer>
    <Name>parcel_public</Name>
    <UserStyle>
      <Title>Чөлөөлөлтөд өртсөн нэгж талбар (явцаар)</Title>
      <Abstract>Явцын төлөвөөр өнгөөр ялгаж, явцын нэрийг бичээсээр харуулна</Abstract>
      <FeatureTypeStyle>

        <Rule>
          <Name>status_0</Name>
          <Title>Хүлээгдэж буй</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>status</ogc:PropertyName>
              <ogc:Literal>0</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#64748b</CssParameter>
              <CssParameter name="fill-opacity">0.55</CssParameter>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#64748b</CssParameter>
              <CssParameter name="stroke-width">1.2</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>

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
              <CssParameter name="fill">#facc15</CssParameter>
              <CssParameter name="fill-opacity">0.55</CssParameter>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#facc15</CssParameter>
              <CssParameter name="stroke-width">1.2</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>status_2</Name>
          <Title>Үнэлгээ хийх</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>status</ogc:PropertyName>
              <ogc:Literal>2</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#f97316</CssParameter>
              <CssParameter name="fill-opacity">0.55</CssParameter>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#f97316</CssParameter>
              <CssParameter name="stroke-width">1.2</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>

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
              <CssParameter name="fill">#3b82f6</CssParameter>
              <CssParameter name="fill-opacity">0.55</CssParameter>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#3b82f6</CssParameter>
              <CssParameter name="stroke-width">1.2</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>

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
              <CssParameter name="fill-opacity">0.55</CssParameter>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#ef4444</CssParameter>
              <CssParameter name="stroke-width">1.2</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>

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
              <CssParameter name="fill-opacity">0.55</CssParameter>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#22c55e</CssParameter>
              <CssParameter name="stroke-width">1.2</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>

        <!-- Танихгүй/шинэ төлөв — өнгөгүй үлдэхээс сэргийлж хар зураасаар -->
        <Rule>
          <Name>status_other</Name>
          <Title>Бусад</Title>
          <ElseFilter/>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#94a3b8</CssParameter>
              <CssParameter name="fill-opacity">0.35</CssParameter>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#475569</CssParameter>
              <CssParameter name="stroke-width">1</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>

        <!-- ЯВЦЫН НЭР — зөвхөн ойртсон үед (том масштаб) бичигдэнэ. Бүх
             масштабт бичвэл хот дүүрэн бичээс болж уншигдахаа болино. -->
        <Rule>
          <Name>status_label</Name>
          <Title>Явцын нэр</Title>
          <MaxScaleDenominator>40000</MaxScaleDenominator>
          <TextSymbolizer>
            <Label>
              <ogc:PropertyName>status_name</ogc:PropertyName>
            </Label>
            <Font>
              <CssParameter name="font-family">Noto Sans</CssParameter>
              <CssParameter name="font-family">DejaVu Sans</CssParameter>
              <CssParameter name="font-size">11</CssParameter>
              <CssParameter name="font-weight">bold</CssParameter>
            </Font>
            <LabelPlacement>
              <PointPlacement>
                <AnchorPoint>
                  <AnchorPointX>0.5</AnchorPointX>
                  <AnchorPointY>0.5</AnchorPointY>
                </AnchorPoint>
              </PointPlacement>
            </LabelPlacement>
            <Halo>
              <Radius>1.6</Radius>
              <Fill>
                <CssParameter name="fill">#ffffff</CssParameter>
                <CssParameter name="fill-opacity">0.85</CssParameter>
              </Fill>
            </Halo>
            <Fill>
              <CssParameter name="fill">#0f172a</CssParameter>
            </Fill>
            <VendorOption name="autoWrap">90</VendorOption>
            <VendorOption name="maxDisplacement">28</VendorOption>
            <VendorOption name="goodnessOfFit">0.3</VendorOption>
            <VendorOption name="partials">false</VendorOption>
          </TextSymbolizer>
        </Rule>

      </FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>
