import 'package:flutter/material.dart';

import 'locations.dart';

class Results extends StatefulWidget {
  final Location location;

  const Results({Key? key, required this.location}) : super(key: key);

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  bool isFavorite = false;

  //Controller of the favorite toggle switch
  void toggleFavorite() {
    setState(() {
      //If the item is in the favorites list then remove it from the list when toggled
      if (Location.favoriteLocations.contains(widget.location)) {
        Location.favoriteLocations.remove(widget.location);
        isFavorite = false;
      } else {
        //If the location has not been toggled then toggle it and add the location to the favorite list
        Location.favoriteLocations.add(widget.location);
        isFavorite = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //used for pulling the location image
              Image.network(
                widget.location.url,
                //found in Flutter Docs as a way to adapt your application for web and mobile.
                height: MediaQuery.of(context).size.width * 0.5,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Text(
                widget.location.name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                widget.location.description,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(widget.location.address),
              Text('Hours: ${widget.location.hours}'),
              const SizedBox(height: 8),
              Text(widget.location.website),
              const SizedBox(height: 20),
              //Favorite toggle button, if it is a favorite then fill the heart in
              IconButton(
                icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
                color: Colors.red,
                onPressed: toggleFavorite,
                iconSize: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
