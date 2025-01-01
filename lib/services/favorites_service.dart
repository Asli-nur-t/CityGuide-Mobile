import 'package:hive/hive.dart';
import '../models/place.dart';

class FavoritesService {
  static const String favoritesBoxName = 'favorites';

  static Future<void> addFavorite(Place place) async {
    final box = await Hive.openBox<Place>(favoritesBoxName);
    await box.put(place.id, place);
  }

  static Future<void> removeFavorite(String id) async {
    final box = await Hive.openBox<Place>(favoritesBoxName);
    await box.delete(id);
  }

  static Future<List<Place>> getFavorites() async {
    final box = await Hive.openBox<Place>(favoritesBoxName);
    return box.values.toList();
  }

  static Future<bool> isFavorite(String id) async {
    final box = await Hive.openBox<Place>(favoritesBoxName);
    return box.containsKey(id);
  }
}
