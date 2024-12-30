import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/place.dart';

class FavoritesService {
  static const String favoritesKey = 'favorite_places';

  Future<void> addFavorite(Place place) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavorites();
    favorites.add(place);
    prefs.setString(
        favoritesKey, jsonEncode(favorites.map((e) => e.toMap()).toList()));
  }

  Future<void> removeFavorite(String placeId) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavorites();
    favorites.removeWhere((place) => place.id == placeId);
    prefs.setString(
        favoritesKey, jsonEncode(favorites.map((e) => e.toMap()).toList()));
  }

  Future<List<Place>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(favoritesKey);
    if (data != null) {
      final List<dynamic> decoded = jsonDecode(data);
      return decoded.map<Place>((item) => Place.fromMap(item)).toList();
    }
    return [];
  }
}
