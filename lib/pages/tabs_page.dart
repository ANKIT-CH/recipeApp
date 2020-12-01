import 'package:flutter/material.dart';
import 'package:racipe_app/widgets/main_drawer.dart';

import 'categories_page.dart';
import './favourites_page.dart';
import '../models/meals.dart';

class TabsPage extends StatefulWidget {
  List<Meal> favouriteMeals;

  TabsPage(this.favouriteMeals);
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  List<Map<String, Object>> _pages;
  @override
  initState() {
    _pages = [
      {'page': CategoryLook(), 'title': 'categories'},
      {
        'page': FavouritesPage(widget.favouriteMeals),
        'title': 'your favourites'
      },
    ];
    super.initState();
  }

  int _selectedIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black54,
        currentIndex: _selectedIndex,
        // type: BottomNavigationBarType.shifting,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'favourites',
          ),
        ],
      ),
    );
  }
}
