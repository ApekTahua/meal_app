import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'favorite_screen.dart';
import 'package:sidebarx/sidebarx.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  TabsScreenState createState() => TabsScreenState();
}

class TabsScreenState extends State<TabsScreen> {
  final List _pages = [
    {
      'page': const CategoriesScreen(),
      'title': 'Categories',
      'icon': const Icon(Icons.category)
    },
    {
      'page': const FavoriteScreen(),
      'title': 'Favorites',
      'icon': const Icon(Icons.star)
    },
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            _pages[_selectedPageIndex]['title'],
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Row(
        children: [
          Container(
            width: 200, // Adjust the width as desired
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 0, 0, 0),
                  offset: Offset(0, 0),
                  blurRadius: 4,
                ),
              ],
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            child: SidebarX(
              controller: SidebarXController(selectedIndex: 0),
              items: const [
                SidebarXItem(icon: Icons.home, label: 'Home'),
                SidebarXItem(icon: Icons.search, label: 'Search'),
                SidebarXItem(icon: Icons.settings, label: 'Settings'),
                SidebarXItem(icon: Icons.info, label: 'About'),
              ],
            ),
          ),
          Expanded(
            child: _pages[_selectedPageIndex]['page'],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).secondaryHeaderColor,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category, size: 30),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star, size: 30),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
