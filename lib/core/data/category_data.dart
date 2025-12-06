import '../models/category_info.dart';

class CategoryData {
  static CategoryInfo getAboutApp() {
    return CategoryInfo(
      id: 'about_app',
      title: 'O aplikacji',
      emoji: '📍',
      description: 'Odkryj Bydgoszcz - Twój przewodnik po mieście',
      sections: [
        CategorySection(
          title: 'Witaj w Odkryj Bydgoszcz!',
          icon: '👋',
          content: 'Nasza aplikacja to Twój osobisty przewodnik po najpiękniejszych zakątkach Bydgoszczy. '
              'Odkrywaj ukryte perełki, poznawaj historię miasta i kolekcjonuj miejsca jako swój pamiętnik z podróży!',
        ),
        CategorySection(
          title: 'Główne funkcje',
          icon: '✨',
          content: '• Interaktywna mapa z atrakcjami\n'
              '• System odkrywania miejsc ze zdjęciami\n'
              '• Szczegółowe opisy zabytków\n'
              '• Nawigacja do każdego miejsca\n'
              '• Aktualne wydarzenia w mieście',
        ),
        CategorySection(
          title: 'Jak zacząć?',
          icon: '🚀',
          content: '1. Przejdź do zakładki "Odkryj"\n'
              '2. Zobacz listę miejsc do odkrycia\n'
              '3. Odwiedź miejsce i zrób zdjęcie\n'
              '4. Odblokuj pełne informacje o atrakcji!',
        ),
      ],
    );
  }

  static CategoryInfo getPublicTransport() {
    return CategoryInfo(
      id: 'public_transport',
      title: 'Bilety komunikacyjne',
      emoji: '🚊',
      description: 'Wszystko o komunikacji miejskiej w Bydgoszczy',
      sections: [
        CategorySection(
          title: 'Jak kupić bilet w tramwaju/autobusie?',
          icon: '🎫',
          content: 'W Bydgoszczy możesz kupić bilet bezpośrednio w pojeździe:\n\n'
              '• Biletomaty znajdują się przy drzwiach wejściowych\n'
              '• Akceptują monety i karty płatnicze (zbliżeniowo)\n'
              '• Wybierz rodzaj biletu na ekranie dotykowym\n'
              '• Kasuj bilet natychmiast po zakupie!',
        ),
        CategorySection(
          title: 'Rodzaje biletów',
          icon: '💳',
          content: 'Bilet jednorazowy (20 min): 3.00 zł\n'
              'Bilet jednorazowy (40 min): 4.50 zł\n'
              'Bilet jednorazowy (60 min): 6.00 zł\n'
              'Bilet 24-godzinny: 15.00 zł\n'
              'Bilet 72-godzinny: 30.00 zł\n\n'
              'Ulgowe: 50% ceny normalnej',
        ),
        CategorySection(
          title: 'Aplikacja mobilna',
          icon: '📱',
          content: 'Pobierz aplikację "jakdojade" lub "moBILET":\n\n'
              '• Kupuj bilety bez gotówki\n'
              '• Planuj trasę w czasie rzeczywistym\n'
              '• Aktywuj bilet przed wejściem do pojazdu\n'
              '• Wszystkie bilety w telefonie!',
        ),
        CategorySection(
          title: 'Ważne informacje',
          icon: '⚠️',
          content: '• Bilet musi być skasowany lub aktywny w aplikacji\n'
              '• Kontrolerzy często sprawdzają bilety\n'
              '• Mandat za brak biletu: 266 zł\n'
              '• Dzieci do lat 4 jeżdżą za darmo',
        ),
      ],
    );
  }

  static CategoryInfo getTravelPass() {
    return CategoryInfo(
      id: 'travel_pass',
      title: 'Bilet przejazdowy',
      emoji: '⚙️',
      description: 'Informacje o biletach długoterminowych',
      sections: [
        CategorySection(
          title: 'Karnet miesięczny',
          icon: '📅',
          content: 'Bilet miesięczny to najlepsza opcja dla regularnych pasażerów:\n\n'
              '• Normalny: 120 zł/miesiąc\n'
              '• Ulgowy: 60 zł/miesiąc\n'
              '• Ważny od 1. do ostatniego dnia miesiąca\n'
              '• Unlimited przejazdy w obrębie miasta',
        ),
        CategorySection(
          title: 'Gdzie kupić karnet?',
          icon: '🏪',
          content: 'Karnety miesięczne dostępne w:\n\n'
              '• Punktach obsługi pasażera ZDMiKP\n'
              '• Kioskach Ruchu\n'
              '• Aplikacji moBILET\n'
              '• Biletomatach stacjonarnych\n\n'
              'Lokalizacja punktów: www.zdmikp.bydgoszcz.pl',
        ),
        CategorySection(
          title: 'Karta miejska',
          icon: '💳',
          content: 'Bydgoska Karta Miejska to wygodne rozwiązanie:\n\n'
              '• Jedna karta na wszystkie bilety\n'
              '• Doładowuj online lub w punkcie obsługi\n'
              '• Przyłóż do czytnika przy wejściu\n'
              '• Dostępna dla osób z ulgami',
        ),
      ],
    );
  }

