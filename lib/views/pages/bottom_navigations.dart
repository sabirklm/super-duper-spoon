import 'package:educational_app/views/pages/explore_page.dart';
import 'package:educational_app/views/pages/home_page.dart';
import 'package:educational_app/views/pages/search_page.dart';
import 'package:educational_app/views/pages/subject_page.dart';
import 'package:flutter/material.dart';

class BottomNavigationItemData {
  final String name;
  final Icon icon;

  BottomNavigationItemData(
    this.name,
    this.icon,
  );
}

var navItems = <BottomNavigationItemData>[
  BottomNavigationItemData("Home", const Icon(Icons.home)),
  BottomNavigationItemData("Search", const Icon(Icons.search)),
  BottomNavigationItemData("Subjects", const Icon(Icons.book)),
  BottomNavigationItemData("Explore", const Icon(Icons.explore)),
];

var screens = <Widget>[
  const HomePage(),
  const SearchPage(),
  const SubjectPage(),
  const ExplorePage(),
];

class BottomNavigations extends StatefulWidget {
  const BottomNavigations({super.key});

  @override
  State<BottomNavigations> createState() => _BottomNavigationsState();
}

class _BottomNavigationsState extends State<BottomNavigations> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.teal,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: (val) {
          setState(() {
            _selectedIndex = val;
          });
        },
        selectedLabelStyle: const TextStyle(
          color: Colors.black,
        ),
        unselectedLabelStyle: const TextStyle(
          color: Colors.teal,
        ),
        items: [
          ...List.generate(
            navItems.length,
            (index) => BottomNavigationBarItem(
              label: navItems[index].name,
              icon: navItems[index].icon,
            ),
          ),
        ],
      ),
      body: screens[_selectedIndex],
    );
  }
}
