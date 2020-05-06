import 'package:cookingapp/models/recipe.dart';

import '../widgets/drawer_content.dart';

import '../screens/categories_screen.dart';
import '../screens/favorite_screen.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  final List<Recepie> favoriteMeals;
  TabScreen(this.favoriteMeals);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> _pages ;
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }


  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories',},
      {'page': FavoriteScreen(widget.favoriteMeals), 'title': 'Youre Favorites'}
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: DrawerContent(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor ,
              icon: Icon(Icons.category), title: Text('Categories')),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.favorite), title: Text('Favorites')),
        ],
      ),
    );
  }
}
