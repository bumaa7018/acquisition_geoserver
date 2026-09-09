<?xml version="1.0" encoding="UTF-8"?>
<!--
  ШИНЭ ЗӨВШИЛЦСӨН ЗУРАГ — ГУС: data_landuse.ca_agreed_parcel

  ДОТОРХ ТӨРЛӨӨР (work_type = бүтээн байгуулалтын ажлын төрөл) өнгө ялгана.

  ЯАГААД PropertyIsLike (тэнцүү биш):
  Эх өгөгдөл цэвэр БИШ — 48 өөр утга байгаа ч ихэнх нь ижил төрлийн бичилтийн
  зөрүү юм (хэмжсэн): "цахилгаан дамжуулах шугам" (1902), " цахилгаан дамжуулах
  шугам" (118, урдаа зайтай), "цахилгаан дамжуулах шугам " (15, хойноо зайтай);
  "дулааны шугам" (96) ба "дулааны шагум" (41, үсгийн алдаа); "авто зам, замын
  байгууламж" (575), "Авто зам..." (18, том үсэг), "авто зам, замынмбайгууламж"
  (8, үсгийн алдаа). Тэнцүүгээр тааруулбал эдгээр нь "бусад" болж хаягдана.
  Тиймээс ТҮЛХҮҮР ҮГЭЭР, том/жижиг үсэг үл хамааран (matchCase="false") таана.

  Дүрмүүд ХООРОНДОО давхцахгүй: түлхүүр үг тус бүр өөр өөр төрөлд л таарна
  ("ус хангамж" vs "ус зайлуулах" — хоёулаа "ус" агуулна ч түлхүүр нь өөр).
  Танигдаагүй бүхэн ElseFilter-ээр "Бусад" (саарал) болно.
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
      <Title>Шинэ зөвшилцсөн зураг (ажлын төрлөөр)</Title>
      <Abstract>ГУС: data_landuse.ca_agreed_parcel — work_type-аар өнгө ялгав</Abstract>
      <FeatureTypeStyle>

        <Rule>
          <Name>power_line</Name>
          <Title>Цахилгаан дамжуулах шугам</Title>
          <ogc:Filter>
            <ogc:PropertyIsLike wildCard="%" singleChar="_" escapeChar="\" matchCase="false">
              <ogc:PropertyName>work_type</ogc:PropertyName>
              <ogc:Literal>%цахилгаан%</ogc:Literal>
            </ogc:PropertyIsLike>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#eab308</CssParameter>
              <CssParameter name="fill-opacity">0.25</CssParameter>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#eab308</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>road</Name>
          <Title>Авто зам, замын байгууламж</Title>
          <ogc:Filter>
            <ogc:PropertyIsLike wildCard="%" singleChar="_" escapeChar="\" matchCase="false">
              <ogc:PropertyName>work_type</ogc:PropertyName>
              <ogc:Literal>%авто зам%</ogc:Literal>
            </ogc:PropertyIsLike>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#f97316</CssParameter>
              <CssParameter name="fill-opacity">0.25</CssParameter>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#f97316</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>walkway</Name>
          <Title>Явган ба дугуйн зам</Title>
          <ogc:Filter>
            <ogc:Or>
              <ogc:PropertyIsLike wildCard="%" singleChar="_" escapeChar="\" matchCase="false">
                <ogc:PropertyName>work_type</ogc:PropertyName>
                <ogc:Literal>%явган%</ogc:Literal>
              </ogc:PropertyIsLike>
              <ogc:PropertyIsLike wildCard="%" singleChar="_" escapeChar="\" matchCase="false">
                <ogc:PropertyName>work_type</ogc:PropertyName>
                <ogc:Literal>%дугуйн зам%</ogc:Literal>
              </ogc:PropertyIsLike>
            </ogc:Or>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#fb923c</CssParameter>
              <CssParameter name="fill-opacity">0.25</CssParameter>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#fb923c</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>heating</Name>
          <Title>Дулааны шугам</Title>
          <!-- "дулааны шагум" гэсэн үсгийн алдаа 41 мөр дээр бий — хоёуланг таана -->
          <ogc:Filter>
            <ogc:PropertyIsLike wildCard="%" singleChar="_" escapeChar="\" matchCase="false">
              <ogc:PropertyName>work_type</ogc:PropertyName>
              <ogc:Literal>%дулаан%</ogc:Literal>
            </ogc:PropertyIsLike>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#dc2626</CssParameter>
              <CssParameter name="fill-opacity">0.25</CssParameter>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#dc2626</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>water_supply</Name>
          <Title>Ус хангамж</Title>
          <ogc:Filter>
            <ogc:PropertyIsLike wildCard="%" singleChar="_" escapeChar="\" matchCase="false">
              <ogc:PropertyName>work_type</ogc:PropertyName>
              <ogc:Literal>%ус хангам%</ogc:Literal>
            </ogc:PropertyIsLike>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#06b6d4</CssParameter>
              <CssParameter name="fill-opacity">0.25</CssParameter>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#06b6d4</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>drainage</Name>
          <Title>Үерийн байгууламж, ус зайлуулах шугам</Title>
          <ogc:Filter>
            <ogc:Or>
              <ogc:PropertyIsLike wildCard="%" singleChar="_" escapeChar="\" matchCase="false">
                <ogc:PropertyName>work_type</ogc:PropertyName>
                <ogc:Literal>%үерийн%</ogc:Literal>
              </ogc:PropertyIsLike>
              <ogc:PropertyIsLike wildCard="%" singleChar="_" escapeChar="\" matchCase="false">
                <ogc:PropertyName>work_type</ogc:PropertyName>
                <ogc:Literal>%ус зайлуул%</ogc:Literal>
              </ogc:PropertyIsLike>
            </ogc:Or>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#0ea5e9</CssParameter>
              <CssParameter name="fill-opacity">0.25</CssParameter>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#0ea5e9</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>sewage</Name>
          <Title>Ариутгах татуурга</Title>
          <ogc:Filter>
            <ogc:PropertyIsLike wildCard="%" singleChar="_" escapeChar="\" matchCase="false">
              <ogc:PropertyName>work_type</ogc:PropertyName>
              <ogc:Literal>%ариутга%</ogc:Literal>
            </ogc:PropertyIsLike>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#7c3aed</CssParameter>
              <CssParameter name="fill-opacity">0.25</CssParameter>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#7c3aed</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>telecom</Name>
          <Title>Холбооны шугам</Title>
          <ogc:Filter>
            <ogc:PropertyIsLike wildCard="%" singleChar="_" escapeChar="\" matchCase="false">
              <ogc:PropertyName>work_type</ogc:PropertyName>
              <ogc:Literal>%холбоо%</ogc:Literal>
            </ogc:PropertyIsLike>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#d946ef</CssParameter>
              <CssParameter name="fill-opacity">0.25</CssParameter>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#d946ef</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>

        <Rule>
          <Name>other</Name>
          <Title>Бусад</Title>
          <!-- Дээрх аль ч түлхүүрт таараагүй (ГЧХ, сургууль, хоосон г.м.) -->
          <ElseFilter/>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#94a3b8</CssParameter>
              <CssParameter name="fill-opacity">0.22</CssParameter>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">#94a3b8</CssParameter>
              <CssParameter name="stroke-width">1.5</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>

      </FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>
