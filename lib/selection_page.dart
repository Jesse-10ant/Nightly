import 'dart:math';

import 'package:nightly/locations.dart';
import 'package:nightly/results.dart';

class SelectionWheelPage extends StatefulWidget {
  const SelectionWheelPage({super.key});

  @override
  _SelectionWheelPageState createState() => _SelectionWheelPageState();
}

class _SelectionWheelPageState extends State<SelectionWheelPage> {
  //arbitrary default values
  String selectedPrice = r"$";
  String selectedNeighborhood = 'Downtown';
  String selectedVibe = 'Dance';
  //all drop downs start unlocked
  bool priceLocked = false;
  bool neighborhoodLocked = false;
  bool vibeLocked = false;
  //list of all parameters
  List<String> priceRanges = [r"$", r"$$", r"$$$"];
  List<String> neighborhoods = ['Downtown', 'East Side', 'Hollywood'];
  List<String> vibes = ['Dance', 'Game', 'Live Music', 'Karaoke'];

  @override
  Widget build(BuildContext context) {
    double paddingValue = MediaQuery.of(context).size.width *
        0.05; //Scalling found through flutter doc

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(paddingValue),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'Its time to get your night going!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple),
              ),
              const Text(
                'Lock in any of your preferences by checking the box to the right and let us do the rest!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Padding(padding: EdgeInsets.all(paddingValue)),

              //Next three sized boxs are the selection wheels with their locking logic
              //If item is locked then its perameter selection should be updated
              const SizedBox(height: 20),
              buildDropdownWithLock(
                'Price Range',
                selectedPrice,
                priceRanges,
                (String? newValue) {
                  if (!priceLocked) {
                    setState(() => selectedPrice = newValue!);
                  }
                },
                priceLocked,
                (bool? newValue) {
                  setState(() => priceLocked = newValue!);
                },
              ),
              const SizedBox(height: 20),
              buildDropdownWithLock(
                'Neighborhood',
                selectedNeighborhood,
                neighborhoods,
                (String? newValue) {
                  if (!neighborhoodLocked) {
                    setState(() => selectedNeighborhood = newValue!);
                  }
                },
                neighborhoodLocked,
                (bool? newValue) {
                  setState(() => neighborhoodLocked = newValue!);
                },
              ),
              const SizedBox(height: 20),
              buildDropdownWithLock(
                'Vibe',
                selectedVibe,
                vibes,
                (String? newValue) {
                  if (!vibeLocked) {
                    setState(() => selectedVibe = newValue!);
                  }
                },
                vibeLocked,
                (bool? newValue) {
                  setState(() => vibeLocked = newValue!);
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _searchAndNavigate(
                  //Calls the function that handles the logic MVC
                  selectedPrice,
                  selectedNeighborhood,
                  selectedVibe,
                ),
                child: const Text('Search'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Widget handeling the selection options logic
  Widget buildDropdownWithLock(
      String label, //  text that appears above the dropdown,
      String selectedValue, //the currently selected value in the dropdown,
      List<String> items, // list of items to display in the dropdown,
      ValueChanged<String?>
          onChanged, //callback function that is called when a new item is selected,
      bool locked, //bool that determines if the dropdown is locked or not,
      ValueChanged<bool?> onLockChanged) {
    // callback function that is called when the lock checkbox is toggled.
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: label,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            value: selectedValue,
            onChanged: locked ? null : onChanged, // If locked, disable changes
            items: items.map<DropdownMenuItem<String>>((String value) {
              // Map the list of strings to a list of DropdownMenuItems
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        Checkbox(
            value: locked,
            onChanged:
                onLockChanged), // Set the callback for when the checkbox changes
      ],
    );
  }

  void _searchAndNavigate(
      String selectedPrice, String selectedNeighborhood, String selectedVibe) {
    Location? selectedLocation =
        findLocation(selectedPrice, selectedNeighborhood, selectedVibe);

    //If a Location is found that matches the results the user locked in
    //Send it to the result page
    if (selectedLocation != null) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Results(location: selectedLocation),
      ));
    } else {
      // If nothing was found tell the user through the pop out
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('No Match Found'),
            content: const Text(
                'No location matches your selections. Please try again.'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
        },
      );
    }
  }

  //Logic used to find a location that matches the users requested
  Location? findLocation(String price, String neighborhood, String vibe) {
    List<Location> locationMatches =
        []; // List holding all matching locations, this is then randomly pulled from
    //Loop through the allLocations array checking if a locations matches the locked in prams
    for (var location in Location.getAllLocations()) {
      bool matchesPrice = !priceLocked && location.price == price;
      bool matchesNeighborhood =
          !neighborhoodLocked && location.neighborhood == neighborhood;
      bool matchesVibe = !vibeLocked && location.vibe == vibe;
      //If a location is found to have all locked in attributes then add it to the list
      if (matchesPrice && matchesNeighborhood && matchesVibe) {
        locationMatches.add(location);
      }
    }
    //If we found matches then randomly select a location from the list
    if (locationMatches.isNotEmpty) {
      final randomIndex = Random().nextInt(locationMatches
          .length); //generating the random indx we will pull from
      return locationMatches[randomIndex];
    }
    return null;
  }
}
