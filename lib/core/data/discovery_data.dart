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
        description: 'To centralny plac miasta, przez który przebiega osiemnasty południk długości geograficznej wschodniej. Na tym samym południku leżą na przykład Kapsztad i Sztokholm. '
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
        tags: ['Architektura', 'Most', 'Technika'],
        rarity: 'common',
      ),

      DiscoveryItem(
        number: 6,
        id: 'przechodzacy_przez_rzeke',
        name: 'Przechodzący przez rzekę',
        category: 'Sztuka',
        description: 'Rzeźba balansująca, zawieszona na linie, waży tylko 50 kg. '
                    'Autorem tej niezwykłej rzeźby jest Jerzy Kędziora. "Przechodzący" '
                    'zawitał do Bydgoszczy 1 maja 2004 dla upamiętnienia wejścia Polski do Unii Europejskiej. ',
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
            'Interaktywne wystawy i warsztaty edukacyjne. ',
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
        id: 'ulica_cieszkowskiego',
        name: 'Ulica Cieszkowskiego',
        category: 'Architektura',
        description: 'Reprezentacyjna ulica z początku XX wieku. '
            'Secesyjne kamienice z pięknymi detalami architektonicznymi. '
            'Wiele budynków ozdobiono rzeźbami i kolorowymi ceramicznymi płytkami. '
            'Idealne miejsce dla miłośników architektury.',
        hint: 'Główna ulica handlowa w centrum, secesyjne kamienice',
        address: 'ul. Cieszkowskiego, 85-009 Bydgoszcz',
        latitude: 53.13087521468706,
        longitude: 18.006896233138274,
        tags: ['Architektura', 'Secesja', 'Ulica', 'Zakupy'],
        rarity: 'common',
      ),

      DiscoveryItem(
        number: 12,
        id: 'myslecinek',
        name: 'Myślęcinek',
        category: 'Natura',
        description: 'Ogromny kompleks leśno-parkowy na obrzeżach miasta. '
            'Zoo, ogrody botaniczne, plaże, ścieżki rowerowe. '
            'Jeden z największych parków miejskich w Polsce. '
            'Idealne miejsce na rodzinny wypoczynek i kontakt z naturą.',
        hint: 'Duży park z ZOO na północy miasta',
        address: 'ul. Gdańska 173, 85-674 Bydgoszcz',
        latitude: 53.16721611832878,
        longitude: 18.038909363687708,
        tags: ['Natura', 'Park', 'ZOO', 'Rodzinnie'],
        rarity: 'common',
      ),

      DiscoveryItem(
        number: 16,
        id: 'hotel_pod_orlem',
        name: 'Hotel Pod Orłem',
        category: 'Architektura',
        description: 'Hotel Pod Orłem to zabytkowy hotel przy ul. Gdańskiej 14 w centrum Bydgoszczy — został wzniesiony w latach 1893–1896 według' 
            'projektu wybitnego architekta Józef Święcicki. '
            'Jego bogato zdobiona fasada z orłem nad wejściem i wnętrza o stylu neobarokowym czynią go ikoną bydgoskiej architektury przełomu XIX i XX wieku.'
            'Obecnie hotel ma standard 4 gwiazdek, oferuje pokoje, restaurację, sale konferencyjne, a zarządzany jest przez sieć Focus Hotels. ',
        hint: 'Hotel ze złotym orłem na ul. Gdańskiej',
        address: 'Gdańska 14, 85-105 Bydgoszcz',
        latitude: 53.126090809677656,
        longitude: 18.003799918390953,
        tags: ['Architektura', 'Secesja', 'Rynek', 'Zabytek'],
        rarity: 'common',
      ),

      DiscoveryItem(
        number: 17,
        id: 'fontanna_potop',
        name: 'Fontanna Potop',
        category: 'Sztuka',
        description: 'Ten efektowny wodotrysk, autorstwa Ferdynanda Lepckego stanął w tym miejscu w 1904 r., w ówczesnym ogrodzie Regencji bydgoskiej. W dużym basenie, z czerwonego piaskowca, artysta umieścił kompozycję nawiązującą do biblijnego potopu. Pośrodku znajduje się kilkupostaciowa grupa wypiętrzona na wysokość 6. metrów - z muskularnym mężczyzną trzymającym omdlałą kobietę i z drugą martwą u jego nóg oraz z dzieckiem wspinającym się po niej. Po bokach znajdują się rzeźby: z jednej strony - mężczyzny walczącego o życie ze spowijającym go wężem, zaś z drugiej - niedźwiedzicy z martwym niedźwiadkiem. Wyjątkowości przydała całości nawierzchnia wokół fontanny wykonana w technice wielobarwnej, dekoracyjnej mozaiki z motywem fal.',
        hint: 'Fontanna przy Placu Wolności',
        address: 'Park im. Kazimierza Wielkiego, 85-980 Bydgoszcz',
        latitude: 53.12631099632849,
        longitude: 18.006020156271095,
        tags: ['Sztuka', 'Fontanna', 'Pokazy', 'Wieczór'],
        rarity: 'rare',
      ),

      DiscoveryItem(
        number: 18,
        id: 'park_kochanowskiego',
        name: 'Park im. Jana Kochanowskiego w Bydgoszczy',
        category: 'Park',
        description: 'Malowniczo wijące się alejki, rozległe tereny zielone, plac zabaw dla dzieci i wiele gatunków drzew i krzewów sprawiają, że park jest jednym z '
                  'ulubionych terenów rekreacyjnych mieszkańców. Z parkiem sąsiaduje Akademia Muzyczna, z okien której płynie muzyka, umilająca spacer. Najchętniej '
                  '„odwiedzaną” w parku rzeźbą jest Łuczniczka, ustawiona w 1960 r. na parkowym skwerze naprzeciwko Teatru Polskiego. W latach 70. XX wieku z inicjatywy '
                  'dyrektora Filharmonii Pomorskiej Andrzeja Szwalbego rozpoczęto tworzenie, tak zwanej, dzielnicy muzycznej. Park i okolice Filharmonii Pomorskiej '
                  'sukcesywnie upiększano rzeźbami kompozytorów i wirtuozów (m.in. F. Chopina, I. Paderewskiego, S. Moniuszki, H. Wieniawskiego, G. Bacewicz). '
                  'W parku znajduje się również kilka pomników przyrody: topola czarna, olsza sercolistna, kasztanowiec czerwony oraz dąb szypułkowy.',
        hint: 'Park muzyczny z rzeźbami kompozytorów przy Akademii Muzycznej',
        address: 'ul. 20 stycznia 1920 roku, 85-980 Bydgoszcz',
        latitude: 53.13017220311464,
        longitude: 18.01171467852984,
        tags: ['Park', 'Historia', 'Przyroda', 'Spacer'],
        rarity: 'common',
      ),

      DiscoveryItem(
        number: 19,
        id: 'dluga',
        name: 'Ulica Długa',
        category: 'Ulica',
        description: 'Najdłuższa ulica w Bydgoszczy (650,3 m). '
            'Spacerując ulicą Długą, wśród stylowych kamieniczek, głównie z końca XVIII '
            'i z początku XIX w., można poczuć klimat dawnej Bydgoszczy, choć niegdyś kupiecka arteria '
            'utraciła obecnie swoją pozycję handlowego centrum miasta. Warto zajrzeć do wyjątkowego Muzeum Mydła '
            'i Historii Brudu pod numerem 13-17, a także przystanąć przy XVII wiecznej kamienicy pod numerem 22, '
            'gdzie urodził się malarz Maksymilian Piotrowski (1813-1875), profesor Akademii Sztuk Pięknych w Królewcu.',
        hint: 'Najdłuższa ulica z klimatycznymi kamienicami w centrum',
        address: 'ul. Długa, 85-980 Bydgoszcz',
        latitude: 53.12114706035226,
        longitude: 17.999260140965763,
        tags: ['Historia', 'Ulica', 'Klimat'],
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
        address: 'ul. Spichlerna 1, 85-108 Bydgoszcz',
        latitude: 53.12354785066936,
        longitude: 18.00175769354636,
        tags: ['Kultura', 'Woda'],
        rarity: 'common',
      ),
      
      DiscoveryItem(
        number: 21,
        id: 'targi_wystawiennicze',
        name: 'Bydgoskie Centrum Targowo - Wystawiennicze',
        category: 'Kultura',
        description: 'Innowacyjne centrum targowo-wystawiennicze. ',
        hint: 'Miejsce organizacji HackNation 2025 - największego wydarzenia technologicznego w Polsce',
        address: 'ul. Spichlerna 1, 85-108 Bydgoszcz',
        latitude: 53.1709299038366, 
        longitude: 18.0473893792504,
        tags: ['Kultura', 'Woda'],
        rarity: 'common',
      ),
    ];
  }
}
