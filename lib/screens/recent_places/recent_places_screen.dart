import 'package:cityguidemob/constants.dart';
import 'package:flutter/material.dart';
import 'package:cityguidemob/models/place.dart';
import 'package:cityguidemob/screens/detail/details_screen.dart';

class RecentPlacesScreen extends StatelessWidget {
  final List<Place> recentPlaces;

  const RecentPlacesScreen({Key? key, required this.recentPlaces})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Recent Places in Screen: $recentPlaces');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(
          'Recent Places',
          style: TextStyle(color: kContentColorDarkTheme),
        ),
        iconTheme: const IconThemeData(color: kIconColorNav),
      ),
      body: recentPlaces.isEmpty
          ? const Center(
              child: Text(
                'No recent places found',
                style: TextStyle(color: kContentColorLightTheme),
              ),
            )
          : ListView.builder(
              itemCount: recentPlaces.length,
              itemBuilder: (context, index) {
                final place = recentPlaces[index];
                return Card(
                  color: kBackgroundColor,
                  child: ListTile(
                    leading: const Icon(Icons.place, color: kIconColor),
                    title: Text(
                      place.name,
                      style: const TextStyle(color: kContentColorLightTheme),
                    ),
                    subtitle: Text(
                      place.address,
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
