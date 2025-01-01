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
        title: const Text('Recent Places'),
      ),
      body: recentPlaces.isEmpty
          ? const Center(child: Text('No recent places found'))
          : ListView.builder(
              itemCount: recentPlaces.length,
              itemBuilder: (context, index) {
                final place = recentPlaces[index];
                return ListTile(
                  leading: const Icon(Icons.place),
                  title: Text(place.name),
                  subtitle: Text(place.address),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(placeId: place.id),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
