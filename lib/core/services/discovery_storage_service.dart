import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/discovery_item.dart';

class DiscoveryStorageService {
  static const String _storageKey = 'discovered_items';

  static Future<void> saveDiscoveries(List<DiscoveryItem> discoveries) async {
    final prefs = await SharedPreferences.getInstance();
    
    final unlockedDiscoveries = discoveries
        .where((d) => d.isUnlocked)
        .map((d) => {
              'id': d.id,
              'userPhotoPath': d.userPhotoPath,
              'unlockedAt': d.unlockedAt?.toIso8601String(),
            })
        .toList();

    final jsonString = jsonEncode(unlockedDiscoveries);
    await prefs.setString(_storageKey, jsonString);
  }

  static Future<Map<String, Map<String, dynamic>>> loadDiscoveries() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_storageKey);

    if (jsonString == null) {
      return {};
    }

    final List<dynamic> decoded = jsonDecode(jsonString);
    final Map<String, Map<String, dynamic>> result = {};

    for (var item in decoded) {
      result[item['id']] = {
        'userPhotoPath': item['userPhotoPath'],
        'unlockedAt': item['unlockedAt'] != null
            ? DateTime.parse(item['unlockedAt'])
            : null,
      };
    }

    return result;
  }

  static Future<void> clearDiscoveries() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_storageKey);
  }

  static Future<void> saveDiscovery(DiscoveryItem discovery) async {
    final existingDiscoveries = await loadDiscoveries();
    
    existingDiscoveries[discovery.id] = {
      'userPhotoPath': discovery.userPhotoPath,
      'unlockedAt': discovery.unlockedAt,
    };

    final prefs = await SharedPreferences.getInstance();
    final unlockedList = existingDiscoveries.entries.map((entry) {
      final unlockedAt = entry.value['unlockedAt'];
      return {
        'id': entry.key,
        'userPhotoPath': entry.value['userPhotoPath'],
        'unlockedAt': unlockedAt is DateTime 
            ? unlockedAt.toIso8601String() 
            : unlockedAt,
      };
    }).toList();

    final jsonString = jsonEncode(unlockedList);
    await prefs.setString(_storageKey, jsonString);
  }
}
