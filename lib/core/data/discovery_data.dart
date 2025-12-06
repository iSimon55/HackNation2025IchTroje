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
        description: 'Wyspa Młyńska to przestrzenne serce Bydgoszczy. Zielona enklawa w samym centrum 360-tysięcznego, '
        'tętniącego życiem miasta. Dotąd nie zagarnięta przez łapczywą współczesną cywilizację. Aż dziw! '
        'Park, aleje starych drzew: kasztanów, lip. Duże place trawników, alejki z ławeczkami, szum gwałtownie spadającej wody na jazie i przepuście.'
        'Dookoła woda.',
        hint: 'Zielona wyspa z parkami i zabytkami na Brdzie',
        address: 'ul. Mennica 10, 85-114 Bydgoszcz',
        latitude: 53.12284148564446,
        longitude: 17.995841101839385,
        tags: ['Historia', 'Przemysł', 'Woda', 'Park'],
        rarity: 'legendary',
      ),

      DiscoveryItem(
        number: 3,
        id: 'mlyny_rothera',
        name: 'Młyny Rothera',
        category: 'Industrial',
        description: 'Młyny Rothera to wyjątkowy obiekt na mapie Bydgoszczy. Ich historia sięga I połowy XIX wieku. Kompleks budynków położony w samym sercu miasta, '
        'na Wyspie Młyńskiej — niegdyś był obiektem przemysłowym, a po niedawnej rewitalizacji funkcjonuje jako Centrum Nauki i Kultury z bogatą ofertą wydarzeń. '
        'Jedną z atrakcji jest także bezpłatny taras widokowy. ',
        hint: 'Zabytkowe młyny na Wyspie Młyńskiej przy ul. Mennicy',
        address: 'ul. Mennica 10, 85-112 Bydgoszcz',
        latitude: 53.123639193750705,
        longitude: 17.99484051170082,
        tags: ['Industrial', 'Architektura', 'XIX wiek', 'Cegła', 'must-see'],
        rarity: 'legendary',
      ),

      DiscoveryItem(
        number: 4,
        id: 'stary_rynek',
        name: 'Stary Rynek',
        category: 'Centrum',
        description: 'To centralny plac miasta, przez który przebiega osiemnasty południk długości geograficznej wschodniej. Na tym samym południku leżą na przykład Kapsztad i Sztokholm.'
                    'Stary Rynek wytyczony został w 1346 roku, gdy król Kazimierz Wielki nadał Bydgoszczy prawa miejskie. Na przestrzeni wieków zabudowa Rynku wielokrotnie się zmieniała. '
                    'Ta, którą widzisz, pochodzi głównie z XIX w. Z dawnych opisów i wykopalisk wiadomo, że na środku Rynku znajdował się ratusz. Początkowo był prawdopodobnie drewniany i spłonął w pożarze miasta w 1425 r.'
                    'Kolejny był już murowany, w stylu gotyckim, ale i jego pochłonął ogień.',
        hint: 'Główny plac w centrum Starego Miasta',
        address: 'Stary Rynek, 85-105 Bydgoszcz',
        latitude: 53.122035363675835,        
        longitude: 18.00050072883637,
        tags: ['Centrum', 'Historia', 'Restauracje', 'Wydarzenia'],
        rarity: 'rare',
      ),

      DiscoveryItem(
        number: 5,
        id: 'most_jagielly',
        name: 'Most Władysława Jagiełły',
        category: 'Zabytek',
        description: 'Most wantowy na rzece Brdzie wybudowany w 2012 roku. Jeden z 45 mostów w Bydgoszczy. '
            'Służy głównie ruchowi tramwajowemu, lecz także pieszym i rowerzystom. ',
        hint: 'Most tramwajowy w centrum',
        address: 'ul. Jagiellońska, 85-097 Bydgoszcz',
        latitude: 53.12941257760773,
        longitude: 17.994651957143258,
        tags: ['Zabytek', 'Architektura', 'Most', 'Technika'],
        rarity: 'common',
      ),

      DiscoveryItem(
        number: 6,
        id: 'przechodzacy_przez_rzeke',
        name: 'Przechodzący przez rzekę',
        category: 'Sztuka',
        description: 'Rzeźba balansująca, zawieszona na linie, waży tylko 50 kg.'
                    'Autorem tej niezwykłej rzeźby jest Jerzy Kędziora. "Przechodzący" '
                    'zawitał do Bydgoszczy 1 maja 2004 dla upamiętnienia wejścia Polski do Unii Europejskiej.',
        hint: 'Tą Balansującą rzeźbę często znajdziesz na pocztówkach z Bydgoszczy',
        address: 'Most Staromiejski Sulimy-Kamińskiego, 85-034 Bydgoszcz',
        latitude: 53.12338975134721, 
        longitude: 18.001639755892587,
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
        address: 'ul. Mennica 4, 85-112 Bydgoszcz',
        latitude: 53.123307086334016,
        longitude: 17.997522346399823,
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
        latitude: 53.121604950027745,
        longitude: 17.996108021956132,
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
            'Miejsce ważnych uroczystości kościelnych i koncertów. Znajduje się w niej obraz Obraz Matki Bożej Pięknej Miłości.',
        hint: 'Wysoka gotycka katedra przy ul. Fary',
        address: 'ul. Farna 2, 85-101 Bydgoszcz',
        latitude: 53.123011941546046,
        longitude: 17.99909494760444,
        tags: ['Religia', 'Gotyk', 'Historia', 'Koncerty'],
        rarity: 'common',
      ),

      DiscoveryItem(
        number: 10,
        id: 'czerwony_spichlerz',
        name: 'Czerwony Spichlerz (Galeria Sztuki Nowoczesnej)',
        category: 'Zabytek',
        description: 'W latach 1786-88 w południowo-wschodniej części Wyspy Młyń­skiej stanął młyn wodny '
        'z sześcioma liniami przemiału mąki (tzw. Młyn Panzera). W 1828 został przebudowany, m.in. dobudowano trzy '
        'kolejne linie mączne oraz koła młyńskie. Obecny budynek powstał w 1861 roku jako młyn parowy z ośmioma liniami mielącymi. '
        'Nosił nazwę Młynu Camphausa, jednak charakterystyczna kolorystyka ceglanych elewacji sprawiła, że znany jest dziś jako Czerwony Spichrz. '
        'Po 1945 roku przeszedł na własność Skarbu Państwa, do 1974 roku po­zostając w dzierżawie Państwowych Zakładów Zbożowych. W 1979 roku przeszedł w użytkowanie, '
        'a w 1997 roku stał się własnością Muzeum Okręgowego im. Leona Wyczółkowskiego w Bydgoszczy. Ze względu na zły stan techniczny prezentowano tu głównie sezonowe '
        'wystawy sztuki współczesnej, obecnie mieści się tu Galeria Sztuki Nowoczesnej.',
        hint: 'Czerwony budynek nad Brdą w centrum',
        address: 'ul. Mennica 8a, 85-101 Bydgoszcz',
        latitude: 53.122525990149,
        longitude:  17.997292737293392,
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
