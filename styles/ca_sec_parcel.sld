<?xml version="1.0" encoding="UTF-8"?>
<!--
  ХАМГААЛАЛТЫН ЗУРВАС — ГУС: data_landuse.ca_sec_parcel

  ДОТОРХ ТӨРЛӨӨР (explan = зурвасын төрлийн тайлбар) өнгө ялгана.

  ЯАГААД `explan`, `landuse` БИШ: `landuse` нь зөвхөн зориулалтын тоон код
  (5101, 3203, 4101 …) бөгөөд 20 мянган мөрийн 4148-д ХООСОН; харин `explan`
  нь зурвасын төрлийг БҮТНЭЭР бичдэг. Хэмжсэн тархалт:
      5561  Автозам
      4812  Усан сан бүхий газрын энгийн хамгаалалтын бүс
      3402  Цахилгаан станц хамгаалалтын бүс /6_10kB/
      3220  Усан сан бүхий газрын онцгой хамгаалалтын бүс
      1298  Ойн сан бүхий газар
       371  Цахилгаан дамжуулах шугамын хамгаалалтын бүс /35 kB/
       361  Ой тэлэн ургах нөөц газар
       322  Цэвэр усны шугамын хамгаалалтын бүс
       117  Дулааны станцын хамгаалалтын зурвас
       116  Геодезийн цэг тэмдэгтийн хамгаалалтын бүс
       107  Цахилгааны дэд станцын хамгаалалтын бүс
        52  Үерийн ус зайлуулах шугамын хамгаалалтын бүс

  Нэг төрөл нь хүчдэл/зэрэглэлээрээ (/6_10kB/, /35 kB/) хэд хуваагддаг тул
  ТҮЛХҮҮР ҮГЭЭР таана — хүчдэл нэмэгдэхэд style засах шаардлагагүй.

  Зурвас нь ХОРИГЛОХ утгатай тул төрөл бүр өөр өнгөтэй боловч БҮГД нь
  ташуу зураастай дүүргэлт + тасархай хүрээтэй: доор байгаа нэгж талбарууд
  харагдсаар байх ба "хязгаарлалтын бүс" гэдэг нь хэлбэрээрээ ойлгогдоно.