  static CategoryInfo getMustSee() {
    return CategoryInfo(
      id: 'must_see',
      title: 'Obowiązkowe atrakcje',
      emoji: '🎭',
      description: 'Top 10 miejsc, które musisz zobaczyć w Bydgoszczy',
      sections: [
        CategorySection(
          title: 'Wyspa Młyńska',
          icon: '🏭',
          content: 'Historyczne serce przemysłowej Bydgoszczy. Spacer wśród starych młynów, '
              'drewnianych mostków i kanałów. Idealne miejsce na zdjęcia!\n\n'
              'Czas zwiedzania: 30-45 min\nWstęp: Bezpłatny',
        ),
        CategorySection(
          title: 'Opera Nova',
          icon: '🎭',
          content: 'Futurystyczny gmach opery nad Brdą. Jeden z najpiękniejszych budynków '
              'operowych w Europie. Zobacz spektakl lub zwiedzaj podczas dni otwartych.\n\n'
              'Bilety: 50-200 zł\nRezerwacja: www.opera.bydgoszcz.pl',
        ),
        CategorySection(
          title: 'Stary Rynek',
          icon: '🏛️',
          content: 'Tętniące życiem serce miasta. Kolorowe kamieniczki, kawiarnie, '
              'restauracje i targ regionalnych produktów. Latem mnóstwo wydarzeń kulturalnych.\n\n'
              'Najlepszy czas: Piątek-niedziela wieczorem',
        ),
        CategorySection(
          title: 'Młyny Rothera',
          icon: '🏗️',
          content: 'Czerwone cegły i industrialny klimat. Dziś centrum handlowe, '
              'kiedyś potężny kompleks młynów. Zabytek techniki na światowym poziomie.\n\n'
              'Czynne: 9:00-21:00',
        ),
        CategorySection(
          title: 'Most Jagielloński',
          icon: '🌉',
          content: 'Kultowy czerwony most obrotowy nad Brdą. Symbol Bydgoszczy i '
              'jedno z najfotograficzniejszych miejsc. Zobacz go o zachodzie słońca!\n\n'
              'Lokalizacja: Przy Wyspie Młyńskiej',
        ),
      ],
    );
  }

  static CategoryInfo getWaterRoutes() {
    return CategoryInfo(
      id: 'water_routes',
      title: 'Bydgoszcz na wodzie',
      emoji: '🚢',
      description: 'Odkryj miasto z perspektywy Brdy i Kanału Bydgoskiego',
      sections: [
        CategorySection(
          title: 'Rejsy po Brdzie',
          icon: '⛴️',
          content: 'Kilka firm oferuje rejsy statkami po rzece:\n\n'
              '• Rejs turystyczny (60 min): 35-45 zł\n'
              '• Trasa: Stary Rynek → Wyspa Młyńska → Most Uniwersytecki\n'
              '• Odjazdy: Co godzinę 10:00-19:00 (sezon letni)\n'
              '• Rezerwacja: Przystań przy Operze Nova',
        ),
        CategorySection(
          title: 'Kanał Bydgoski',
          icon: '🛶',
          content: 'Najstarszy w Polsce kanał żeglowny (1774-1775)!\n\n'
              '• Długość: 24,7 km\n'
              '• Trasa rowerowa wzdłuż kanału\n'
              '• Wypożyczalnie kajaków\n'
              '• Malownicze widoki i zabytki techniki',
        ),
        CategorySection(
          title: 'Kajaki i rowery wodne',
          icon: '🚣',
          content: 'Aktywny wypoczynek na wodzie:\n\n'
              '• Wypożyczalnia przy Wyspie Młyńskiej\n'
              '• Kajak: 30 zł/godz, 80 zł/dzień\n'
              '• Rower wodny: 40 zł/godz\n'
              '• Nie wymagane uprawnienia!\n\n'
              'Tel: +48 52 123 45 67',
        ),
        CategorySection(
          title: 'Trasy wodne dla początkujących',
          icon: '🗺️',
          content: 'Polecane trasy dla początkujących:\n\n'
              '1. Wyspa Młyńska → Myślęcinek (5 km, 1h)\n'
              '2. Wokół Wyspy Młyńskiej (2 km, 30 min)\n'
              '3. Kanał Bydgoski → Czyżkówko (8 km, 2h)\n\n'
              'Zawsze zakładaj kapok!',
        ),
      ],
    );
  }

  static CategoryInfo? getCategoryById(String id) {
    switch (id) {
      case 'about_app':
        return getAboutApp();
      case 'public_transport':
        return getPublicTransport();
      case 'travel_pass':
        return getTravelPass();
      case 'must_see':
        return getMustSee();
      case 'water_routes':
        return getWaterRoutes();
      default:
        return null;
    }
  }
}
