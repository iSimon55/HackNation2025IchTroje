import '../models/event_info.dart';

class EventData {
  static List<EventInfo> getAllEvents() {
    return [
      EventInfo(
        id: 'jarmark_bozonarodzeniowy_2025',
        title: 'Jarmark Bożonarodzeniowy',
        date: '1-24 grudnia 2025',
        location: 'Stary Rynek',
        description: 'Tradycyjny jarmark świąteczny z lokalnymi rękodzielnikami, '
            'straganami z regionalnymi produktami i gorącym grzańcem. '
            'Atmosfera świąt w sercu Starego Miasta!',
        emoji: '🎄',
        colorHex: 'C62828',
        websiteUrl: 'https://www.bydgoszcz.pl/wydarzenia/jarmark-bozonarodzeniowy',
      ),
      EventInfo(
        id: 'hacknation_2025',
        title: 'HackNation 2025',
        date: '6-8 grudnia 2025',
        location: 'Uniwersytet Technologiczno-Przyrodniczy',
        description: 'Największy hackathon w regionie! 48 godzin kodowania, '
            'warsztaty, mentoring i networking. Wyzwania dla developerów, '
            'projektantów i przedsiębiorców.',
        emoji: '💻',
        colorHex: 'A0674D',
        websiteUrl: 'https://hacknation.pl',
      ),
      EventInfo(
        id: 'festiwal_muzyki_filmowej',
        title: 'Festiwal Muzyki Filmowej',
        date: '15-20 stycznia 2026',
        location: 'Opera Nova',
        description: 'Niezapomniane koncerty z muzyką z największych hitów kinowych. '
            'Orkiestra symfoniczna i goście specjalni prezentują najpiękniejsze '
            'ścieżki dźwiękowe w historii kina.',
        emoji: '🎬',
        colorHex: '3498DB',
        websiteUrl: 'https://www.opera.bydgoszcz.pl',
      ),
    ];
  }

  static EventInfo? getEventById(String id) {
    try {
      return getAllEvents().firstWhere((event) => event.id == id);
    } catch (e) {
      return null;
    }
  }
}
