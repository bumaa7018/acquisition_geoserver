<?xml version="1.0" encoding="UTF-8"?>
<!--
  ХАМГААЛАЛТЫН ЗУРВАС — ГУС: data_landuse.ca_sec_parcel

  ДЭД ТӨРЛӨӨР (`code` = хамгаалалтын зурвасын код) өнгө ялгана.

  ЯАГААД `code` (explan биш):
  Өмнө нь `explan` (чөлөөт текст) дээр түлхүүр үгээр таадаг байв — тэр нь
  30 гаруй бичилттэй ба нэг төрөл олон хувилбартай. `code` нь бүртгэлд
  ердөө 27 утга авдаг (хэмжсэн, 90201 мөр): 19 = 30295, 20 = 23599,
  22 = 10084, 23 = 9508, 1 = 8635, 45 = 5562, 7 = 1298, 8 = 361, 25 = 322,
  13 = 133, 11 = 116, 15 = 53, 17 = 43, 16 = 35, 10 = 33, 21 = 28, 3 = 20,
  26 = 13, 46 = 13, 47 = 12, 4 = 10, 5 = 10, 18 = 10, 6 = 3, 14 = 2, 24 = 2,
  2 = 1. Иймд шүүлт нь ЯГ ТЭНЦҮҮГЭЭР (PropertyIsEqualTo) бичигдэнэ.

  АНХААР: `code` нь ТЕКСТ багана (DescribeFeatureType: xsd:string) — CQL-д
  хашилттай ('19'), зөвшилцсөн зургийн `code` (int) шиг биш.

  Нэр нь код бүрийн ЗОНХИЛОХ `explan`-аас гарсан. Хоёр `explan`-тай
  кодуудыг нэгтгэв (1 = энгийн+онцгой, 13 = станц+шугам, 14 = гадаад+дотоод
  муж) — `code` тэднийг ялгаж чаддаггүй.

  БУДАЛТЫН ЗАРЧИМ (хэрэглэгчийн заасан):
    • ГАДНА хилийн зураас — тухайн дэд төрлийн өнгөөр (дүүрэн).
    • ДОТОР тал — ижил өнгөөр БҮДЭГ дүүргэлт ба ЦЭГЭН (тор БИШ) — GraphicFill
      дээр circle тэмдэг + graphic-margin-аар зайлуулав.

  ЭНЭ ФАЙЛ нь frontend-ийн layer-config.ts (SEC_CODE_LAYERS)-аас ҮҮСГЭГДСЭН
  (scripts-гүй, нэг удаагийн үүсгэлт) — өнгө/код/нэр гараар зөрөх боломжгүй.
  Өнгө сольсон бол layer-config.ts болон ЭНД хоёуланд нь сольж, тестээр
  шалга (tests/map-layers.test.mjs).
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
      <Title>Хамгаалалтын зурвас (кодоор)</Title>
      <Abstract>ГУС: data_landuse.ca_sec_parcel — code баганаар өнгө/цэгэн будалт ялгав</Abstract>
      <FeatureTypeStyle>

        <Rule>
          <Name>code_1</Name>
          <Title>1 — Усан сан бүхий газар (энгийн, онцгой)</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>code</ogc:PropertyName>
              <ogc:Literal>1</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#bbcaf3</CssParameter>
              <CssParameter name="fill-opacity">0.35</CssParameter>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <WellKnownName>circle</WellKnownName>
                    <Fill>
                      <CssParameter name="fill">#1d4ed8</CssParameter>
                    </Fill>
                  </Mark>
                  <Size>1.6</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#1d4ed8</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
            <!-- Цэгүүдийн хооронд зай — эс бөгөөс тэмдэг нь нягт байрлаж
                 будалт "дүүрэн" харагдана (цэгэн шинжээ алдана). -->
            <VendorOption name="graphic-margin">3</VendorOption>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>code_2</Name>
          <Title>2 — Усан сан бүхий газар (энгийн)</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>code</ogc:PropertyName>
              <ogc:Literal>2</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#c4dafc</CssParameter>
              <CssParameter name="fill-opacity">0.35</CssParameter>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <WellKnownName>circle</WellKnownName>
                    <Fill>
                      <CssParameter name="fill">#3b82f6</CssParameter>
                    </Fill>
                  </Mark>
                  <Size>1.6</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#3b82f6</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
            <!-- Цэгүүдийн хооронд зай — эс бөгөөс тэмдэг нь нягт байрлаж
                 будалт "дүүрэн" харагдана (цэгэн шинжээ алдана). -->
            <VendorOption name="graphic-margin">3</VendorOption>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>code_3</Name>
          <Title>3 — Ундны усны эх үүсвэрийн хориглолт</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>code</ogc:PropertyName>
              <ogc:Literal>3</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#b3daee</CssParameter>
              <CssParameter name="fill-opacity">0.35</CssParameter>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <WellKnownName>circle</WellKnownName>
                    <Fill>
                      <CssParameter name="fill">#0284c7</CssParameter>
                    </Fill>
                  </Mark>
                  <Size>1.6</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#0284c7</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
            <!-- Цэгүүдийн хооронд зай — эс бөгөөс тэмдэг нь нягт байрлаж
                 будалт "дүүрэн" харагдана (цэгэн шинжээ алдана). -->
            <VendorOption name="graphic-margin">3</VendorOption>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>code_4</Name>
          <Title>4 — Ундны усны эх үүсвэрийн эрүүл ахуй</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>code</ogc:PropertyName>
              <ogc:Literal>4</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#c3ebfd</CssParameter>
              <CssParameter name="fill-opacity">0.35</CssParameter>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <WellKnownName>circle</WellKnownName>
                    <Fill>
                      <CssParameter name="fill">#38bdf8</CssParameter>
                    </Fill>
                  </Mark>
                  <Size>1.6</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#38bdf8</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
            <!-- Цэгүүдийн хооронд зай — эс бөгөөс тэмдэг нь нягт байрлаж
                 будалт "дүүрэн" харагдана (цэгэн шинжээ алдана). -->
            <VendorOption name="graphic-margin">3</VendorOption>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>code_5</Name>
          <Title>5 — Булаг шандын хамгаалалт</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>code</ogc:PropertyName>
              <ogc:Literal>5</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#cac8f7</CssParameter>
              <CssParameter name="fill-opacity">0.35</CssParameter>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <WellKnownName>circle</WellKnownName>
                    <Fill>
                      <CssParameter name="fill">#4f46e5</CssParameter>
                    </Fill>
                  </Mark>
                  <Size>1.6</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#4f46e5</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
            <!-- Цэгүүдийн хооронд зай — эс бөгөөс тэмдэг нь нягт байрлаж
                 будалт "дүүрэн" харагдана (цэгэн шинжээ алдана). -->
            <VendorOption name="graphic-margin">3</VendorOption>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>code_6</Name>
          <Title>6 — Нуур цөөрмийн хамгаалалт</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>code</ogc:PropertyName>
              <ogc:Literal>6</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#b7e4f8</CssParameter>
              <CssParameter name="fill-opacity">0.35</CssParameter>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <WellKnownName>circle</WellKnownName>
                    <Fill>
                      <CssParameter name="fill">#0ea5e9</CssParameter>
                    </Fill>
                  </Mark>
                  <Size>1.6</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#0ea5e9</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
            <!-- Цэгүүдийн хооронд зай — эс бөгөөс тэмдэг нь нягт байрлаж
                 будалт "дүүрэн" харагдана (цэгэн шинжээ алдана). -->
            <VendorOption name="graphic-margin">3</VendorOption>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>code_7</Name>
          <Title>7 — Ойн сан бүхий газар</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>code</ogc:PropertyName>
              <ogc:Literal>7</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#b9d9c5</CssParameter>
              <CssParameter name="fill-opacity">0.35</CssParameter>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <WellKnownName>circle</WellKnownName>
                    <Fill>
                      <CssParameter name="fill">#15803d</CssParameter>
                    </Fill>
                  </Mark>
                  <Size>1.6</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#15803d</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
            <!-- Цэгүүдийн хооронд зай — эс бөгөөс тэмдэг нь нягт байрлаж
                 будалт "дүүрэн" харагдана (цэгэн шинжээ алдана). -->
            <VendorOption name="graphic-margin">3</VendorOption>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>code_8</Name>
          <Title>8 — Ой тэлэн ургах нөөц газар</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>code</ogc:PropertyName>
              <ogc:Literal>8</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#c9f5d9</CssParameter>
              <CssParameter name="fill-opacity">0.35</CssParameter>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <WellKnownName>circle</WellKnownName>
                    <Fill>
                      <CssParameter name="fill">#4ade80</CssParameter>
                    </Fill>
                  </Mark>
                  <Size>1.6</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#4ade80</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
            <!-- Цэгүүдийн хооронд зай — эс бөгөөс тэмдэг нь нягт байрлаж
                 будалт "дүүрэн" харагдана (цэгэн шинжээ алдана). -->
            <VendorOption name="graphic-margin">3</VendorOption>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>code_10</Name>
          <Title>10 — Бохир усны шугам</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>code</ogc:PropertyName>
              <ogc:Literal>10</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#daf0b9</CssParameter>
              <CssParameter name="fill-opacity">0.35</CssParameter>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <WellKnownName>circle</WellKnownName>
                    <Fill>
                      <CssParameter name="fill">#84cc16</CssParameter>
                    </Fill>
                  </Mark>
                  <Size>1.6</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#84cc16</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
            <!-- Цэгүүдийн хооронд зай — эс бөгөөс тэмдэг нь нягт байрлаж
                 будалт "дүүрэн" харагдана (цэгэн шинжээ алдана). -->
            <VendorOption name="graphic-margin">3</VendorOption>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>code_11</Name>
          <Title>11 — Геодезийн цэг, тэмдэгт</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>code</ogc:PropertyName>
              <ogc:Literal>11</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#b4e0d2</CssParameter>
              <CssParameter name="fill-opacity">0.35</CssParameter>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <WellKnownName>circle</WellKnownName>
                    <Fill>
                      <CssParameter name="fill">#059669</CssParameter>
                    </Fill>
                  </Mark>
                  <Size>1.6</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#059669</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
            <!-- Цэгүүдийн хооронд зай — эс бөгөөс тэмдэг нь нягт байрлаж
                 будалт "дүүрэн" харагдана (цэгэн шинжээ алдана). -->
            <VendorOption name="graphic-margin">3</VendorOption>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>code_13</Name>
          <Title>13 — Дулааны станц, шугам</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>code</ogc:PropertyName>
              <ogc:Literal>13</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#f5bebe</CssParameter>
              <CssParameter name="fill-opacity">0.35</CssParameter>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <WellKnownName>circle</WellKnownName>
                    <Fill>
                      <CssParameter name="fill">#dc2626</CssParameter>
                    </Fill>
                  </Mark>
                  <Size>1.6</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#dc2626</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
            <!-- Цэгүүдийн хооронд зай — эс бөгөөс тэмдэг нь нягт байрлаж
                 будалт "дүүрэн" харагдана (цэгэн шинжээ алдана). -->
            <VendorOption name="graphic-margin">3</VendorOption>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>code_14</Name>
          <Title>14 — Нисэх зурвас (гадаад, дотоод муж)</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>code</ogc:PropertyName>
              <ogc:Literal>14</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#bcc4dc</CssParameter>
              <CssParameter name="fill-opacity">0.35</CssParameter>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <WellKnownName>circle</WellKnownName>
                    <Fill>
                      <CssParameter name="fill">#1e3a8a</CssParameter>
                    </Fill>
                  </Mark>
                  <Size>1.6</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#1e3a8a</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
            <!-- Цэгүүдийн хооронд зай — эс бөгөөс тэмдэг нь нягт байрлаж
                 будалт "дүүрэн" харагдана (цэгэн шинжээ алдана). -->
            <VendorOption name="graphic-margin">3</VendorOption>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>code_15</Name>
          <Title>15 — Үерийн ус зайлуулах шугам</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>code</ogc:PropertyName>
              <ogc:Literal>15</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#b9eae4</CssParameter>
              <CssParameter name="fill-opacity">0.35</CssParameter>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <WellKnownName>circle</WellKnownName>
                    <Fill>
                      <CssParameter name="fill">#14b8a6</CssParameter>
                    </Fill>
                  </Mark>
                  <Size>1.6</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#14b8a6</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
            <!-- Цэгүүдийн хооронд зай — эс бөгөөс тэмдэг нь нягт байрлаж
                 будалт "дүүрэн" харагдана (цэгэн шинжээ алдана). -->
            <VendorOption name="graphic-margin">3</VendorOption>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>code_16</Name>
          <Title>16 — Үерийн далан</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>code</ogc:PropertyName>
              <ogc:Literal>16</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#c8ccd2</CssParameter>
              <CssParameter name="fill-opacity">0.35</CssParameter>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <WellKnownName>circle</WellKnownName>
                    <Fill>
                      <CssParameter name="fill">#475569</CssParameter>
                    </Fill>
                  </Mark>
                  <Size>1.6</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#475569</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
            <!-- Цэгүүдийн хооронд зай — эс бөгөөс тэмдэг нь нягт байрлаж
                 будалт "дүүрэн" харагдана (цэгэн шинжээ алдана). -->
            <VendorOption name="graphic-margin">3</VendorOption>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>code_17</Name>
          <Title>17 — Холбоо мэдээллийн шугам</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>code</ogc:PropertyName>
              <ogc:Literal>17</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#ecbef2</CssParameter>
              <CssParameter name="fill-opacity">0.35</CssParameter>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <WellKnownName>circle</WellKnownName>
                    <Fill>
                      <CssParameter name="fill">#c026d3</CssParameter>
                    </Fill>
                  </Mark>
                  <Size>1.6</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#c026d3</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
            <!-- Цэгүүдийн хооронд зай — эс бөгөөс тэмдэг нь нягт байрлаж
                 будалт "дүүрэн" харагдана (цэгэн шинжээ алдана). -->
            <VendorOption name="graphic-margin">3</VendorOption>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>code_18</Name>
          <Title>18 — Холбоо мэдээллийн станц</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>code</ogc:PropertyName>
              <ogc:Literal>18</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#fbe6fe</CssParameter>
              <CssParameter name="fill-opacity">0.35</CssParameter>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <WellKnownName>circle</WellKnownName>
                    <Fill>
                      <CssParameter name="fill">#f0abfc</CssParameter>
                    </Fill>
                  </Mark>
                  <Size>1.6</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#f0abfc</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
            <!-- Цэгүүдийн хооронд зай — эс бөгөөс тэмдэг нь нягт байрлаж
                 будалт "дүүрэн" харагдана (цэгэн шинжээ алдана). -->
            <VendorOption name="graphic-margin">3</VendorOption>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>code_19</Name>
          <Title>19 — Цахилгаан түгээх шугам /6-10kB/</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>code</ogc:PropertyName>
              <ogc:Literal>19</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#f9e8b5</CssParameter>
              <CssParameter name="fill-opacity">0.35</CssParameter>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <WellKnownName>circle</WellKnownName>
                    <Fill>
                      <CssParameter name="fill">#eab308</CssParameter>
                    </Fill>
                  </Mark>
                  <Size>1.6</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#eab308</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
            <!-- Цэгүүдийн хооронд зай — эс бөгөөс тэмдэг нь нягт байрлаж
                 будалт "дүүрэн" харагдана (цэгэн шинжээ алдана). -->
            <VendorOption name="graphic-margin">3</VendorOption>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>code_20</Name>
          <Title>20 — Цахилгаан дамжуулах шугам /35kB/</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>code</ogc:PropertyName>
              <ogc:Literal>20</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#fee4e4</CssParameter>
              <CssParameter name="fill-opacity">0.35</CssParameter>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <WellKnownName>circle</WellKnownName>
                    <Fill>
                      <CssParameter name="fill">#fca5a5</CssParameter>
                    </Fill>
                  </Mark>
                  <Size>1.6</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#fca5a5</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
            <!-- Цэгүүдийн хооронд зай — эс бөгөөс тэмдэг нь нягт байрлаж
                 будалт "дүүрэн" харагдана (цэгэн шинжээ алдана). -->
            <VendorOption name="graphic-margin">3</VendorOption>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>code_21</Name>
          <Title>21 — Цахилгаан дамжуулах шугам /110kB/</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>code</ogc:PropertyName>
              <ogc:Literal>21</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#eabbbb</CssParameter>
              <CssParameter name="fill-opacity">0.35</CssParameter>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <WellKnownName>circle</WellKnownName>
                    <Fill>
                      <CssParameter name="fill">#b91c1c</CssParameter>
                    </Fill>
                  </Mark>
                  <Size>1.6</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#b91c1c</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
            <!-- Цэгүүдийн хооронд зай — эс бөгөөс тэмдэг нь нягт байрлаж
                 будалт "дүүрэн" харагдана (цэгэн шинжээ алдана). -->
            <VendorOption name="graphic-margin">3</VendorOption>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>code_22</Name>
          <Title>22 — Цахилгааны дэд станц</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>code</ogc:PropertyName>
              <ogc:Literal>22</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#fac7c7</CssParameter>
              <CssParameter name="fill-opacity">0.35</CssParameter>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <WellKnownName>circle</WellKnownName>
                    <Fill>
                      <CssParameter name="fill">#ef4444</CssParameter>
                    </Fill>
                  </Mark>
                  <Size>1.6</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#ef4444</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
            <!-- Цэгүүдийн хооронд зай — эс бөгөөс тэмдэг нь нягт байрлаж
                 будалт "дүүрэн" харагдана (цэгэн шинжээ алдана). -->
            <VendorOption name="graphic-margin">3</VendorOption>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>code_23</Name>
          <Title>23 — Цахилгаан станц /6-10kB/</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>code</ogc:PropertyName>
              <ogc:Literal>23</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#fce2b6</CssParameter>
              <CssParameter name="fill-opacity">0.35</CssParameter>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <WellKnownName>circle</WellKnownName>
                    <Fill>
                      <CssParameter name="fill">#f59e0b</CssParameter>
                    </Fill>
                  </Mark>
                  <Size>1.6</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#f59e0b</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
            <!-- Цэгүүдийн хооронд зай — эс бөгөөс тэмдэг нь нягт байрлаж
                 будалт "дүүрэн" харагдана (цэгэн шинжээ алдана). -->
            <VendorOption name="graphic-margin">3</VendorOption>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>code_24</Name>
          <Title>24 — Цэвэрлэх байгууламж</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>code</ogc:PropertyName>
              <ogc:Literal>24</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#bdf2fa</CssParameter>
              <CssParameter name="fill-opacity">0.35</CssParameter>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <WellKnownName>circle</WellKnownName>
                    <Fill>
                      <CssParameter name="fill">#22d3ee</CssParameter>
                    </Fill>
                  </Mark>
                  <Size>1.6</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#22d3ee</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
            <!-- Цэгүүдийн хооронд зай — эс бөгөөс тэмдэг нь нягт байрлаж
                 будалт "дүүрэн" харагдана (цэгэн шинжээ алдана). -->
            <VendorOption name="graphic-margin">3</VendorOption>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>code_25</Name>
          <Title>25 — Цэвэр усны шугам</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>code</ogc:PropertyName>
              <ogc:Literal>25</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#b4e9f2</CssParameter>
              <CssParameter name="fill-opacity">0.35</CssParameter>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <WellKnownName>circle</WellKnownName>
                    <Fill>
                      <CssParameter name="fill">#06b6d4</CssParameter>
                    </Fill>
                  </Mark>
                  <Size>1.6</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#06b6d4</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
            <!-- Цэгүүдийн хооронд зай — эс бөгөөс тэмдэг нь нягт байрлаж
                 будалт "дүүрэн" харагдана (цэгэн шинжээ алдана). -->
            <VendorOption name="graphic-margin">3</VendorOption>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>code_26</Name>
          <Title>26 — Усан сангийн хамгаалалт</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>code</ogc:PropertyName>
              <ogc:Literal>26</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#b5dee8</CssParameter>
              <CssParameter name="fill-opacity">0.35</CssParameter>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <WellKnownName>circle</WellKnownName>
                    <Fill>
                      <CssParameter name="fill">#0891b2</CssParameter>
                    </Fill>
                  </Mark>
                  <Size>1.6</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#0891b2</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
            <!-- Цэгүүдийн хооронд зай — эс бөгөөс тэмдэг нь нягт байрлаж
                 будалт "дүүрэн" харагдана (цэгэн шинжээ алдана). -->
            <VendorOption name="graphic-margin">3</VendorOption>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>code_45</Name>
          <Title>45 — Автозам</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>code</ogc:PropertyName>
              <ogc:Literal>45</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#d7d4d3</CssParameter>
              <CssParameter name="fill-opacity">0.35</CssParameter>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <WellKnownName>circle</WellKnownName>
                    <Fill>
                      <CssParameter name="fill">#78716c</CssParameter>
                    </Fill>
                  </Mark>
                  <Size>1.6</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#78716c</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
            <!-- Цэгүүдийн хооронд зай — эс бөгөөс тэмдэг нь нягт байрлаж
                 будалт "дүүрэн" харагдана (цэгэн шинжээ алдана). -->
            <VendorOption name="graphic-margin">3</VendorOption>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>code_46</Name>
          <Title>46 — Оршуулгын газар</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>code</ogc:PropertyName>
              <ogc:Literal>46</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#e5e3e2</CssParameter>
              <CssParameter name="fill-opacity">0.35</CssParameter>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <WellKnownName>circle</WellKnownName>
                    <Fill>
                      <CssParameter name="fill">#a8a29e</CssParameter>
                    </Fill>
                  </Mark>
                  <Size>1.6</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#a8a29e</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
            <!-- Цэгүүдийн хооронд зай — эс бөгөөс тэмдэг нь нягт байрлаж
                 будалт "дүүрэн" харагдана (цэгэн шинжээ алдана). -->
            <VendorOption name="graphic-margin">3</VendorOption>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>code_47</Name>
          <Title>47 — Оршуулгын газрын хамгаалалт</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>code</ogc:PropertyName>
              <ogc:Literal>47</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#cdcbca</CssParameter>
              <CssParameter name="fill-opacity">0.35</CssParameter>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <WellKnownName>circle</WellKnownName>
                    <Fill>
                      <CssParameter name="fill">#57534e</CssParameter>
                    </Fill>
                  </Mark>
                  <Size>1.6</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#57534e</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
            <!-- Цэгүүдийн хооронд зай — эс бөгөөс тэмдэг нь нягт байрлаж
                 будалт "дүүрэн" харагдана (цэгэн шинжээ алдана). -->
            <VendorOption name="graphic-margin">3</VendorOption>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>code_other</Name>
          <Title>Бусад код</Title>
          <ElseFilter/>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#dfe3ea</CssParameter>
              <CssParameter name="fill-opacity">0.35</CssParameter>
            </Fill>
          </PolygonSymbolizer>
          <PolygonSymbolizer>
            <Fill>
              <GraphicFill>
                <Graphic>
                  <Mark>
                    <WellKnownName>circle</WellKnownName>
                    <Fill>
                      <CssParameter name="fill">#94a3b8</CssParameter>
                    </Fill>
                  </Mark>
                  <Size>1.6</Size>
                </Graphic>
              </GraphicFill>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#94a3b8</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
            <!-- Цэгүүдийн хооронд зай — эс бөгөөс тэмдэг нь нягт байрлаж
                 будалт "дүүрэн" харагдана (цэгэн шинжээ алдана). -->
            <VendorOption name="graphic-margin">3</VendorOption>
          </PolygonSymbolizer>
        </Rule>

      </FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>
