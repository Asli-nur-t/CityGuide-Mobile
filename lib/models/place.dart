// // Created by https://github.com/Asli-nur-t
// // Date: 2024-12-30

// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class Place {
//   final String id;
//   final String name;
//   final double rating;
//   final LatLng location;
//   final String category;
//   final String address; // Yeni alan
//   final String description; // Opsiyonel açıklama alanı

//   Place({
//     required this.id,
//     required this.name,
//     required this.rating,
//     required this.location,
//     required this.category,
//     required this.address,
//     this.description = '', // Varsayılan olarak boş
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'name': name,
//       'rating': rating,
//       'latitude': location.latitude,
//       'longitude': location.longitude,
//       'category': category,
//       'address': address,
//       'description': description,
//     };
//   }

//   factory Place.fromMap(Map<String, dynamic> map) {
//     return Place(
//       id: map['place_id'],
//       name: map['name'],
//       rating: map['rating']?.toDouble() ?? 0.0,
//       location: LatLng(map['geometry']['location']['lat'],
//           map['geometry']['location']['lng']),
//       category: map['types']?.join(', ') ?? '',
//       address: map['vicinity'] ?? 'No address available',
//       description: map['description'] ?? '',
//     );
//   }
// }

// Created by https://github.com/Asli-nur-t
// Date: 2024-12-30

import 'package:hive/hive.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'place.g.dart'; // Hive adapteri için oluşturulacak dosya

@HiveType(typeId: 0) // Benzersiz bir typeId belirleyin
class Place {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final double rating;
  @HiveField(3)
  final double latitude;
  @HiveField(4)
  final double longitude;
  @HiveField(5)
  final String category;
  @HiveField(6)
  final String address;
  @HiveField(7)
  final String description;

  Place({
    required this.id,
    required this.name,
    required this.rating,
    required this.latitude,
    required this.longitude,
    required this.category,
    required this.address,
    this.description = '',
  });

  LatLng get location => LatLng(latitude, longitude);
}
