import '../models/poi.dart';

class MockData {
  static List<POI> get allPOIs => [
        wyspaMlynska,
        mlynyRothera,
        operaNova,
        kanalBydgoski,
        staryRynek,
        europejskieCentrumPieniadza,
        mostMlynski,
      ];

  static POI get wyspaMlynska => POI(
        id: '1',
        name: 'Wyspa Młyńska',
        shortDescription: 'Historyczne serce przemysłowej Bydgoszczy',
        description:
            'Wyspa Młyńska to historyczne serce przemysłowej Bydgoszczy. Od XV wieku znajdowały się tu młyny wodne wykorzystujące siłę nurtu Brdy. To malownicze miejsce łączy historię z rekreacją - dziś można tu spacerować malowniczymi ścieżkami wśród zabytkowych spichlerzy.',
        images: [
          'https://images.unsplash.com/photo-1583608205776-bfd35f0d9f83?w=800',
          'https://images.unsplash.com/photo-1519677100203-a0e668c92439?w=800',
          'https://images.unsplash.com/photo-1543783207-ec64e4d95325?w=800',
        ],
        latitude: 53.1238,
        longitude: 18.0081,
        rating: 4.8,
        reviewCount: 1234,
        tags: ['Rekreacja', 'Historia', 'Woda', 'Rodzinnie'],
        address: 'ul. Mennica 2, 85-112 Bydgoszcz',
        openingHours: 'Czynne całą dobę',
        price: 'Darmowy dostęp',
        accessibility: [
          'Ścieżki dla wózków',
          'Parking w pobliżu',
          'Toalety dostępne'
        ],
        curiosities: [
          'W XVI wieku działała tu mennica królewska',
          'Młyny wykorzystywały siłę Brdy',
          'Zabytkowe spichlerze z XIX wieku',
        ],
        category: 'Historia',
      );

  static POI get mlynyRothera => POI(
        id: '2',
        name: 'Młyny Rothera',
        shortDescription: 'Industrialne dziedzictwo Bydgoszczy',
        description:
            'Młyny Rothera to symbol industrialnego rozwoju Bydgoszczy. Kompleks młynów powstał na przełomie XIX i XX wieku i stanowi doskonały przykład architektury przemysłowej tego okresu.',
        images: [
          'https://images.unsplash.com/photo-1518098268026-4e89f1a2cd8e?w=800',
          'https://images.unsplash.com/photo-1513002749550-c59d786b8e6c?w=800',
        ],
        latitude: 53.1245,
        longitude: 18.0095,
        rating: 4.6,
        reviewCount: 892,
        tags: ['Industrial', 'Historia', 'Architektura'],
        address: 'ul. Mennica 8, 85-112 Bydgoszcz',
        openingHours: 'Zewnątrz dostępne całą dobę',
        price: 'Bezpłatny',
        category: 'Industrial',
        curiosities: [
          'Największy młyn w Polsce na początku XX wieku',
          'Czerwona cegła charakterystyczna dla architektury industrialnej',
        ],
      );

  static POI get operaNova => POI(
        id: '3',
        name: 'Opera Nova',
        shortDescription: 'Nowoczesna architektura nad wodą',
        description:
            'Opera Nova to jeden z najbardziej charakterystycznych budynków współczesnej Bydgoszczy. Otoczona wodą, łączy nowoczesną architekturę z bogatym programem kulturalnym.',
        images: [
          'https://images.unsplash.com/photo-1514320291840-2e0a9bf2a9ae?w=800',
          'https://images.unsplash.com/photo-1518109714146-ca2d45d6bbb8?w=800',
        ],
        latitude: 53.1198,
        longitude: 18.0032,
        rating: 4.9,
        reviewCount: 1567,
        tags: ['Architektura', 'Kultura', 'Woda', 'Wydarzenia'],
        address: 'ul. Marszałka Focha 5, 85-070 Bydgoszcz',
        openingHours: 'Wg repertuaru',
        price: 'Wg biletu',
        category: 'Kultura',
        accessibility: [
          'Pełna dostępność dla osób z niepełnosprawnościami',
          'Winda',
          'Parking podziemny',
        ],
      );

