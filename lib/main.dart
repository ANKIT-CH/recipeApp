import 'package:flutter/material.dart';
import 'package:racipe_app/widgets/main_drawer.dart';

import 'pages/categories_page.dart';
import 'pages/category_meals_page.dart';
import './pages/meals_detail_page.dart';
import './pages/tabs_page.dart';
import './pages/filters_page.dart';
import './data.dart';
import './models/meals.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = dummyMeals;
  List<Meal> _favouriteMeals = [];

  void _setFilters(Map<String, bool> filters) {
    setState(() {
      _filters = filters;
    });
    _availableMeals = dummyMeals.where((meal) {
      if (filters['gluten'] && !meal.isGlutenFree) return false;
      if (filters['lactose'] && !meal.isLactoseFree) return false;
      if (filters['vegan'] && !meal.isVegan) return false;
      if (filters['vegetarian'] && !meal.isVegetarian) return false;

      return true;
    }).toList();
  }

  void _toggleFavourite(String id) {
    if (_favouriteMeals.indexWhere((element) => element.id == id) >= 0) {
      setState(() {
        _favouriteMeals.removeWhere((element) => element.id == id);
      });
    } else {
      setState(() {
        _favouriteMeals
            .add(dummyMeals.firstWhere((element) => element.id == id));
      });
    }
  }

  bool _isFaouriteMeal(String id) {
    return _favouriteMeals.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.red,
          canvasColor: Color.fromRGBO(225, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                body2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                title: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RoboCondensed',
                  fontWeight: FontWeight.bold,
                ),
              )),
      // home: MyHomePage(),
      // home: TabsPage(),
      initialRoute: '/',
      routes: {
        "/": (ctx) => TabsPage(_favouriteMeals),
        CategoryMealsPage.routeName: (ctx) =>
            CategoryMealsPage(_availableMeals),
        MealsDetailPage.routeName: (ctx) =>
            MealsDetailPage(_isFaouriteMeal, _toggleFavourite),
        FiltersPage.routeName: (ctx) => FiltersPage(_filters, _setFilters),
      },

      onGenerateRoute: (settings) {
        return;
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoryLook());
      },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('delimeals'),
//       ),
//       body: CategoryLook(),
//     );
//   }
// }
