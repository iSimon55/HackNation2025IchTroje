# HackNation2025 - Aplikacja Mobilna: Odkryj Bydgoszcz

**Autor:** Igor Simon  
**Data:** Grudzień 2025  
**Framework:** Flutter (Multi-platform)

---

## 🚀 Jak uruchomić aplikację

### Wymagania wstępne
- **Flutter SDK:** >= 3.7.2
- **Dart SDK:** >= 3.7.2
- **Android Studio** (dla Android) lub **Xcode** (dla iOS)
- **Emulator/Symulator** lub fizyczne urządzenie z włączoną opcją deweloperską

### Instalacja

1. **Sklonuj repozytorium:**
   ```bash
   git clone https://github.com/iSimon55/HackNation2025IchTroje.git
   cd HackNation2025
   ```

2. **Zainstaluj zależności Flutter:**
   ```bash
   flutter pub get
   ```

### Uruchomienie aplikacji

#### Na Androidzie:
```bash
# Sprawdź dostępne urządzenia
flutter devices

# Uruchom aplikację
flutter run
```

#### Na iOS (tylko macOS):
```bash
# Zainstaluj pod dependencies (pierwsze uruchomienie)
cd ios
pod install
cd ..

# Uruchom aplikację
flutter run
```

#### Na emulatorze/symulatorze:
```bash
# Uruchom emulator Android
flutter emulators --launch <emulator_id>

# Lub otwórz symulator iOS (macOS)
open -a Simulator

# Następnie uruchom aplikację
flutter run
```

### Uprawnienia

Aplikacja wymaga następujących uprawnień:
- 📍 **Lokalizacja** - do obliczania odległości do atrakcji i weryfikacji pozycji użytkownika
- 📷 **Aparat** - do robienia zdjęć atrakcji (odblokowanie miejsca)
- 🖼️ **Galeria** - do wybierania zdjęć z galerii
- 🌐 **Internet** - do otwierania linków zewnętrznych w przeglądarce

### Budowanie wersji produkcyjnej

#### Android APK:
```bash
flutter build apk --release
```

#### Android App Bundle (do Google Play):
```bash
flutter build appbundle --release
```

#### iOS:
```bash
flutter build ios --release
```

---

## 📦 Zainstalowane pakiety

- `cupertino_icons: ^1.0.8` - Ikony iOS
- `image_picker: ^1.0.7` - Wybieranie i robienie zdjęć
- `shared_preferences: ^2.2.2` - Lokalne przechowywanie danych
- `geolocator: ^10.1.0` - Usługi lokalizacji
- `url_launcher: ^6.2.2` - Otwieranie URL w przeglądarce
- `flutter_map: ^6.1.0` - Interaktywne mapy
- `latlong2: ^0.9.0` - Praca z współrzędnymi geograficznymi

---