  static POI get kanalBydgoski => POI(
        id: '4',
        name: 'Kanał Bydgoski',
        shortDescription: 'Wodna arteria miasta',
        description:
            'Kanał Bydgoski to jeden z najstarszych kanałów żeglownych w Polsce. Położony w malowniczej dolinie rzeki Brdy, łączy Bydgoszcz z Nakłem nad Notecią.',
        images: [
          'https://images.unsplash.com/photo-1605640840605-14ac1855827b?w=800',
        ],
        latitude: 53.1312,
        longitude: 17.9987,
        rating: 4.7,
        reviewCount: 654,
        tags: ['Woda', 'Historia', 'Natura', 'Sport wodny'],
        address: 'Kanał Bydgoski, Bydgoszcz',
        openingHours: 'Czynny całą dobę',
        price: 'Bezpłatny',
        category: 'Natura',
      );

  static POI get staryRynek => POI(
        id: '5',
        name: 'Stary Rynek',
        shortDescription: 'Serce Starego Miasta',
        description:
            'Stary Rynek w Bydgoszczy to miejsce tętniące życiem. Otoczony kamienicami w stylu secesyjnym, stanowi centrum kulturalne i społeczne miasta.',
        images: [
          'https://images.unsplash.com/photo-1533669955142-6a73332af4db?w=800',
        ],
        latitude: 53.1234,
        longitude: 18.0044,
        rating: 4.5,
        reviewCount: 2103,
        tags: ['Centrum', 'Secesja', 'Gastronomia', 'Zakupy'],
        address: 'Stary Rynek, 85-105 Bydgoszcz',
        openingHours: 'Czynny całą dobę',
        price: 'Bezpłatny',
        category: 'Centrum',
      );

  static POI get europejskieCentrumPieniadza => POI(
        id: '6',
        name: 'Europejskie Centrum Pieniądza',
        shortDescription: 'Unikalne muzeum historii pieniądza',
        description:
            'Europejskie Centrum Pieniądza to jedno z najciekawszych muzeów w Bydgoszczy. Prezentuje historię polskiego i europejskiego pieniądza.',
        images: [
          'https://images.unsplash.com/photo-1584291527905-1a1d7c2c4cde?w=800',
        ],
        latitude: 53.1230,
        longitude: 18.0078,
        rating: 4.4,
        reviewCount: 478,
        tags: ['Muzeum', 'Historia', 'Edukacja'],
        address: 'ul. Mennica 1, 85-112 Bydgoszcz',
        openingHours: 'Wt-Nd: 10:00-18:00',
        price: 'Bilet: 15 zł',
        category: 'Muzeum',
      );

  static POI get mostMlynski => POI(
        id: '7',
        name: 'Most Młyński',
        shortDescription: 'Historyczny most nad Brdą',
        description:
            'Most Młyński to jeden z najstarszych mostów w Bydgoszczy. Łączy brzegi Brdy w rejonie Wyspy Młyńskiej.',
        images: [
          'https://images.unsplash.com/photo-1519874179391-3ebc752241dd?w=800',
        ],
        latitude: 53.1236,
        longitude: 18.0084,
        rating: 4.3,
        reviewCount: 287,
        tags: ['Zabytek', 'Architektura', 'Woda'],
        address: 'Most Młyński, Bydgoszcz',
        openingHours: 'Czynny całą dobę',
        price: 'Bezpłatny',
        category: 'Zabytek',
      );

  static List<POI> getRecommended() {
    return [mlynyRothera, operaNova];
  }

  static List<POI> getNearby(String poiId, {int limit = 3}) {
    return allPOIs.where((poi) => poi.id != poiId).take(limit).toList();
  }
}