-->
<StyledLayerDescriptor version="1.0.0"
  xmlns="http://www.opengis.net/sld"
  xmlns:ogc="http://www.opengis.net/ogc"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.0.0/StyledLayerDescriptor.xsd">
  <NamedLayer>
    <Name>ca_sec_parcel</Name>
    <UserStyle>
      <Title>Хамгаалалтын зурвас (төрлөөр)</Title>
      <Abstract>ГУС: data_landuse.ca_sec_parcel — explan-аар өнгө ялгав</Abstract>
      <FeatureTypeStyle>

        <Rule>
          <Name>road</Name>
          <Title>Автозам</Title>
          <ogc:Filter>
            <ogc:PropertyIsLike wildCard="%" singleChar="_" escapeChar="\" matchCase="false">
              <ogc:PropertyName>explan</ogc:PropertyName>
              <ogc:Literal>%автозам%</ogc:Literal>
            </ogc:PropertyIsLike>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <WellKnownName>shape://slash</WellKnownName>
                    <Stroke>
                      <CssParameter name="stroke">#f97316</CssParameter>
                      <CssParameter name="stroke-width">1</CssParameter>
                    </Stroke>
                  </Mark>
                  <Size>10</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#f97316</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-dasharray">8 4</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>power</Name>
          <Title>Цахилгаан (станц, шугам, дэд станц)</Title>
          <ogc:Filter>
            <ogc:PropertyIsLike wildCard="%" singleChar="_" escapeChar="\" matchCase="false">
              <ogc:PropertyName>explan</ogc:PropertyName>
              <ogc:Literal>%цахилгаан%</ogc:Literal>
            </ogc:PropertyIsLike>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <WellKnownName>shape://slash</WellKnownName>
                    <Stroke>
                      <CssParameter name="stroke">#eab308</CssParameter>
                      <CssParameter name="stroke-width">1</CssParameter>
                    </Stroke>
                  </Mark>
                  <Size>10</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#eab308</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-dasharray">8 4</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>reservoir</Name>
          <Title>Усан сан бүхий газар (энгийн, онцгой)</Title>
          <ogc:Filter>
            <ogc:PropertyIsLike wildCard="%" singleChar="_" escapeChar="\" matchCase="false">
              <ogc:PropertyName>explan</ogc:PropertyName>
              <ogc:Literal>%усан сан%</ogc:Literal>
            </ogc:PropertyIsLike>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <WellKnownName>shape://slash</WellKnownName>
                    <Stroke>
                      <CssParameter name="stroke">#0ea5e9</CssParameter>
                      <CssParameter name="stroke-width">1</CssParameter>
                    </Stroke>
                  </Mark>
                  <Size>10</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#0ea5e9</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-dasharray">8 4</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>water_pipe</Name>
          <Title>Цэвэр ус, үерийн ус зайлуулах шугам</Title>
          <ogc:Filter>
            <ogc:Or>
              <ogc:PropertyIsLike wildCard="%" singleChar="_" escapeChar="\" matchCase="false">
                <ogc:PropertyName>explan</ogc:PropertyName>
                <ogc:Literal>%цэвэр ус%</ogc:Literal>
              </ogc:PropertyIsLike>
              <ogc:PropertyIsLike wildCard="%" singleChar="_" escapeChar="\" matchCase="false">
                <ogc:PropertyName>explan</ogc:PropertyName>
                <ogc:Literal>%үерийн%</ogc:Literal>
              </ogc:PropertyIsLike>
            </ogc:Or>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <WellKnownName>shape://slash</WellKnownName>
                    <Stroke>
                      <CssParameter name="stroke">#06b6d4</CssParameter>
                      <CssParameter name="stroke-width">1</CssParameter>
                    </Stroke>
                  </Mark>
                  <Size>10</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#06b6d4</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-dasharray">8 4</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>forest</Name>
          <Title>Ойн сан бүхий газар, ой тэлэн ургах нөөц</Title>
          <!-- "ой" нь бусад үгийн дотор ч гардаг тул БҮТЭН хэллэгээр таана -->
          <ogc:Filter>
            <ogc:Or>
              <ogc:PropertyIsLike wildCard="%" singleChar="_" escapeChar="\" matchCase="false">
                <ogc:PropertyName>explan</ogc:PropertyName>
                <ogc:Literal>%ойн сан%</ogc:Literal>
              </ogc:PropertyIsLike>
              <ogc:PropertyIsLike wildCard="%" singleChar="_" escapeChar="\" matchCase="false">
                <ogc:PropertyName>explan</ogc:PropertyName>
                <ogc:Literal>%ой тэлэн%</ogc:Literal>
              </ogc:PropertyIsLike>
            </ogc:Or>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <WellKnownName>shape://slash</WellKnownName>
                    <Stroke>
                      <CssParameter name="stroke">#16a34a</CssParameter>
                      <CssParameter name="stroke-width">1</CssParameter>
                    </Stroke>
                  </Mark>
                  <Size>10</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#16a34a</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-dasharray">8 4</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>heating</Name>
          <Title>Дулааны станц, шугам</Title>
          <ogc:Filter>
            <ogc:PropertyIsLike wildCard="%" singleChar="_" escapeChar="\" matchCase="false">
              <ogc:PropertyName>explan</ogc:PropertyName>
              <ogc:Literal>%дулаан%</ogc:Literal>
            </ogc:PropertyIsLike>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <WellKnownName>shape://slash</WellKnownName>
                    <Stroke>
                      <CssParameter name="stroke">#dc2626</CssParameter>
                      <CssParameter name="stroke-width">1</CssParameter>
                    </Stroke>
                  </Mark>
                  <Size>10</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#dc2626</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-dasharray">8 4</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>geodetic</Name>
          <Title>Геодезийн цэг, тэмдэгт</Title>
          <ogc:Filter>
            <ogc:PropertyIsLike wildCard="%" singleChar="_" escapeChar="\" matchCase="false">
              <ogc:PropertyName>explan</ogc:PropertyName>
              <ogc:Literal>%геодези%</ogc:Literal>
            </ogc:PropertyIsLike>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <WellKnownName>shape://slash</WellKnownName>
                    <Stroke>
                      <CssParameter name="stroke">#a855f7</CssParameter>
                      <CssParameter name="stroke-width">1</CssParameter>
                    </Stroke>
                  </Mark>
                  <Size>10</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#a855f7</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-dasharray">8 4</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>other</Name>
          <Title>Бусад</Title>
          <ElseFilter/>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <WellKnownName>shape://slash</WellKnownName>
                    <Stroke>
                      <CssParameter name="stroke">#94a3b8</CssParameter>
                      <CssParameter name="stroke-width">1</CssParameter>
                    </Stroke>
                  </Mark>
                  <Size>10</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#94a3b8</CssParameter>
              <CssParameter name="stroke-width">1.5</CssParameter>
              <CssParameter name="stroke-dasharray">6 4</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>

      </FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>
