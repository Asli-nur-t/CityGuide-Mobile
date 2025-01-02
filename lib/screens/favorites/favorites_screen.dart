import 'package:cityguidemob/constants.dart';
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
        backgroundColor: kPrimaryColor,
        title: const Text(
          'Favorite Places',
          style: TextStyle(color: kContentColorDarkTheme),
        ),
        iconTheme: const IconThemeData(color: kIconColorNav),
      ),
      body: favoritePlaces.isEmpty
          ? const Center(
              child: Text(
                'No favorites yet!',
                style: TextStyle(
                  fontSize: 18,
                  color: kContentColorLightTheme,
                ),
              ),
            )
          : ListView.builder(
              itemCount: favoritePlaces.length,
              itemBuilder: (context, index) {
                final place = favoritePlaces[index];
                return Card(
                  color: kBackgroundColor,
                  child: ListTile(
                    leading: const Icon(Icons.place, color: kIconColor),
                    title: Text(
                      place.name,
                      style: const TextStyle(color: kContentColorLightTheme),
                    ),
                    subtitle: Text(
                      'Rating: ${place.rating}',
                      style: const TextStyle(color: kContentColorLightTheme),
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
    );
  }
}
