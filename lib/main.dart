import 'package:cookingapp/dummy_data.dart';
import 'package:cookingapp/models/recipe.dart';

import './screens/filter_screen.dart';
import 'package:flutter/material.dart';
import './screens/tab_screen.dart';
import './screens/cook_detail_screen.dart';
import 'screens/category_cook_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };
  List<Recepie> _availableMeals = DUMMY_RECEPIE;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_RECEPIE.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cooking App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            subtitle1: TextStyle(
                fontSize: 20.0,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold)),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabScreen(),
        CategoryCookScreen.categoryRouteName: (ctx) =>
            CategoryCookScreen(_availableMeals),
        CookDetailScreen.routeName: (ctx) => CookDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CookDetailScreen());
      },
    );
  }
}
