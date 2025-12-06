import '../models/discovery_item.dart';

class DiscoveryData {
  static List<DiscoveryItem> getAllDiscoveries() {
    return [
      DiscoveryItem(
        number: 1,
        id: 'opera_nova',
        name: 'Opera Nova',
        category: 'Architektura',
        description: 'Opera Nova, położona malowniczo nad Brdą, to jeden z najbardziej charakterystycznych i nowoczesnych obiektów kulturalnych Bydgoszczy. '
            'Jej unikalna, cylindryczna architektura, z przeszklonymi fasadami, czyni ją ikoną miasta, szczególnie piękną nocą w odbiciu wody. '
            'Poza spektaklami operowymi, to dynamiczne centrum kulturalne jest również gospodarzem festiwali, koncertów i kongresów, stanowiąc serce artystycznego życia regionu.'
            'Uznawana za jeden z najpiękniejszych budynków operowych na świecie.',
        hint: 'Szukaj nowoczesnego budynku nad wodą przy Starym Rynku',
        address: 'ul. Marszałka Focha 5, 85-070 Bydgoszcz',
        latitude: 53.12448308545117,
        longitude: 17.997480561402845,
        tags: ['Kultura', 'Architektura', 'Nad wodą', 'Must-see'],
        rarity: 'legendary',
      ),
      
      DiscoveryItem(
        number: 2,
        id: 'wyspa_mlynska',
        name: 'Wyspa Młyńska',
        category: 'Historia',
        description: 'Historyczne serce przemysłowej Bydgoszczy. Od XV wieku znajdowały się '
            'tu młyny wodne wykorzystujące siłę Brdy. W XVI wieku działała tu mennica królewska. '
            'Zabytkowe spichlerze z XIX wieku przypominają o świetności przemysłu młynarskiego. '
            'Dziś to malownicza wyspa pełna historii i uroku.',
        hint: 'Wyspa na rzece Brdzie w centrum miasta, obok Starego Rynku',
        address: 'ul. Mennica 2, 85-112 Bydgoszcz',
        latitude: 53.1245,
        longitude: 18.0065,
        tags: ['Historia', 'Przemysł', 'Woda', 'Park'],
        rarity: 'legendary',
      ),

      DiscoveryItem(
        number: 3,
        id: 'mlyny_rothera',
        name: 'Młyny Rothera',
        category: 'Industrial',
        description: 'Monumentalny kompleks młynów z końca XIX wieku, symbol industrialnej '
            'potęgi Bydgoszczy. Zbudowany przez rodzinę Rotherów w 1896 roku. '
            'Sześciokondygnacyjny budynek z czerwonej cegły to perła architektury przemysłowej. '
            'Obecnie obiekt rewitalizowany, planowane centrum kulturalno-biznesowe.',
        hint: 'Wielki ceglany budynek przy Kanale Bydgoskim',
        address: 'ul. Mennica 10, 85-112 Bydgoszcz',
        latitude: 53.1238,
        longitude: 18.0072,
        tags: ['Industrial', 'Architektura', 'XIX wiek', 'Cegła'],
        rarity: 'legendary',
      ),

      DiscoveryItem(
        number: 4,
        id: 'stary_rynek',
        name: 'Stary Rynek',
        category: 'Centrum',
        description: 'Historyczny rynek z XIV wieku, serce Starego Miasta. '
            'Otoczony kolorowymi kamienicami w stylu secesyjnym i neogotyckimi ratuszami. '
            'Miejsce pełne restauracji, kawiarni i życia kulturalnego. '
            'Latem scena koncertów i festynów miejskich.',
        hint: 'Główny plac w centrum Starego Miasta',
        address: 'Stary Rynek, 85-105 Bydgoszcz',
        latitude: 53.1237,
        longitude: 18.0075,
        tags: ['Centrum', 'Historia', 'Restauracje', 'Wydarzenia'],
        rarity: 'rare',
      ),

      DiscoveryItem(
        number: 5,
        id: 'most_jagiellonski',
        name: 'Most Jagielloński',
        category: 'Zabytek',
        description: 'Zabytkowy most zwodzony z 1902 roku, unikatowy obiekt techniczny. '
            'Jedyny w Polsce most o konstrukcji z dwoma przęsłami zwodzonymi. '
            'Przepiękna stalowa konstrukcja w stylu secesyjnym. '
            'Most był świadkiem wielu historycznych wydarzeń.',
        hint: 'Stalowy most na Starym Kanale w centrum',
        address: 'ul. Jagiellońska, 85-097 Bydgoszcz',
        latitude: 53.1240,
        longitude: 18.0090,
        tags: ['Zabytek', 'Architektura', 'Most', 'Technika'],
        rarity: 'rare',
      ),

      DiscoveryItem(
        number: 6,
        id: 'przechodzacy_przez_rzeke',
        name: 'Przechodzący przez rzekę',
        category: 'Sztuka',
        description: 'Najbardziej rozpoznawalna rzeźba Bydgoszczy. Sześć postaci brodzących '
            'przez Brdę, symbol miasta. Dzieło Jerzego Kędziory z 2004 roku. '
            'Popularne miejsce spotkań i sesji zdjęciowych. '
            'Nocą pięknie podświetlone, tworzą magiczną atmosferę.',
        hint: 'Rzeźby w wodzie przy Mostowej',
        address: 'Most Mostowa, 85-034 Bydgoszcz',
        latitude: 53.1242,
        longitude: 18.0078,
        tags: ['Sztuka', 'Woda', 'Symbol miasta', 'Fotografia'],
        rarity: 'rare',
      ),

      DiscoveryItem(
        number: 7,
        id: 'europejskie_centrum_pieniadza',
        name: 'Europejskie Centrum Pieniądza',
        category: 'Museum',
        description: 'Unikalne muzeum numizmatyczne i historii pieniądza. '
            'Znajduje się w zabytkowej mennicy na Wyspie Młyńskiej. '
            'Kolekcja obejmuje monety z różnych epok i krajów. '
            'Interaktywne wystawy i warsztaty edukacyjne.',
        hint: 'Muzeum na Wyspie Młyńskiej przy ul. Mennicy',
        address: 'ul. Bernardyńska 12-14, 85-029 Bydgoszcz',
        latitude: 53.1243,
        longitude: 18.0067,
        tags: ['Museum', 'Historia', 'Edukacja', 'Pieniądze'],
        rarity: 'rare',
      ),

      DiscoveryItem(
        number: 8,
        id: 'wenecja_bydgoska',
        name: 'Wenecja Bydgoska',
        category: 'Widok',
        description: 'Malowniczy fragment miasta przy ujściu Młynówki do Brdy. '
            'Kolorowe kamieniczki odbijające się w wodzie przypominają Wenecję. '
            'Popularne miejsce spacerów i sesji fotograficznych. '
            'Najpiękniej o zachodzie słońca.',
        hint: 'Nad Brdą przy ul. Długiej, obok Wyspy Młyńskiej',
        address: 'ul. Długa, 85-034 Bydgoszcz',
        latitude: 53.1248,
        longitude: 18.0070,
        tags: ['Widok', 'Woda', 'Fotografia', 'Romantycznie'],
        rarity: 'rare',
      ),

      DiscoveryItem(
        number: 9,
        id: 'katedra_sw_marcina',
        name: 'Katedra św. Marcina i Mikołaja',
        category: 'Religia',
        description: 'Gotycka katedra z XV wieku, najważniejsza świątynia w Bydgoszczy. '
            'Wnętrze zachwyca polichromią Władysława Drągowskiego. '
            'Przepiękne witraże i zabytkowe organy. '
            'Miejsce ważnych uroczystości kościelnych i koncertów.',
        hint: 'Wysoka gotycka katedra przy ul. Fary',
        address: 'ul. Farna 2, 85-009 Bydgoszcz',
        latitude: 53.1233,
        longitude: 18.0083,
        tags: ['Religia', 'Gotyk', 'Historia', 'Koncerty'],
        rarity: 'common',
      ),

      DiscoveryItem(
        number: 10,
        id: 'czerwony_spichlerz',
        name: 'Czerwony Spichlerz',
        category: 'Zabytek',
        description: 'Zabytkowy spichlerz z XVIII wieku nad Brdą. '
            'Charakterystyczna czerwona fasada i barokowa architektura. '
            'Obecnie siedziba Muzeum Okręgowego. '
            'Parter mieści ciekawą wystawę o historii Bydgoszczy.',
        hint: 'Czerwony budynek nad Brdą w centrum',
        address: 'ul. Grodzka 9, 85-109 Bydgoszcz',
        latitude: 53.1241,
        longitude: 18.0081,
        tags: ['Zabytek', 'Museum', 'Barok', 'Nad wodą'],
        rarity: 'common',
      ),

      DiscoveryItem(
        number: 11,
        id: 'most_tramwajowy',
        name: 'Most Tramwajowy',
        category: 'Komunikacja',
        description: 'Stalowy most z 1915 roku, pierwotnie kolejowy. '
            'Obecnie służy tramwajom i pieszym. '
            'Piękny widok na Operę Nova i Stare Miasto. '
            'Miejsce popularnych zdjęć z przejeżdżającymi tramwajami.',
        hint: 'Most przy Operze Nova, jeżdżą tramwaje',
        address: 'Most tramwajowy, 85-009 Bydgoszcz',
        latitude: 53.1236,
        longitude: 18.0086,
        tags: ['Most', 'Komunikacja', 'Widok', 'Tramwaje'],
        rarity: 'common',
      ),

      DiscoveryItem(
        number: 12,
        id: 'ulica_cieszkowskiego',
        name: 'Ulica Cieszkowskiego',
        category: 'Architektura',
        description: 'Reprezentacyjna ulica z początku XX wieku. '
            'Secesyjne kamienice z pięknymi detalami architektonicznymi. '
            'Wiele budynków ozdobiono rzeźbami i kolorowymi ceramicznymi płytkami. '
            'Idealne miejsce dla miłośników architektury.',
        hint: 'Główna ulica handlowa w centrum, secesyjne kamienice',
        address: 'ul. Cieszkowskiego, 85-009 Bydgoszcz',
        latitude: 53.1230,
        longitude: 18.0077,
        tags: ['Architektura', 'Secesja', 'Ulica', 'Zakupy'],
        rarity: 'common',
      ),

      DiscoveryItem(
        number: 13,
        id: 'myslecinek',
        name: 'Myślęcinek',
        category: 'Natura',
        description: 'Ogromny kompleks leśno-parkowy na obrzeżach miasta. '
            'Zoo, ogrody botaniczne, plaże, ścieżki rowerowe. '
            'Jeden z największych parków miejskich w Polsce. '
            'Idealne miejsce na rodzinny wypoczynek i kontakt z naturą.',
        hint: 'Duży park z ZOO na północy miasta',
        address: 'ul. Gdańska 103, 85-674 Bydgoszcz',
        latitude: 53.1450,
        longitude: 18.0250,
        tags: ['Natura', 'Park', 'ZOO', 'Rodzinnie'],
        rarity: 'common',
      ),

      DiscoveryItem(
        number: 14,
        id: 'bulwar_nadrzeczny',
        name: 'Bulwar Nadrzeczny',
        category: 'Spacer',
        description: 'Przepiękny bulwar wzdłuż Brdy w centrum miasta. '
            'Idealne miejsce na spacery, jogging i relaks. '
            'Liczne kawiarnie i restauracje z widokiem na wodę. '
            'Latem pełno żaglówek i kajaków na rzece.',
        hint: 'Ścieżka wzdłuż rzeki Brdy w centrum',
        address: 'Bulwar Nadrzeczny, 85-009 Bydgoszcz',
        latitude: 53.1239,
        longitude: 18.0079,
        tags: ['Spacer', 'Woda', 'Relaks', 'Widoki'],
        rarity: 'common',
      ),

      DiscoveryItem(
        number: 15,
        id: 'kanal_bydgoski',
        name: 'Kanał Bydgoski',
        category: 'Historia',
        description: 'Zabytkowy kanał żeglugowy z XVIII wieku łączący Wisłę z Brdą. '
            'Jeden z najstarszych kanałów w Europie, ukończony w 1774 roku. '
            'Ważny szlak handlowy przez wieki. '
            'Dziś popularny szlak kajakowy i turystyczny.',
        hint: 'Kanał wodny biegnący przez miasto',
        address: 'Kanał Bydgoski, 85-009 Bydgoszcz',
        latitude: 53.1250,
        longitude: 18.0100,
        tags: ['Historia', 'Woda', 'Żegluga', 'Kajaki'],
        rarity: 'common',
      ),

      DiscoveryItem(
        number: 16,
        id: 'dom_pod_orlem',
        name: 'Dom Pod Orłem',
        category: 'Architektura',
        description: 'Przepiękna secesyjna kamienica przy Starym Rynku. '
            'Zbudowana w 1904 roku, ozdobiona rzeźbami i reliefami. '
            'Charakterystyczny orzeł na fasadzie dał nazwę budynkowi. '
            'Jedno z najładniejszych secesyjnych budynków w mieście.',
        hint: 'Kamienica ze złotym orłem na Starym Rynku',
        address: 'Stary Rynek 4, 85-105 Bydgoszcz',
        latitude: 53.1236,
        longitude: 18.0076,
        tags: ['Architektura', 'Secesja', 'Rynek', 'Zabytek'],
        rarity: 'common',
      ),

      DiscoveryItem(
        number: 17,
        id: 'fontanna_potop',
        name: 'Fontanna Potop',
        category: 'Sztuka',
        description: 'Nowoczesna fontanna multimedialna przy Operze Nova. '
            'Spektakle wodno-świetlne z muzyką. '
            'Latem miejsce spotkań i relaksu. '
            'Wieczorne pokazy przyciągają tłumy turystów.',
        hint: 'Fontanna przy Operze Nova i Placu Wolności',
        address: 'Plac Wolności, 85-009 Bydgoszcz',
        latitude: 53.1234,
        longitude: 18.0085,
        tags: ['Sztuka', 'Fontanna', 'Pokazy', 'Wieczór'],
        rarity: 'common',
      ),

      DiscoveryItem(
        number: 18,
        id: 'park_kochanowskiego',
        name: 'Park im. Kochanowskiego',
        category: 'Park',
        description: 'Zabytkowy park z XIX wieku w centrum miasta. '
            'Piękne alejki, stare drzewa i malownicze stawy. '
            'Monument Walki i Męczeństwa i inne pomniki historyczne. '
            'Ulubione miejsce spacerów mieszkańców.',
        hint: 'Duży park w centrum przy ul. Gdańskiej',
        address: 'ul. Gdańska 1, 85-006 Bydgoszcz',
        latitude: 53.1260,
        longitude: 18.0120,
        tags: ['Park', 'Historia', 'Przyroda', 'Spacer'],
        rarity: 'common',
      ),

      DiscoveryItem(
        number: 19,
        id: 'dluga',
        name: 'Ulica Długa',
        category: 'Ulica',
        description: 'Najstarsza ulica w Bydgoszczy, pamiętająca XIV wiek. '
            'Wąska, brukowana uliczka pełna klimatu. '
            'Zabytkowe kamieniczki i stare pawlacze. '
            'Idealne miejsce do fotografii klimatycznego Starego Miasta.',
        hint: 'Wąska uliczka między Starym Rynkiem a rzeką',
        address: 'ul. Długa, 85-034 Bydgoszcz',
        latitude: 53.1247,
        longitude: 18.0071,
        tags: ['Historia', 'Ulica', 'Stare Miasto', 'Klimat'],
        rarity: 'common',
      ),

      DiscoveryItem(
        number: 20,
        id: 'barka_lemara',
        name: 'Barka Lemara',
        category: 'Kultura',
        description: 'Kultowa pływająca kawiarnia i galeria sztuki na Brdzie. '
            'Miejsce spotkań artystów i bohemy bydgoskiej. '
            'Koncerty, wystawy i wydarzenia kulturalne. '
            'Niepowtarzalny klimat i widok z pokładu na rzekę.',
        hint: 'Żółta barka cumująca przy Starym Porcie',
        address: 'Stary Port, 85-105 Bydgoszcz',
        latitude: 53.1244,
        longitude: 18.0074,
        tags: ['Kultura', 'Kawiarnia', 'Sztuka', 'Woda'],
        rarity: 'common',
      ),
    ];
  }
}
