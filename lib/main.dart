import 'package:flutter/material.dart';
import 'package:flutter_meal_app/data/dummy_data.dart';
import 'package:flutter_meal_app/models/meal.dart';
import 'package:flutter_meal_app/screens/filter_screen.dart';
import 'package:flutter_meal_app/screens/meal_detail_screen.dart';
import 'package:flutter_meal_app/screens/meals_screen.dart';
import 'package:flutter_meal_app/screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false,
  };

  List<Meal> _meals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filters) {
    setState(() {
      _filters = filters;
      _meals = DUMMY_MEALS.where((element) {
        if (_filters["gluten"]! && !element.isGlutenFree) {
          return false;
        }
        if (_filters["lactose"]! && !element.isLactoseFree) {
          return false;
        }
        if (_filters["vegan"]! && !element.isVegan) {
          return false;
        }
        if (_filters["vegetarian"]! && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _setFavorite(Meal meal,bool value) {
    setState(() {
      if(value) {
        _favoriteMeals.add(meal);
      }else {
        _favoriteMeals.remove(meal);
      }
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            headline6: TextStyle(
                fontSize: 24,
                fontFamily: "Roboto",
                fontWeight: FontWeight.bold)),
        accentColor: Colors.amber,
      ),
      home: BottomTabScreen(favorite: _favoriteMeals,),
      routes: {
        FilterScreen.routeName: (_) => FilterScreen(
              function: _setFilters,
              filters: _filters,
            ),
        MealScreen.routeName: (_) => MealScreen(
              list: _meals,
            ),
        MealDetailScreen.routeName: (_) => MealDetailScreen(favoriteFunction: _isFavorite,function: _setFavorite,)
      },
    );
  }
}
