import 'package:shared_preferences/shared_preferences.dart';

class GetFavouriteTimezone {
  static const String _key = 'favorite_timezone';

  static Future<List<String>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }

  static Future<void> saveFavorites(List<String> timezones) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_key, timezones);
  }

  static Future<void> addFavorite(String timezone) async {
    final favorites = await getFavorites();
    if (!favorites.contains(timezone)) {
      favorites.add(timezone);
      print('Added: $timezone');
      await saveFavorites(favorites);
    }
  }

  static Future<void> removeFavorite(String timezone) async {
    final favorites = await getFavorites();
    favorites.remove(timezone);
    print('removed: $timezone');  
    await saveFavorites(favorites);
  }

  static Future<bool> isFavorite(String timezone) async {
    final favorites = await getFavorites();
    return favorites.contains(timezone);
  }
}
