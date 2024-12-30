import 'package:cityguidemob/screens/detail/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:cityguidemob/models/place.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Place> favoritePlaces;

  const FavoritesScreen({Key? key, required this.favoritePlaces})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Places'),
      ),
      body: favoritePlaces.isEmpty
          ? const Center(
              child: Text(
                'No favorites yet!',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: favoritePlaces.length,
              itemBuilder: (context, index) {
                final place = favoritePlaces[index];
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.place),
                    title: Text(place.name),
                    subtitle: Text('Rating: ${place.rating}'),
                    onTap: () {
                      // Favori mekan detaylarına yönlendirme
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
    );
  }
}
