import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorite_screen.dart';
import 'package:meals_app/widgets/drawer.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Widget> _pages = [CategoriesScreen(), FavoriteScreen()];

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
          title: Text("Meal App"),
        ),
        drawer: MainDrawer(),
        body: _pages[_selectedPageIndex],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 8,
          selectedItemColor: Colors.blueAccent,
          type: BottomNavigationBarType.shifting,
          unselectedItemColor: Colors.grey[400],
          onTap: _selectPage,
          currentIndex: _selectedPageIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              title: const Text("Home"),
            ),
            BottomNavigationBarItem(
                icon: const Icon(Icons.favorite),
                title: const Text("Favorites")),
          ],
        ));
  }
}
