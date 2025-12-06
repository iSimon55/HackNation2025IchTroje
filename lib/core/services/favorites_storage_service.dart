import 'package:shared_preferences/shared_preferences.dart';

class FavoritesStorageService {
  static const String _favoritesKey = 'favorites_poi_ids';
  
  static Future<void> saveFavorites(List<String> favoriteIds) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_favoritesKey, favoriteIds);
  }
  
  static Future<List<String>> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_favoritesKey) ?? [];
  }
  
  static Future<void> addFavorite(String poiId) async {
    final favorites = await loadFavorites();
    if (!favorites.contains(poiId)) {
      favorites.add(poiId);
      await saveFavorites(favorites);
    }
  }
  
  static Future<void> removeFavorite(String poiId) async {
    final favorites = await loadFavorites();
    favorites.remove(poiId);
    await saveFavorites(favorites);
  }
  
  static Future<bool> isFavorite(String poiId) async {
    final favorites = await loadFavorites();
    return favorites.contains(poiId);
  }
}
