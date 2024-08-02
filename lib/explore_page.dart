import 'locations.dart';
import 'results.dart';

class AllResultsPage extends StatefulWidget {
  const AllResultsPage({Key? key}) : super(key: key);

  @override
  _AllResultsPageState createState() => _AllResultsPageState();
}

class _AllResultsPageState extends State<AllResultsPage> {
  //Initializing default preference settings
  String selectedPrice = 'No Preference';
  String selectedNeighborhood = 'No Preference';
  String selectedVibe = 'No Preference';

  List<Location> allLocations = Location.locationsList;
  List<Location> filteredLocations = [];

  @override
  void initState() {
    super.initState();
    filteredLocations = allLocations; // Start with all locations visible
  }

  void filterResults() {
    setState(() {
      // Apply filters only if a specific option,
      // No Preference acts as a null that unfiltered the items for that parameter
      filteredLocations = allLocations.where((location) {
        bool priceMatch =
            selectedPrice == 'No Preference' || location.price == selectedPrice;
        bool neighborhoodMatch = selectedNeighborhood == 'No Preference' ||
            location.neighborhood == selectedNeighborhood;
        bool vibeMatch =
            selectedVibe == 'No Preference' || location.vibe == selectedVibe;

        return priceMatch && neighborhoodMatch && vibeMatch;
      }).toList();
    });
  }

  //Helper dropdown builder
  DropdownButton<String> _buildDropdown(String dropdownLabel, String value,
      List<String> options, ValueChanged<String?> onChanged) {
    //Storing a list mapping the different filter options
    List<String> modifiedOptions = ['No Preference'] +
        options; // Adding No Preference as a default option to the list of options

    // Creating a list of DropdownMenuItem widgets from the modified options
    List<DropdownMenuItem<String>> menuItems =
        modifiedOptions.map((String option) {
      return DropdownMenuItem<String>(
        value: option,
        child: Text(option),
      );
    }).toList();

    return DropdownButton<String>(
      value: value, // Set the currently selected value
      onChanged: (newValue) {
        onChanged(
            newValue); // Calling the provided onChanged callback with the new value
        filterResults(); // Calling filterResults method to apply the filter based on the new selection
      },
      items: menuItems, // Setting the list of dropdown menu items
      hint: Text(
          dropdownLabel), // Using the dropdownLabel as a hint or label for the dropdown
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                children: [
                  Expanded(
                    child: _buildDropdown(
                      'Price',
                      selectedPrice,
                      [r'$', r'$$', r'$$$'],
                      (newValue) => setState(
                          () => selectedPrice = newValue ?? 'No Preference'),
                    ),
                  ),
                  Expanded(
                    child: _buildDropdown(
                      'Neighborhood',
                      selectedNeighborhood,
                      ['Downtown', 'East Side', 'Hollywood'],
                      (newValue) => setState(() =>
                          selectedNeighborhood = newValue ?? 'No Preference'),
                    ),
                  ),
                  Expanded(
                    child: _buildDropdown(
                      'Vibe',
                      selectedVibe,
                      ['Dance', 'Game', 'Live Music', 'Karaoke'],
                      (newValue) => setState(
                          () => selectedVibe = newValue ?? 'No Preference'),
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true, //Helped witth an overflow error I was receiving on the buttons
              physics: const NeverScrollableScrollPhysics(), //Helped allowing scrolling in the list view
              itemCount: filteredLocations.length,
              itemBuilder: (context, index) {
                Location location = filteredLocations[index];
                return ListTile( //Just the title display on the list cards
                  title: Text(location.name),
                  subtitle: Text(location.address),
                  onTap: () {
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
          ],
        ),
      ),
    );
  }
}
