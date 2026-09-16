<?xml version="1.0" encoding="UTF-8"?>
<!--
  Нэгж талбарын төлөвийн НЭГДСЭН загвар — өнгө нь БҮРТГЭЛЭЭС ирнэ.

  ЯАГААД: өмнө нь төлөв бүрд тусдаа загвар байсан (parcel_s0.sld … parcel_s5.sld).
  Бүртгэлд шинэ төлөв нэмэхэд шинэ .sld бичиж, GeoServer-т ачаалж, шинэ давхарга
  нийтлэх шаардлагатай байв.

  Одоо өнгө нь `v_parcel_status` харагдацын `color` баганаас ШУУД уншигдана:

      <ogc:PropertyName>color</ogc:PropertyName>

  Тэр багана нь `parcel_status` хүснэгтээс гарна (migration 000033):

      COALESCE(ps.color, '#94a3b8') AS color

  ӨНГИЙГ ХҮСЭЛТЭЭР ДАМЖУУЛАХГҮЙ. Өмнө нь `&env=fill:%23f97316` байсан бөгөөд
  тэр нь гурван алдаатай байв:

    1. Өнгө нь бүртгэлийн шинж чанар атал дуудагч тал бүр (газрын зураг,
       хэвлэх, ирээдүйн клиент) түүнийг ДАВТАН илгээх үүрэгтэй болдог —
       нэг нь мартвал тэр газартаа саарал зурагдана.
    2. Дуудагч дур мэдэн өөр өнгө илгээж чадна: зураг нь бүртгэлтэй зөрнө.
    3. Өнгө солиход frontend-ийн кэш шинэчлэгдэх хүртэл хуучин өнгөөр
       зурагдана.

  Одоо `parcel_status` хүснэгтийн мөрийг засахад л хангалттай: GeoServer-т ч,
  frontend-д ч ямар ч өөрчлөлт хийхгүй.

  ӨГӨГДМӨЛ ӨНГӨ нь харагдац дотор (COALESCE) баригдсан тул энд NULL шалгах
  дүрэм шаардлагагүй — өнгө тохируулаагүй төлөв саарлаар зурагдана.
-->
<StyledLayerDescriptor version="1.0.0"
  xmlns="http://www.opengis.net/sld"
  xmlns:ogc="http://www.opengis.net/ogc"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.0.0/StyledLayerDescriptor.xsd">
  <NamedLayer>
    <Name>parcel_status</Name>
    <UserStyle>
      <Title>Нэгж талбар — төлөв (өнгө нь бүртгэлээс)</Title>
      <FeatureTypeStyle>
        <Rule>
          <Name>parcel_status</Name>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">
                <ogc:PropertyName>color</ogc:PropertyName>
              </CssParameter>
              <CssParameter name="fill-opacity">0.7</CssParameter>
            </Fill>
            <Stroke>
              <CssParameter name="stroke">
                <ogc:PropertyName>color</ogc:PropertyName>
              </CssParameter>
              <CssParameter name="stroke-width">1.5</CssParameter>
            </Stroke>
          </PolygonSymbolizer>
        </Rule>
      </FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>
