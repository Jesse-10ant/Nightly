import 'package:flutter/material.dart';

import 'locations.dart';
import 'results.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  void _removeFromFavorites(Location location) {
    setState(() {
      Location.favoriteLocations.remove(location);
    });
  }

  @override
  Widget build(BuildContext context) {
    final favoriteLocations = Location.favoriteLocations;

    return Scaffold(
      body: favoriteLocations.isEmpty
          ? const Center(
              child: Text(
                'No favorites added yet.',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              itemCount: favoriteLocations.length,
              itemBuilder: (context, index) {
                final location = favoriteLocations[index];
                return ListTile(
                  title: Text(location.name),
                  subtitle: Text(location.address),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () => _removeFromFavorites(location),
                  ),
                  onTap: () {
                    // Navigate to the location details page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Results(location: location),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
