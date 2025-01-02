import 'dart:async';

import 'package:cityguidemob/constants.dart';
import 'package:cityguidemob/models/place.dart';
import 'package:cityguidemob/screens/detail/details_screen.dart';
import 'package:cityguidemob/screens/favorites/favorites_screen.dart';
import 'package:cityguidemob/screens/recent_places/recent_places_screen.dart';
import 'package:cityguidemob/services/api_service.dart';
import 'package:cityguidemob/services/storage_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
import 'package:location/location.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LatLng? _currentLocation;
  List<Place> _places = [];
  final List<Place> _favoritePlaces = [];
  List<Place> _recentPlaces = [];
  late GoogleMapController _mapController;
  final ApiService _apiService = ApiService();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  bool _isConnected = true;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
    _loadRecentPlaces(); // Recent places'i yükle
    _getUserLocation();
    _startConnectivityCheck();
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  void _startConnectivityCheck() {
    _connectivitySubscription =
        Connectivity().onConnectivityChanged.listen((dynamic result) {
      if (result is List<ConnectivityResult>) {
        bool isConnected = result.contains(ConnectivityResult.wifi) ||
            result.contains(ConnectivityResult.mobile);
        setState(() {
          _isConnected = isConnected;
        });
        if (!_isConnected) {
          _showConnectionLostPopup();
        }
      } else if (result is ConnectivityResult) {
        bool isConnected = result != ConnectivityResult.none;
        setState(() {
          _isConnected = isConnected;
        });
        if (!_isConnected) {
          _showConnectionLostPopup();
        }
      } else {
        print('Unsupported connectivity type: ${result.runtimeType}');
      }
    });
  }

  void _showConnectionLostPopup() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Bağlantı Kesildi'),
        content: const Text('İnternet bağlantınız kesildi.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Tamam'),
          ),
        ],
      ),
    );
  }

  Future<void> _loadRecentPlaces() async {
    List<String> recentPlaceIds = await StorageService.getRecentPlaces();
    if (recentPlaceIds.isNotEmpty) {
      List<Place> places = await _apiService.fetchPlacesByIds(recentPlaceIds);
      setState(() {
        _recentPlaces =
            places; // Burada listeyi doğru doldurduğunuzdan emin olun
      });
    }
  }

  void _addRecentPlace(String placeId) async {
    List<String> recentPlaceIds = await StorageService.getRecentPlaces();
    print(
        'Before Adding: $recentPlaceIds'); // Kaydedilen mekan ID'lerini kontrol et
    if (!recentPlaceIds.contains(placeId)) {
      recentPlaceIds.add(placeId);
      if (recentPlaceIds.length > 10) {
        recentPlaceIds.removeAt(0); // Maksimum 10 mekan tut
      }
      print('After Adding: $recentPlaceIds'); // Güncellenen listeyi kontrol et
      await StorageService.saveRecentPlaces(recentPlaceIds);
    }
  }

  Future<void> _getUserLocation() async {
    try {
      Location location = Location();

      bool serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) throw Exception('Konum servisi devre dışı.');
      }

      PermissionStatus permission = await location.requestPermission();
      if (permission != PermissionStatus.granted) {
        throw Exception('Konum izni reddedildi.');
      }

      LocationData locationData = await location.getLocation();
      setState(() {
        _currentLocation =
            LatLng(locationData.latitude!, locationData.longitude!);
      });

      _fetchPlaces();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Hata: ${e.toString()}')),
      );
    }
  }

  Future<void> _fetchPlaces() async {
    if (_currentLocation != null) {
      try {
        List<Place> places = await _apiService.fetchPlaces(
          _currentLocation!,
          'restaurant',
        );
        setState(() {
          _places = places;
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('API Hatası: $e')),
        );
      }
    }
  }

  void _toggleFavorite(Place place) {
    final box = Hive.box<Place>('favorites');
    setState(() {
      if (_favoritePlaces.contains(place)) {
        _favoritePlaces.remove(place);
        box.delete(place.id); // Favoriyi Hive'dan kaldır
      } else {
        _favoritePlaces.add(place);
        box.put(place.id, place); // Yeni favoriyi Hive'a ekle
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: kIconColorNav, // Geri tuşu rengini burada ayarlıyoruz
        ),
        backgroundColor: kPrimaryColor,
        title: const Text(
          'CityGuide',
          style: TextStyle(color: kIconColorNav),
        ),
        actions: [
          Icon(
            Icons.circle,
            color: _isConnected
                ? const Color.fromARGB(255, 103, 158, 105)
                : Colors.grey,
            size: 2,
          ),
          IconButton(
            icon: const Icon(Icons.favorite, color: kIconColorNav),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      FavoritesScreen(favoritePlaces: _favoritePlaces),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.history, color: kIconColorNav),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      RecentPlacesScreen(recentPlaces: _recentPlaces),
                ),
              );
            },
          ),
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
            icon: const Icon(Icons.logout, color: kIconColorNav),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: _currentLocation == null
                ? const Center(
                    child: CircularProgressIndicator(color: kPrimaryColor))
                : GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: _currentLocation!,
                      zoom: 14,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      _mapController = controller;
                    },
                    markers: {
                      Marker(
                        markerId: const MarkerId('currentLocation'),
                        position: _currentLocation!,
                        infoWindow: const InfoWindow(title: 'Your Location'),
                      ),
                    },
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                  ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome, ${user?.email ?? 'Guest'}!',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kContentColorLightTheme,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Recommended Places:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: kContentColorLightTheme,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: _places.isEmpty
                        ? const Center(
                            child: Text(
                              'No places found',
                              style: TextStyle(color: kContentColorLightTheme),
                            ),
                          )
                        : ListView.builder(
                            itemCount: _places.length,
                            itemBuilder: (context, index) {
                              final place = _places[index];
                              final isFavorite =
                                  _favoritePlaces.contains(place);
                              return Card(
                                color: kBackgroundColor,
                                child: ListTile(
                                  leading: const Icon(Icons.place,
                                      color: kPrimaryColor),
                                  title: Text(
                                    place.name,
                                    style: const TextStyle(
                                        color: kContentColorLightTheme),
                                  ),
                                  subtitle: Text(
                                    'Rating: ${place.rating.toString()}',
                                    style: const TextStyle(
                                        color: kContentColorLightTheme),
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(
                                      isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: isFavorite
                                          ? kPrimaryColor
                                          : kIconColor,
                                    ),
                                    onPressed: () => _toggleFavorite(place),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DetailsScreen(placeId: place.id),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
