<?xml version="1.0" encoding="UTF-8"?>
<!--
  ШИНЭ ЗӨВШИЛЦСӨН ЗУРАГ — ГУС: data_landuse.ca_agreed_parcel

  ДЭД ТӨРЛӨӨР (`code` = зөвшилцсөн ажлын зориулалтын код) өнгө ялгана.

  ЯАГААД `code` (work_type биш):
  Өмнө нь `work_type` (чөлөөт текст) дээр түлхүүр үгээр таадаг байв. Тэр багана
  цэвэр БИШ — ижил төрөл 5-8 хувилбартай бичигдсэн (хэмжсэн: "дулааны шугам" 96,
  "дулааны шагум" 41 — үсгийн алдаа; "цахилгаан дамжуулах шугамULL" 2 г.м.).
  `code` нь ЦЭГЦТЭЙ бүхэл тоо (DescribeFeatureType: xsd:int) бөгөөс бүртгэлийн
  8 л утга авдаг (хэмжсэн, 3435 мөр):
     49 = 2035, 48 = 618, 53 = 151, 50 = 151, 52 = 150, 54 = 128, 51 = 106, 30 = 96
  Иймд шүүлт нь ЯГ ТЭНЦҮҮГЭЭР (PropertyIsEqualTo) бичигдэнэ.

  Нэр нь код бүрийн ЗОНХИЛОХ work_type-аас гарсан (хэмжсэн):
     30 → ГЧХ-3 / сургууль / төрийн байгууллага → барилга байгууламж
     48 → авто зам, замын байгууламж (571/618)
     49 → цахилгаан дамжуулах шугам (2027/2035)
     50 → ариутгах татуурга (140/151)
     51 → ус хангамж (100/106)
     52 → дулааны шугам (96/150 + "шагум" 41)
     53 → үерийн байгууламж, ус зайлуулах шугам (148/151)
     54 → холбооны шугам (117/128)

  БУДАЛТЫН ЗАРЧИМ (хэрэглэгчийн заасан):
    • ГАДНА хилийн зураас — тухайн ДЭД ТӨРЛИЙН өнгөөр (доторх торлолттойгоо
      ижил, дүүрэн өнгөөр). Ингэснээр төрөл нь зөвхөн доторх торноос бус
      хилээсээ ч шууд уншигдана.
    • ДОТОР тал — ИЖИЛ өнгөөр БҮДЭГ (сийрэг тунгалаг дүүргэлт) ба ТОРЛОСОН
      (GraphicFill: slash/times/plus/vertline...). Доорх нэгж талбар/дрон
      далдрахгүй, зэрэгцээ кодууд нь өнгө + торны хэлбэрээрээ ялгагдана.

  ӨНГӨ нь хэрэглэгчийн ирүүлсэн зурган дээрх (QGIS-ийн) тайлбартай таарна:
    48 шар-хүрэн, 49 улаан, 50 хурц ногоон, 51 хар цэнхэр, 52 ягаан,
    53 ногоон (торлосон), 54 нил ягаан. Зурган дээр БАЙХГҮЙ код (30, бусад)
    нь давхцахгүй өнгө авч ижил зарчмаар торлогдов.

  ЭНЭ ФАЙЛЫН ӨНГӨ нь frontend-ийн layer-config.ts (AGREED_CODE_LAYERS)-тай
  ЯГ ТААРАХ ёстой — давхаргын самбар дээрх дөрвөлжин зурагтай зөрвөл
  хэрэглэгч төөрөгдөнө. tests/map-layers.test.mjs үүнийг барина.
