// import 'package:dio/dio.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import '../models/place.dart';

// // class ApiService {
// //   final Dio _dio = Dio();
// //   final String apiKey = 'AIzaSyCbXJ1tIrQcHhpdUAl0gBiNnhwZyu_wgBg';

// //   Future<List<Place>> fetchPlaces(LatLng userLocation, String type) async {
// //     final String url =
// //         'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${userLocation.latitude},${userLocation.longitude}&radius=5000&type=$type&key=$apiKey';

// //     try {
// //       final response = await _dio.get(url);
// //       final List data = response.data['results'];
// //       print('Gelen Veri: ${response.data}');

// //       return data.map<Place>((place) => Place.fromMap(place)).toList();
// //     } catch (e) {
// //       print('API Hatası: $e');
// //       return [];
// //     }
// //   }
// // }
// import 'package:dio/dio.dart';
// import 'package:chucker_flutter/chucker_flutter.dart';

// class ApiService {
//   final Dio _dio = Dio();

//   ApiService() {
//     // Chucker interceptor'ı ekle
//     _dio.interceptors.add(ChuckerDioInterceptor());
//   }

//   Future<List> fetchPlaces(LatLng userLocation, String type) async {
//     final String apiKey = 'AIzaSyCbXJ1tIrQcHhpdUAl0gBiNnhwZyu_wgBg';
//     final String url =
//         'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${userLocation.latitude},${userLocation.longitude}&radius=5000&type=$type&key=$apiKey';

//     try {
//       final response = await _dio.get(url);
//       print('API Response: ${response.data}');
//       return response.data['results'];
//     } catch (e) {
//       print('API Error: $e');
//       return [];
//     }
//   }
// }
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:cityguidemob/models/place.dart';
import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    _dio.interceptors.add(ChuckerDioInterceptor());
  }

  /// Fetch place details by placeId
  Future<Place> fetchPlaceDetails(String placeId) async {
    const String apiKey = 'AIzaSyCbXJ1tIrQcHhpdUAl0gBiNnhwZyu_wgBg';
    final String url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$apiKey';

    try {
      final response = await _dio.get(url);
      final data = response.data['result'];

      return Place(
        id: data['place_id'],
        name: data['name'],
        rating: data['rating']?.toDouble() ?? 0.0,
        location: LatLng(data['geometry']['location']['lat'],
            data['geometry']['location']['lng']),
        category: data['types']?.join(', ') ?? '',
        address: data['formatted_address'] ?? 'No address available',
        description: data['editorial_summary']?['overview'] ?? '',
      );
    } catch (e) {
      throw Exception('Failed to fetch place details: $e');
    }
  }

  /// Fetch places near a specific location
  Future<List<Place>> fetchPlaces(LatLng userLocation, String type) async {
    const String apiKey = 'AIzaSyCbXJ1tIrQcHhpdUAl0gBiNnhwZyu_wgBg';
    final String url =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${userLocation.latitude},${userLocation.longitude}&radius=5000&type=$type&key=$apiKey';

    try {
      final response = await _dio.get(url);
      final List<dynamic> results = response.data['results'];

      return results.map((place) => Place.fromMap(place)).toList();
    } catch (e) {
      throw Exception('Failed to fetch places: $e');
    }
  }
}
