import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:cityguidemob/models/place.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    _dio.interceptors.add(ChuckerDioInterceptor());
  }

  /// Fetch place details by placeId
  Future<Place> fetchPlaceDetails(String placeId) async {
    final String apiKey = dotenv.env['GOOGLE_MAPS_API_KEY']!;
    final String url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$apiKey';

    try {
      final response = await _dio.get(url);
      final data = response.data['result'];

      return Place(
        id: data['place_id'],
        name: data['name'],
        rating: data['rating']?.toDouble() ?? 0.0,
        latitude: data['geometry']['location']['lat'] ?? 0.0,
        longitude: data['geometry']['location']['lng'] ?? 0.0,
        category: data['types']?.join(', ') ?? '',
        address: data['formatted_address'] ?? 'No address available',
        description: data['editorial_summary']?['overview'] ?? '',
      );
    } catch (e) {
      throw Exception('Failed to fetch place details: $e');
    }
  }

  Future<List<Place>> fetchPlaces(LatLng userLocation, String type) async {
    const String apiKey = 'AIzaSyCbXJ1tIrQcHhpdUAl0gBiNnhwZyu_wgBg';
    final String url =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${userLocation.latitude},${userLocation.longitude}&radius=5000&type=$type&key=$apiKey';

    try {
      final response = await _dio.get(url);
      final List<dynamic> results = response.data['results'];

      return results.map((place) {
        return Place(
          id: place['place_id'],
          name: place['name'],
          rating: place['rating']?.toDouble() ?? 0.0,
          latitude: place['geometry']['location']['lat'] ?? 0.0,
          longitude: place['geometry']['location']['lng'] ?? 0.0,
          category: place['types']?.join(', ') ?? '',
          address: place['vicinity'] ?? 'No address available',
          description: place['editorial_summary']?['overview'] ?? '',
        );
      }).toList();
    } catch (e) {
      throw Exception('Failed to fetch places: $e');
    }
  }

  /// Belirtilen ID'lere göre mekan detaylarını çek

  Future<List<Place>> fetchPlacesByIds(List<String> placeIds) async {
    List<Place> places = [];
    for (String placeId in placeIds) {
      try {
        Place place =
            await fetchPlaceDetails(placeId); // Her ID için çekim yapılıyor
        places.add(place);
      } catch (e) {
        print('Failed to fetch place for ID $placeId: $e');
      }
    }
    return places;
  }
}
