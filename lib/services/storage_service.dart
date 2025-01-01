import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const _recentPlacesKey = 'recentPlaces';

  static Future<void> saveRecentPlaces(List<String> placeIds) async {
    final prefs = await SharedPreferences.getInstance();
    print('Saving Recent Place IDs: $placeIds');
    await prefs.setStringList(_recentPlacesKey, placeIds);
  }

  static Future<List<String>> getRecentPlaces() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_recentPlacesKey) ?? [];
  }

  Future<void> debugSharedPreferences() async {
    List<String> ids = await StorageService.getRecentPlaces();
    print('Saved Recent Place IDs in SharedPreferences: $ids');
  }
}