-->
<StyledLayerDescriptor version="1.0.0"
  xmlns="http://www.opengis.net/sld"
  xmlns:ogc="http://www.opengis.net/ogc"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.0.0/StyledLayerDescriptor.xsd">
  <NamedLayer>
    <Name>ca_agreed_parcel</Name>
    <UserStyle>
      <Title>Шинэ зөвшилцсөн зураг (кодоор)</Title>
      <Abstract>ГУС: data_landuse.ca_agreed_parcel — code баганаар өнгө/торлолт ялгав</Abstract>
      <FeatureTypeStyle>

        <Rule>
          <Name>code_30</Name>
          <Title>30 — Барилга байгууламж</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>code</ogc:PropertyName>
              <ogc:Literal>30</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#ddc9b3</CssParameter>
              <CssParameter name="fill-opacity">0.35</CssParameter>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <WellKnownName>shape://backslash</WellKnownName>
                    <Stroke>
                      <CssParameter name="stroke">#8b5a2b</CssParameter>
                      <CssParameter name="stroke-width">1</CssParameter>
                    </Stroke>
                  </Mark>
                  <Size>10</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#8b5a2b</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>code_48</Name>
          <Title>48 — Авто зам, замын байгууламж</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>code</ogc:PropertyName>
              <ogc:Literal>48</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#ffe0a8</CssParameter>
              <CssParameter name="fill-opacity">0.35</CssParameter>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <WellKnownName>shape://slash</WellKnownName>
                    <Stroke>
                      <CssParameter name="stroke">#ffa500</CssParameter>
                      <CssParameter name="stroke-width">1</CssParameter>
                    </Stroke>
                  </Mark>
                  <Size>10</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#ffa500</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>code_49</Name>
          <Title>49 — Цахилгаан дамжуулах шугам</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>code</ogc:PropertyName>
              <ogc:Literal>49</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#ffb3b3</CssParameter>
              <CssParameter name="fill-opacity">0.35</CssParameter>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <!-- Зурган дээрх 49 нь ХӨНДЛӨН (X) торлолттой — тэрийг хэвээр авав -->
                    <WellKnownName>shape://times</WellKnownName>
                    <Stroke>
                      <CssParameter name="stroke">#ff0000</CssParameter>
                      <CssParameter name="stroke-width">1</CssParameter>
                    </Stroke>
                  </Mark>
                  <Size>10</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#ff0000</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>code_50</Name>
          <Title>50 — Ариутгах татуурга</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>code</ogc:PropertyName>
              <ogc:Literal>50</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#b3f0b3</CssParameter>
              <CssParameter name="fill-opacity">0.35</CssParameter>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <!-- 50 ба 53 хоёулаа ЗУРГАН ДЭЭР ногоон — торны хэлбэрээр
                         (босоо ба тор) ялгав -->
                    <WellKnownName>shape://vertline</WellKnownName>
                    <Stroke>
                      <CssParameter name="stroke">#00cc00</CssParameter>
                      <CssParameter name="stroke-width">1</CssParameter>
                    </Stroke>
                  </Mark>
                  <Size>10</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#00cc00</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>code_51</Name>
          <Title>51 — Ус хангамж</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>code</ogc:PropertyName>
              <ogc:Literal>51</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#b3b3f0</CssParameter>
              <CssParameter name="fill-opacity">0.35</CssParameter>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <WellKnownName>shape://backslash</WellKnownName>
                    <Stroke>
                      <CssParameter name="stroke">#0000cd</CssParameter>
                      <CssParameter name="stroke-width">1</CssParameter>
                    </Stroke>
                  </Mark>
                  <Size>10</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#0000cd</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>code_52</Name>
          <Title>52 — Дулааны шугам</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>code</ogc:PropertyName>
              <ogc:Literal>52</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#ffd9e6</CssParameter>
              <CssParameter name="fill-opacity">0.35</CssParameter>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <WellKnownName>shape://horline</WellKnownName>
                    <Stroke>
                      <CssParameter name="stroke">#ff80b0</CssParameter>
                      <CssParameter name="stroke-width">1</CssParameter>
                    </Stroke>
                  </Mark>
                  <Size>10</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#ff80b0</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>code_53</Name>
          <Title>53 — Үерийн байгууламж, ус зайлуулах шугам</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>code</ogc:PropertyName>
              <ogc:Literal>53</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#bfe3ce</CssParameter>
              <CssParameter name="fill-opacity">0.35</CssParameter>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <!-- Зурган дээрх 53 нь ТОРЛОСОН (grid) — тэрийг хэвээр авав -->
                    <WellKnownName>shape://plus</WellKnownName>
                    <Stroke>
                      <CssParameter name="stroke">#2e8b57</CssParameter>
                      <CssParameter name="stroke-width">1</CssParameter>
                    </Stroke>
                  </Mark>
                  <Size>10</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#2e8b57</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>code_54</Name>
          <Title>54 — Холбооны шугам</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>code</ogc:PropertyName>
              <ogc:Literal>54</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#f0c2f0</CssParameter>
              <CssParameter name="fill-opacity">0.35</CssParameter>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <WellKnownName>shape://slash</WellKnownName>
                    <Stroke>
                      <CssParameter name="stroke">#cc44cc</CssParameter>
                      <CssParameter name="stroke-width">1</CssParameter>
                    </Stroke>
                  </Mark>
                  <Size>10</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#cc44cc</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>code_other</Name>
          <Title>Бусад код</Title>
          <!--
            Дээрх 8 кодод ороогүй (эсвэл code хоосон) объект. ГУС дээр шинэ код
            гарахад тэр өгөгдөл ЗУРАГДАХГҮЙ болохоос сэргийлнэ — frontend-ийн
            "Бусад код" дэд давхарга нь ЯГ эдгээрийг шүүж авдаг.
          -->
          <ElseFilter/>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#cbd5e1</CssParameter>
              <CssParameter name="fill-opacity">0.35</CssParameter>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <WellKnownName>shape://times</WellKnownName>
                    <Stroke>
                      <CssParameter name="stroke">#94a3b8</CssParameter>
                      <CssParameter name="stroke-width">1</CssParameter>
                    </Stroke>
                  </Mark>
                  <Size>10</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#94a3b8</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>

      </FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>
