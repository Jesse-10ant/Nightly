import 'package:flutter/material.dart';

import 'locations.dart';

class LocationDetailsPage extends StatelessWidget {
  final Location location;
  final List<Location> favoriteLocations; // Add a list of favorite locations

  const LocationDetailsPage({
    Key? key,
    required this.location,
    required this.favoriteLocations, // Require the list in the constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Check if the favorites list is empty and display a message if it is
    Widget content;
    if (favoriteLocations.isEmpty) {
      content = const Text('Your favorites list is empty.',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold));
    } else {
      content = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.network(
            location.url,
            height: 400,
            width: 600,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          Text(location.name,
              style:
                  const TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(location.address),
          Text('Hours: ${location.hours}'),
          const SizedBox(height: 8),
          Text('Website: ${location.website}'),
          const SizedBox(height: 20),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(location.name),
      ),
      body: Center(child: content),
    );
  }
}