## 📋 Spis Treści
1. [Wizja Projektu](#wizja-projektu)
2. [Grupa Docelowa](#grupa-docelowa)
3. [Blueprint: Widok 1 - Ekran Główny](#widok-1-ekran-główny)
4. [Blueprint: Widok 2 - Szczegóły POI](#widok-2-szczegóły-poi)
5. [System Designu](#system-designu)
6. [Architektura Techniczna](#architektura-techniczna)

---

## 🎯 Wizja Projektu

### Koncepcja
Aplikacja mobilna łącząca nowoczesną nawigację z bogatą historią i unikalną architekturą Bydgoszczy. Projekt kładzie nacisk na industrialne dziedzictwo miasta (Młyny Rothera, Kanał Bydgoski) oraz secesyjną estetykę Starego Miasta.

### Kluczowe Lokalizacje
- **Kanał Bydgoski** - wodna arteria miasta
- **Wyspa Młyńska** - historyczne centrum przemysłowe
- **Opera Nova** - nowoczesna architektura nad wodą
- **Młyny Rothera** - industrialne dziedzictwo
- **Stare Miasto** - secesyjna architektura

---

## 👥 Grupa Docelowa

### Turyści (70%)
- **Wiek:** 25-55 lat
- **Potrzeby:** 
  - Gotowe trasy tematyczne
  - Łatwa nawigacja
  - Audioprzewodniki
  - Informacje praktyczne (godziny, ceny)
- **Zachowania:** Planują wizytę 1-3 dni wcześniej, szukają "must-see" i autentycznych doświadczeń

### Mieszkańcy (30%)
- **Wiek:** 20-60 lat
- **Potrzeby:**
  - Ukryte miejsca i ciekawostki
  - Bieżące wydarzenia
  - Szybki dostęp do informacji
- **Zachowania:** Spontaniczne użycie, poszukiwanie lokalnych wydarzeń weekendowych

---

## 📱 WIDOK 1: EKRAN GŁÓWNY (NAWIGACJA I ODKRYWANIE)

### Hierarchia Wizualna (Top → Bottom)

#### 1. NAGŁÓWEK [SafeArea: 0-120px]
```
┌─────────────────────────────────────────┐
│  [Logo] ODKRYJ BYDGOSZCZ    [Avatar 🔔] │
│  ┌─────────────────────────────────────┐ │
│  │ 🔍 Szukaj miejsc, tras, wydarzeń... │ │
│  └─────────────────────────────────────┘ │
└─────────────────────────────────────────┘
```

**Komponenty:**
- **Logo/Tytuł** (Left, 16px padding)
  - Font: Bold, 20px
  - Kolor: `#2C3E50` (ciemny granatowy inspirowany stalą)
  - Opcjonalnie: Ikona młyna wodnego jako brand mark
  
- **Avatar + Notifications** (Right, 16px padding)
  - Avatar: Circular, 40x40px
  - Notifications Badge: Red dot indicator
  - Tap Action: Nawigacja do profilu użytkownika

- **Search Bar** (Full width, 12px margin)
  - Height: 48px
  - Background: `#F5F6FA` (jasny szary)
  - Border Radius: 24px
  - Icon: Search (Left, 16px padding)
  - Placeholder: "Szukaj miejsc, tras, wydarzeń..."
  - Function: Auto-suggest z kategoryzacją (POI/Trasy/Wydarzenia)

---

#### 2. HERO SEKCJA: QUICK ACTION [120-240px]
```
┌─────────────────────────────────────────┐
│  ╔═════════════════════════════════════╗ │
│  ║  🧭 ROZPOCZNIJ WYCIECZKĘ!           ║ │
│  ║  Najbliższe: Wyspa Młyńska (1.2km) ║ │
│  ╚═════════════════════════════════════╝ │
└─────────────────────────────────────────┘
```

**Specyfikacja:**
- **Container**
  - Height: 100px
  - Margin: 16px (wszystkie strony)
  - Gradient Background: 
    - Start: `#C9896A` (ciepła cegła)
    - End: `#A0674D` (ciemniejsza cegła)
  - Border Radius: 16px
  - Shadow: Elevation 4 (0px 4px 12px rgba(0,0,0,0.15))

- **Ikona** (Left, 24px padding)
  - Icon: Compass / Navigation
  - Size: 32x32px
  - Color: White

- **Tekst**
  - Primary: "ROZPOCZNIJ WYCIECZKĘ!" (Bold, 18px, White)
  - Secondary: "Najbliższe: [Nazwa POI] ([Dystans])" (Regular, 14px, White 80%)
  
- **Interakcja**
  - Tap: Otwiera nawigację do najbliższej zapisanej trasy lub najbliższego POI
  - Long Press: Pokaż menu wyboru (Wybierz trasę / Najbliższy punkt)

---

#### 3. KATEGORIE ODKRYWANIA [240-380px]
```
┌─────────────────────────────────────────┐
│ Odkrywaj Bydgoszcz        [Zobacz więcej →]│
│                                           │
│ ┌─────┐ ┌─────┐ ┌─────┐ ┌─────┐ ┌─────┐ │
│ │🏛️   │ │⚙️   │ │🚢   │ │📍   │ │🎭   │ │
│ │Sece-│ │Indu-│ │Szlak│ │Blisko│ │Wyda-│ │
│ │sja  │ │stry │ │Wodny│ │Mnie │ │rzenia│
│ └─────┘ └─────┘ └─────┘ └─────┘ └─────┘ │
└─────────────────────────────────────────┘
```

**Architektura:**
- **Container**
  - Height: 140px
  - Horizontal ScrollView (snap to center)
  - Padding: 16px (left/right), 8px (top/bottom)

- **Nagłówek Sekcji**
  - Text: "Odkrywaj Bydgoszcz" (SemiBold, 16px, `#2C3E50`)
  - Action: "Zobacz więcej →" (Regular, 14px, `#3498DB` - niebieski akcent)
  - Layout: Row with SpaceBetween

- **Kategoria Card** (5 elementów, horizontally scrollable)
  - Size: 100x100px
  - Spacing: 12px between cards
  - Background: White
  - Border Radius: 12px
  - Shadow: Elevation 2
  
  **Zawartość Karty:**
  1. **Ikona** (Top, Center, 24px padding-top)
     - Size: 40x40px
     - Style: Colored emoji lub custom icon
  
  2. **Label** (Bottom, Center, 8px padding-bottom)
     - Font: Medium, 12px
     - Color: `#34495E`
     - Max Lines: 2, TextAlign: Center

  **Kategorie (5 kart):**
  1. **Trasy Secesyjne** 🏛️
     - Ikona: Building/Classical Architecture
     - Kolor: `#D4AF37` (złoty)
     
  2. **Industrial Heritage** ⚙️
     - Ikona: Gear/Factory
     - Kolor: `#7F8C8D` (stal)
     
  3. **Szlaki Wodne** 🚢
     - Ikona: Ship/Water
     - Kolor: `#3498DB` (błękit wody)
     
  4. **Blisko Mnie** 📍
     - Ikona: Location Pin
     - Kolor: `#E74C3C` (czerwony)
     - Badge: Dynamiczna liczba POI w promieniu 1km
     
  5. **Wydarzenia** 🎭
     - Ikona: Calendar/Theatre Masks
     - Kolor: `#9B59B6` (fiolet)
     - Badge: Liczba wydarzeń dzisiaj

---

#### 4. POLECAMY DZIŚ [380-680px]
```
┌─────────────────────────────────────────┐
│ Polecamy Dziś                             │
│                                           │
│ ┌─────────────────────────────────────┐  │
│ │ [FOTO: Młyny Rothera]               │  │
│ │                                     │  │
│ │ Młyny Rothera                  ❤️   │  │
│ │ Industrial • Historia • 0.8km       │  │
│ └─────────────────────────────────────┘  │
│                                           │
│ ┌─────────────────────────────────────┐  │
│ │ [FOTO: Opera Nova]                  │  │
│ │                                     │  │
│ │ Opera Nova                     ❤️   │  │
│ │ Architektura • Kultura • 1.5km     │  │
│ └─────────────────────────────────────┘  │
└─────────────────────────────────────────┘
```

**Specyfikacja:**
- **Nagłówek**
  - Text: "Polecamy Dziś" (SemiBold, 18px)
  - Padding: 16px (left), 12px (top/bottom)

- **POI Card** (2 karty, vertically stacked)
  - Width: Full width - 32px margin
  - Height: 140px
  - Margin: 16px (horizontal), 8px (vertical)
  - Border Radius: 16px
  - Shadow: Elevation 3
  - Background: White

  **Layout Karty:**
  1. **Background Image** (Full card, with overlay)
     - Image: High-quality photo
     - Overlay: Linear gradient (transparent → `rgba(0,0,0,0.6)`)
     - Position: Cover (scaled to fill)

  2. **Content Overlay** (Absolute positioning)
     - Padding: 16px
     
     **Bottom Section:**
     - **Tytuł POI** (Bottom-left)
       - Font: Bold, 20px
       - Color: White
       - Text Shadow: 0px 2px 4px rgba(0,0,0,0.8)
     
     - **Tags** (Below title, 4px spacing)
       - Layout: Horizontal chips
       - Background: `rgba(255,255,255,0.2)`
       - Backdrop Blur: 8px
       - Padding: 6px 12px
       - Border Radius: 16px
       - Font: Regular, 12px, White
       - Separator: " • "
       - Content: [Kategoria] • [Subcategoria] • [Dystans]
     
     - **Favorite Button** (Top-right)
       - Icon: Heart (outline/filled)
       - Size: 32x32px
       - Background: `rgba(255,255,255,0.3)`
       - Backdrop Blur: 8px
       - Border Radius: 16px
       - Padding: 8px

  **Interakcja:**
  - Tap Card: Nawigacja do widoku szczegółów POI
  - Tap Heart: Toggle favorite status (animacja pulsowania)

---

#### 5. BOTTOM NAVIGATION BAR [Bottom SafeArea]
```
┌─────────────────────────────────────────┐
│  🏠      🗺️      ➕      ❤️      ☰     │
│ Home   Mapa   Trasy  Ulubione Więcej   │
└─────────────────────────────────────────┘
```

**Specyfikacja:**
- **Container**
  - Height: 64px + SafeArea bottom padding
  - Background: White
  - Top Border: 1px solid `#E5E7EB`
  - Shadow: 0px -2px 8px rgba(0,0,0,0.08)

- **Tab Items** (5 elementów, evenly distributed)
  
  **1. Home** 🏠
  - Icon: House / Home
  - Label: "Home"
  - Active Color: `#C9896A` (cegła)
  - Inactive Color: `#95A5A6`
  
  **2. Mapa** 🗺️
  - Icon: Map / Location
  - Label: "Mapa"
  - Action: Otwiera pełnoekranową mapę Bydgoszczy z wszystkimi POI
  
  **3. Trasy** ➕
  - Icon: Route / Path
  - Label: "Trasy"
  - Action: Lista wszystkich dostępnych tras tematycznych
  
  **4. Ulubione** ❤️
  - Icon: Heart (filled)
  - Label: "Ulubione"
  - Badge: Liczba zapisanych POI
  - Action: Lista ulubionych miejsc użytkownika
  
  **5. Więcej** ☰
  - Icon: Menu / Hamburger
  - Label: "Więcej"
  - Action: Otwiera menu z opcjami:
    - Ustawienia
    - Język (PL/EN/DE)
    - O aplikacji
    - Pomoc
    - Informacje o Bydgoszczy

- **Stan Aktywny**
  - Icon Scale: 1.1x
  - Label Font: SemiBold
  - Indicator: 3px line at top (color matches active color)
  - Animation: Smooth scale + color transition (200ms)

---

### Interakcje i Animacje (Widok 1)

#### Scroll Behavior
- **Header:** Sticky at top, slight blur on scroll
- **Search Bar:** Collapses to icon-only mode after 100px scroll
- **Categories:** Horizontal scroll with snap
- **Recommended:** Vertical scroll

#### Micro-interactions
- **Pull to Refresh:** Aktualizacja "Polecamy Dziś" i wydarzeń
- **Card Tap:** Ripple effect + scale animation (0.98x)
- **Favorite Toggle:** Heart animation (scale + color pulse)
- **Quick Action Button:** Subtle pulse animation co 5s (attention grabber)

#### Accessibility
- **Touch Targets:** Minimum 44x44px (iOS), 48x48px (Android)
- **Contrast Ratios:** WCAG AA compliant (4.5:1 for text)
- **Screen Reader:** Semantic labels dla wszystkich interakcyjnych elementów
- **Dynamic Type:** Supports system font scaling

---

## 📱 WIDOK 2: SZCZEGÓŁY POI (WYSPA MŁYŃSKA)

### Hierarchia Wizualna (Top → Bottom)

#### 1. HERO IMAGE GALLERY [0-320px]
```
┌─────────────────────────────────────────┐
│ ←                               ❤️ ↗️   │
│                                         │
│     [ZDJĘCIE: Wyspa Młyńska]           │
│                                         │
│                      ● ○ ○ ○ ○         │
└─────────────────────────────────────────┘
```

**Specyfikacja:**
- **Container**
  - Height: 320px (40vh on small screens)
  - Full width (edge-to-edge)
  - PageView dla galerii zdjęć

- **Image Display**
  - Fit: Cover (scaled to fill)
  - Quality: High-res (cache enabled)
  - Pan/Zoom: Enabled (double-tap to zoom)
  
- **Overlay Controls** (Absolute positioning)
  
  **Top Bar** [SafeArea + 16px]
  - Background: Linear gradient (top)
    - `rgba(0,0,0,0.6)` → transparent
  - Height: 56px
  
  - **Back Button** (Top-left, 16px padding)
    - Icon: Arrow back / Chevron left
    - Size: 32x32px
    - Background: `rgba(255,255,255,0.3)`
    - Backdrop Blur: 12px
    - Border Radius: 20px
    - Action: Navigate back
  
  - **Action Buttons** (Top-right, 16px padding)
    - Layout: Horizontal row, 12px spacing
    
    1. **Favorite Button**
       - Icon: Heart (outline/filled)
       - Size: 32x32px
       - Background: `rgba(255,255,255,0.3)`
       - Backdrop Blur: 12px
       - Border Radius: 20px
       - Animation: Toggle z scale pulse
    
    2. **Share Button**
       - Icon: Share / Upload
       - Size: 32x32px
       - Background: `rgba(255,255,255,0.3)`
       - Backdrop Blur: 12px
       - Border Radius: 20px
       - Action: Native share sheet (link, image, location)

  **Gallery Indicators** [Bottom, 16px padding]
  - Layout: Horizontal dots, center aligned
  - Active Dot:
    - Size: 8x8px
    - Color: White
    - Border Radius: 4px
  - Inactive Dots:
    - Size: 6x6px
    - Color: White 50%
    - Border Radius: 3px
  - Spacing: 8px between dots
  - Max Visible: 5 dots (scrollable for 6+ images)

---

#### 2. CONTENT HEADER [320-480px]
```
┌─────────────────────────────────────────┐
│                                         │
│  Wyspa Młyńska                          │
│  ⭐ 4.8 (1,234 opinii)                  │
│                                         │
│  #Rekreacja  #Historia  #Woda  #Rodzinnie│
│                                         │
└─────────────────────────────────────────┘
```

**Specyfikacja:**
- **Container**
  - Background: White
  - Border Radius: 24px 24px 0 0 (rounded top corners)
  - Margin Top: -24px (overlap z gallery)
  - Padding: 24px
  - Shadow: 0px -4px 12px rgba(0,0,0,0.08)

- **Tytuł POI**
  - Font: Bold, 28px
  - Color: `#2C3E50`
  - Line Height: 1.2
  - Margin Bottom: 8px

- **Rating Bar**
  - Layout: Horizontal row
  - Icon: Star (filled)
  - Color: `#F39C12` (złoty)
  - Rating: "4.8" (SemiBold, 16px, `#2C3E50`)
  - Reviews: "(1,234 opinii)" (Regular, 14px, `#7F8C8D`)
  - Spacing: 4px
  - Tap Action: Otwórz sekcję opinii (scroll to reviews section)

- **Tags Section**
  - Margin Top: 16px
  - Layout: Wrap (horizontal, multi-line if needed)
  - Spacing: 8px between tags

  **Tag Chip:**
  - Background: `#ECF0F1` (jasny szary)
  - Padding: 8px 16px
  - Border Radius: 20px
  - Font: Medium, 13px
  - Color: `#34495E`
  - Prefix: "#" character
  - Max Width: Auto (content-based)
  
  **Tag Categories:**
  - Activity Type: Rekreacja, Zwiedzanie, Sport
  - Theme: Historia, Architektura, Natura
  - Feature: Woda, Park, Restauracje
  - Audience: Rodzinnie, Romantycznie, Przyjaciele

---

#### 3. CALL-TO-ACTION BUTTONS [480-580px]
```
┌─────────────────────────────────────────┐
│  ┌─────────────────────────────────────┐│
│  │  🧭  PROWADŹ MNIE TAM              ││
│  └─────────────────────────────────────┘│
│                                         │
│  ┌──────────────────┐ ┌────────────────┐│
│  │ 🎧 Audioprzewodnik│ │ 📸 Galeria    ││
│  └──────────────────┘ └────────────────┘│
└─────────────────────────────────────────┘
```

**Specyfikacja:**
- **Container**
  - Padding: 24px (horizontal), 16px (vertical)
  - Background: White

- **Primary CTA: "Prowadź Mnie Tam"**
  - Width: Full width
  - Height: 56px
  - Background: `#3498DB` (niebieski akcent)
  - Border Radius: 28px
  - Shadow: Elevation 4
  
  **Content:**
  - Icon: Navigation / Compass (Left, 20px padding)
    - Size: 24x24px
    - Color: White
  - Text: "PROWADŹ MNIE TAM" (Bold, 16px, White, Uppercase)
  - Layout: Row, Center aligned
  
  **Interaction:**
  - Tap: Otwiera native maps app z kierunkiem do POI
  - Options: Google Maps / Apple Maps / Waze (user preference)
  - Fallback: In-app navigation view

- **Secondary CTAs** (Row, 2 buttons)
  - Spacing: 12px between buttons
  - Margin Top: 12px

  **1. Audioprzewodnik Button**
  - Width: 50% - 6px
  - Height: 48px
  - Background: `#ECF0F1` (jasny szary)
  - Border Radius: 24px
  
  **Content:**
  - Icon: Headphones (Left, 12px padding)
    - Size: 20x20px
    - Color: `#34495E`
  - Text: "Audioprzewodnik" (Medium, 14px, `#34495E`)
  
  **States:**
  - Not Available: Opacity 0.5, disabled
  - Playing: Icon changes to Pause, background `#E8F5E9`
  
  **2. Galeria Button**
  - Width: 50% - 6px
  - Height: 48px
  - Background: `#ECF0F1`
  - Border Radius: 24px
  
  **Content:**
  - Icon: Camera / Image (Left, 12px padding)
  - Text: "Galeria" (Medium, 14px, `#34495E`)
  - Badge: Photo count "24" (Small, right)

---

#### 4. OPIS HISTORYCZNY [580-880px]
```
┌─────────────────────────────────────────┐
│  O Miejscu                              │
│                                         │
│  Wyspa Młyńska to historyczne serce    │
│  przemysłowej Bydgoszczy. Od XV wieku  │
│  znajdowały się tu młyny wodne...      │
│                                         │
│  [Czytaj więcej ↓]                     │
│                                         │
│  ─────────────────────────────────────  │
│                                         │
│  💡 Ciekawostki                         │
│                                         │
│  • W XVI wieku działała tu mennica     │
│    królewska                            │
│  • Młyny wykorzystywały siłę Brdy      │
│  • Zabytkowe spichlerze z XIX wieku    │
│                                         │
└─────────────────────────────────────────┘
```

**Specyfikacja:**

**A. Opis Główny**
- **Container**
  - Padding: 24px
  - Background: White

- **Nagłówek "O Miejscu"**
  - Font: SemiBold, 20px
  - Color: `#2C3E50`
  - Margin Bottom: 12px

- **Text Content**
  - Font: Regular, 15px
  - Color: `#34495E`
  - Line Height: 1.6
  - Max Lines (Collapsed): 4
  - Text Alignment: Justify

- **Expand/Collapse Button**
  - Text: "Czytaj więcej ↓" / "Zwiń ↑"
  - Font: Medium, 14px
  - Color: `#3498DB`
  - Margin Top: 8px
  - Animation: Smooth expand (300ms)

**B. Ciekawostki Section**
- **Container**
  - Background: `#FFF9E6` (jasny żółty - papier)
  - Border Left: 4px solid `#F39C12` (złoty akcent)
  - Border Radius: 8px
  - Padding: 16px
  - Margin Top: 16px

- **Header**
  - Icon: Lightbulb (emoji or icon)
  - Text: "Ciekawostki" (SemiBold, 16px)
  - Color: `#E67E22` (pomarańczowy)
  - Margin Bottom: 12px

- **Lista Faktów**
  - Layout: Vertical list
  - Bullet: " • " (custom bullet character)
  - Spacing: 8px between items
  
  **List Item:**
  - Font: Regular, 14px
  - Color: `#34495E`
  - Line Height: 1.5
  - Padding Left: 8px (for bullet alignment)

---

#### 5. INFORMACJE PRAKTYCZNE [880-1080px]
```
┌─────────────────────────────────────────┐
│  📍 Lokalizacja i Godziny               │
│                                         │
│  ┌─────────────────────────────────────┐│
│  │ 📍 ul. Mennica 2, 85-112 Bydgoszcz ││
│  │    [Otwórz w mapach]                ││
│  └─────────────────────────────────────┘│
│                                         │
│  ┌─────────────────────────────────────┐│
│  │ 🕐 Czynne całą dobę                 ││
│  │    Darmowy dostęp                   ││
│  └─────────────────────────────────────┘│
│                                         │
│  ┌─────────────────────────────────────┐│
│  │ ♿ Dostępność                        ││
│  │    • Ścieżki dla wózków             ││
│  │    • Parking w pobliżu              ││
│  └─────────────────────────────────────┘│
└─────────────────────────────────────────┘
```

**Specyfikacja:**
- **Container**
  - Padding: 24px
  - Background: White

- **Nagłówek Sekcji**
  - Icon: Location Pin
  - Text: "Lokalizacja i Godziny" (SemiBold, 20px)
  - Margin Bottom: 16px

- **Info Cards** (3 karty, vertically stacked)
  
  **Card Structure:**
  - Background: `#F8F9FA`
  - Border: 1px solid `#E5E7EB`
  - Border Radius: 12px
  - Padding: 16px
  - Margin Bottom: 12px

  **1. Adres Card**
  - Icon: Map Pin (24px, `#E74C3C`)
  - Primary Text: "ul. Mennica 2, 85-112 Bydgoszcz"
    - Font: Medium, 15px
    - Color: `#2C3E50`
  - Action Link: "Otwórz w mapach"
    - Font: Regular, 13px
    - Color: `#3498DB`
    - Underline on tap
    - Action: Launch maps with coordinates

  **2. Godziny Card**
  - Icon: Clock (24px, `#27AE60`)
  - Primary Text: "Czynne całą dobę"
    - Font: Medium, 15px
    - Color: `#2C3E50`
  - Secondary Text: "Darmowy dostęp"
    - Font: Regular, 13px
    - Color: `#7F8C8D`
  
  **Warianty (Dynamic):**
  - Otwarte teraz: Green icon + "Otwarte • Zamyka o 18:00"
  - Zamknięte: Red icon + "Zamknięte • Otwiera o 9:00"
  - Sezonowe: Orange icon + "Sezonowo • Sprawdź szczegóły"

  **3. Dostępność Card**
  - Icon: Wheelchair (24px, `#3498DB`)
  - Primary Text: "Dostępność"
    - Font: SemiBold, 15px
    - Color: `#2C3E50`
  - List: Bullet points
    - " • Ścieżki dla wózków"
    - " • Parking w pobliżu"
    - " • Toalety dostępne"
  - Font: Regular, 14px
  - Color: `#34495E`
  - Line Height: 1.5

---

#### 6. W POBLIŻU [1080-1360px]
```
┌─────────────────────────────────────────┐
│  📍 W Pobliżu (do 500m)                 │
│                                         │
│  ┌──────┐  Europejskie Centrum    →   │
│  │[IMG] │  Pieniądza                   │
│  └──────┘  Museum • 300m               │
│                                         │
│  ┌──────┐  Most Młyński            →   │
│  │[IMG] │                              │
│  └──────┘  Zabytek • 150m              │
│                                         │
│  ┌──────┐  Stary Rynek             →   │
│  │[IMG] │                              │
│  └──────┘  Centrum • 450m              │
│                                         │
│  [Zobacz wszystkie w pobliżu]           │
└─────────────────────────────────────────┘
```

**Specyfikacja:**
- **Container**
  - Padding: 24px
  - Background: `#FAFBFC` (bardzo jasny szary)

- **Nagłówek**
  - Icon: Location Pin with radius indicator
  - Text: "W Pobliżu (do 500m)" (SemiBold, 20px)
  - Margin Bottom: 16px

- **POI List** (3-4 items)
  
  **List Item Card:**
  - Layout: Horizontal row
  - Height: 80px
  - Background: White
  - Border Radius: 12px
  - Margin Bottom: 12px
  - Padding: 12px
  - Shadow: Elevation 1
  
  **Components (Left → Right):**
  
  1. **Thumbnail Image** (Left)
     - Size: 64x64px
     - Border Radius: 8px
     - Fit: Cover
     - Placeholder: Category-specific icon
  
  2. **Content** (Center, flex)
     - **Nazwa POI**
       - Font: SemiBold, 16px
       - Color: `#2C3E50`
       - Max Lines: 1, ellipsis
     
     - **Metadata Row**
       - Layout: Horizontal, separator " • "
       - Font: Regular, 13px
       - Color: `#7F8C8D`
       - Content: [Kategoria] • [Dystans]
       - Example: "Museum • 300m"
  
  3. **Chevron Icon** (Right)
     - Icon: Arrow right / Chevron
     - Size: 20x20px
     - Color: `#BDC3C7`
     - Alignment: Center vertical

  **Interaction:**
  - Tap: Navigate to that POI's detail view
  - Ripple Effect: Subtle gray ripple

- **View All Button**
  - Width: Full width
  - Height: 44px
  - Background: Transparent
  - Border: 2px solid `#3498DB`
  - Border Radius: 22px
  - Margin Top: 8px
  
  **Text:**
  - "Zobacz wszystkie w pobliżu" (Medium, 14px, `#3498DB`)
  
  **Action:**
  - Opens map view filtered to 500m radius
  - Centers on current POI

---

#### 7. FOOTER PADDING [1360-1400px]
```
┌─────────────────────────────────────────┐
│                                         │
│         [Bottom Safe Area Space]        │
│                                         │
└─────────────────────────────────────────┘
```

**Specyfikacja:**
- Height: 40px + SafeArea bottom
- Background: `#FAFBFC`
- Funkcja: Zapewnia przestrzeń na home indicator (iOS) i wygodne scrollowanie

---

### Interakcje i Animacje (Widok 2)

#### Parallax Scroll Effect
- **Hero Image:** Scrolls at 0.5x speed (parallax effect)
- **Content Card:** Slides up over image with overlap
- **Back Button:** Fades out at 80px scroll, reveals navbar

#### Gestures
- **Swipe Right:** Back navigation (iOS style)
- **Pinch to Zoom:** In hero image gallery
- **Long Press Image:** Save image options
- **Pull Down:** Dismissive gesture (if modal)

#### State Management
- **Favorite Toggle:** 
  - Optimistic UI update
  - Sync with backend
  - Undo snackbar if fails

- **Audio Player:**
  - Sticky mini-player on scroll
  - Background playback support
  - Seek bar and controls

#### Loading States
- **Image Loading:** Shimmer placeholder
- **Content Loading:** Skeleton screens
- **Error State:** Retry button + error message

#### Accessibility
- **Semantic Navigation:** Proper heading hierarchy (H1 → H6)
- **Image Descriptions:** Alt text for screen readers
- **Focus Order:** Logical tab order for keyboard navigation
- **Audio Controls:** Accessible playback controls

---

## 🎨 SYSTEM DESIGNU

### Paleta Kolorów (Inspirowana Bydgoszczą)

#### Kolory Podstawowe
```
Primary (Cegła):
  #C9896A - Light Brick
  #A0674D - Dark Brick
  #8B4513 - Accent Brick

Secondary (Woda):
  #3498DB - Canal Blue
  #2980B9 - Deep Water
  #5DADE2 - Light Blue

Neutral (Stal):
  #2C3E50 - Dark Steel (Text Primary)
  #34495E - Medium Steel (Text Secondary)
  #7F8C8D - Light Steel (Text Tertiary)
  #BDC3C7 - Border Gray
  #ECF0F1 - Background Gray
  #F8F9FA - Light Background
```

#### Kolory Funkcjonalne
```
Success: #27AE60 (Otwarte, Sukces)
Warning: #F39C12 (Uwaga, Sezonowe)
Error: #E74C3C (Zamknięte, Błąd)
Info: #3498DB (Informacja)
```

#### Kolory Akcentowe (Kategorie)
```
Secesja: #D4AF37 (Złoty)
Industrial: #7F8C8D (Stal)
Natura: #27AE60 (Zieleń)
Kultura: #9B59B6 (Fiolet)
Gastronomia: #E67E22 (Pomarańcz)
```

---

### Typografia

#### Font Family
**Primary:** System Default
- iOS: SF Pro
- Android: Roboto
- Fallback: -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif

#### Type Scale
```
H1 (Hero): 28px / Bold / 1.2 line height
H2 (Section): 20px / SemiBold / 1.3
H3 (Subsection): 18px / SemiBold / 1.4
Body Large: 16px / Regular / 1.5
Body: 15px / Regular / 1.6
Body Small: 14px / Regular / 1.5
Caption: 13px / Regular / 1.4
Label: 12px / Medium / 1.3
```

#### Font Weights
```
Regular: 400
Medium: 500
SemiBold: 600
Bold: 700
```

---

### Spacing System (8px Grid)

```
XXS: 4px   (Tight spacing, icons)
XS: 8px    (Between related elements)
S: 12px    (Card padding, small gaps)
M: 16px    (Standard padding, standard gaps)
L: 24px    (Section padding, large gaps)
XL: 32px   (Between major sections)
XXL: 48px  (Hero spacing)
```

---

### Border Radius

```
Small: 8px    (Tags, small cards)
Medium: 12px  (Info cards, list items)
Large: 16px   (Feature cards, images)
XLarge: 24px  (Modals, major containers)
Pill: 999px   (Buttons, search bars)
```

---

### Shadows (Elevation)

```
Level 1 (Subtle):
  0px 1px 3px rgba(0, 0, 0, 0.08)
  
Level 2 (Card):
  0px 2px 6px rgba(0, 0, 0, 0.10)
  
Level 3 (Raised):
  0px 4px 12px rgba(0, 0, 0, 0.15)
  
Level 4 (Modal):
  0px 8px 24px rgba(0, 0, 0, 0.20)
```

---

### Ikony

#### Style
- **Outlined** (default): Dla nieaktywnych stanów
- **Filled**: Dla aktywnych stanów
- **Rounded Corners**: 2px radius na końcówkach

#### Sizes
```
Small: 16x16px (inline text icons)
Medium: 24x24px (standard UI icons)
Large: 32x32px (feature icons)
XLarge: 48x48px (empty states)
```

#### Sources
- Material Icons (open source)
- SF Symbols (iOS)
- Custom icons dla unikalnych konceptów (młyn, opera)

---

## 🏗️ ARCHITEKTURA TECHNICZNA

### Stack Technologiczny

#### Framework
- **Flutter 3.x** (Cross-platform: iOS, Android, Web)
- **Dart 3.x**

#### Architektura Aplikacji
**Pattern:** Clean Architecture + BLoC

```
lib/
  ├── core/
  │   ├── constants/
  │   │   ├── colors.dart
  │   │   ├── text_styles.dart
  │   │   └── spacing.dart
  │   ├── theme/
  │   │   └── app_theme.dart
  │   └── utils/
  │       ├── location_utils.dart
  │       └── formatter_utils.dart
  │
  ├── features/
  │   ├── home/
  │   │   ├── presentation/
  │   │   │   ├── screens/
  │   │   │   │   └── home_screen.dart
  │   │   │   ├── widgets/
  │   │   │   │   ├── category_card.dart
  │   │   │   │   ├── recommended_poi_card.dart
  │   │   │   │   └── quick_action_button.dart
  │   │   │   └── bloc/
  │   │   │       ├── home_bloc.dart
  │   │   │       ├── home_event.dart
  │   │   │       └── home_state.dart
  │   │   ├── domain/
  │   │   │   ├── entities/
  │   │   │   │   └── poi.dart
  │   │   │   └── repositories/
  │   │   │       └── poi_repository.dart
  │   │   └── data/
  │   │       ├── models/
  │   │       │   └── poi_model.dart
  │   │       └── repositories/
  │   │           └── poi_repository_impl.dart
  │   │
  │   └── poi_details/
  │       ├── presentation/
  │       │   ├── screens/
  │       │   │   └── poi_details_screen.dart
  │       │   └── widgets/
  │       │       ├── hero_gallery.dart
  │       │       ├── cta_buttons.dart
  │       │       ├── info_card.dart
  │       │       └── nearby_list.dart
  │       ├── domain/
  │       └── data/
  │
  └── main.dart
```

---

### Kluczowe Pakiety

#### UI & Animations
```yaml
dependencies:
  flutter_bloc: ^8.1.3           # State management
  cached_network_image: ^3.3.0   # Image caching
  shimmer: ^3.0.0                # Loading placeholders
  smooth_page_indicator: ^1.1.0  # Gallery dots
  flutter_svg: ^2.0.9            # Vector icons
```

#### Maps & Location
```yaml
dependencies:
  google_maps_flutter: ^2.5.0    # Map display
  geolocator: ^10.1.0            # GPS location
  url_launcher: ^6.2.1           # External maps
```

#### Audio & Media
```yaml
dependencies:
  audioplayers: ^5.2.1           # Audio playback
  video_player: ^2.8.1           # Video content
```

#### Data & Backend
```yaml
dependencies:
  dio: ^5.4.0                    # HTTP client
  hive_flutter: ^1.1.0           # Local storage
  shared_preferences: ^2.2.2     # User preferences
```

---

### Performance Optimizations

#### Image Loading
- Progressive loading (blur → full res)
- Lazy loading dla list
- Cache strategy: Memory → Disk → Network
- Responsive images (multiple resolutions)

#### List Performance
- `ListView.builder` dla długich list
- `AutomaticKeepAliveClientMixin` dla tabs
- Image precaching dla visible items

#### State Management
- BLoC dla globalnego state
- Local state dla UI-only changes
- Debouncing dla search input (300ms)

---

### Responsywność

#### Breakpoints
```dart
Mobile Small: < 360px  (iPhone SE)
Mobile: 360-599px      (Standard phones)
Mobile Large: 600-839px (Large phones, small tablets)
Tablet: 840-1279px     (Tablets)
Desktop: 1280px+       (Web, desktop)
```

#### Adaptive Layouts
- Column count w grid: 2 (mobile), 3 (tablet), 4 (desktop)
- Bottom Navigation → Side Navigation (desktop)
- Modal sheets → Dialogs (tablet+)

---

### Lokalizacja

#### Supported Languages
- **Polski** (primary)
- **English**
- **Deutsch** (dla turystów niemieckich)

#### Implementation
```yaml
dependencies:
  flutter_localizations:
    sdk: flutter
  intl: ^0.19.0
```

#### Struktur a
```
lib/
  └── l10n/
      ├── app_pl.arb
      ├── app_en.arb
      └── app_de.arb
```

---

### Offline Support

#### Cached Data
- Lista POI (pełna)
- Zdjęcia (pierwsze 2 dla każdego POI)
- Podstawowe mapy (Google Maps Tiles)
- Ulubione użytkownika

#### Sync Strategy
- Background sync co 24h
- Manual refresh
- Delta updates (tylko zmiany)

---

### Analytics & Monitoring

#### Events to Track
- **User Flow:**
  - Screen views
  - Navigation patterns
  - Time spent on POI
  
- **Engagement:**
  - Favorite toggles
  - Audio playback starts
  - Route starts
  
- **Performance:**
  - App launch time
  - Screen load time
  - API response time

#### Tools
- Firebase Analytics
- Crashlytics (error tracking)
- Performance Monitoring

---

## 📝 Następne Kroki Implementacji

### Faza 1: Foundation (Tydzień 1-2)
1. ✅ Setup projektu Flutter
2. ⬜ Konfiguracja theme system
3. ⬜ Implementacja core widgets (buttons, cards)
4. ⬜ Setup navigation structure

### Faza 2: Home Screen (Tydzień 3-4)
1. ⬜ Header + Search bar
2. ⬜ Quick Action button
3. ⬜ Category cards (horizontal scroll)
4. ⬜ Recommended POI cards
5. ⬜ Bottom Navigation

### Faza 3: POI Details (Tydzień 5-6)
1. ⬜ Hero gallery z PageView
2. ⬜ Content header + tags
3. ⬜ CTA buttons + audio integration
4. ⬜ Description sections
5. ⬜ Nearby POI list

### Faza 4: Integration (Tydzień 7-8)
1. ⬜ API integration
2. ⬜ Location services
3. ⬜ Maps integration
4. ⬜ State management (BLoC)

### Faza 5: Polish (Tydzień 9-10)
1. ⬜ Animations + transitions
2. ⬜ Accessibility audit
3. ⬜ Performance optimization
4. ⬜ Testing (unit, widget, integration)

---

## 🎯 KPI i Sukces

### Metryki Użytkownika
- **Engagement Rate:** > 60% daily active users podczas wizyty w Bydgoszczy
- **Session Duration:** Średnio 15-25 min per session
- **Route Completion:** > 70% użytkowników kończy rozpoczętą trasę
- **Return Rate:** > 40% użytkowników wraca na 2+ POI

### Metryki Techniczne
- **App Launch Time:** < 2s (cold start)
- **Screen Load Time:** < 500ms (cached data)
- **Crash Rate:** < 0.5%
- **Rating:** > 4.5 stars (App Store/Google Play)

---

**Koniec Blueprintu**  
*Dokument roboczy - wersja 1.0*