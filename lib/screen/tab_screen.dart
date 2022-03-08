import 'package:deli_meals_app/screen/catagory_screen.dart';
import 'package:deli_meals_app/screen/favorites_screen.dart';
import 'package:deli_meals_app/widget/main_drawer.dart';
import 'package:flutter/material.dart';

import '../model/meal.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  TabScreen(this.favoriteMeals);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  late List<Map<String, dynamic>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'pages': CatagoryScreen(), 'title': 'Categories'},
      {
        'pages': FavoritesScreen(widget.favoriteMeals),
        'title': 'Favorites',
      }
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['pages'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          unselectedItemColor: Colors.white,
          currentIndex: _selectedPageIndex,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.amber,
          items: [
            BottomNavigationBarItem(
              label: 'Categories',
              icon: Icon(Icons.category),
            ),
            BottomNavigationBarItem(
              label: 'Favorites',
              icon: Icon(Icons.star),
            ),
          ]),
    );
  }
}
