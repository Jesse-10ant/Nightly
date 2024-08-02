import 'package:flutter/material.dart';
import 'package:nightly/favorite_detail.dart';

import 'explore_page.dart';
import 'selection_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0; //Start on the random selection page
  late final List<Widget> _pages = [
    //All three of the pages offered
    const SelectionWheelPage(),
    const FavoritePage(),
    const AllResultsPage()
  ];

  void _onItemTapped(int index) {
    //Page navigator
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NIGHTLY"),
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place),
            label: 'City Explore',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, //Sets the state to the page selected by the user
      ),
    );
  }
}
