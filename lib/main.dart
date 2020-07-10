import 'package:flutter/material.dart';
import 'package:meals_app/dummy_category_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/category_meal_screen.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/screens/meal_detail.dart';
import 'package:meals_app/screens/tab_srceen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'vegan': false,
    'vegetarian': false,
    'lactose': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favMeals = [];

  void _setFilter(Map<String, bool> data) {
    setState(() {
      _filters = data;
      _availableMeals = DUMMY_MEALS.where((meal) {
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

  void _favMealFunction(String mealId) {
    final index = _favMeals.indexWhere((meal) => meal.id == mealId);

    if (index >= 0) {
      setState(() {
        _favMeals.removeAt(index);
      });
    } else {
      setState(() {
        _favMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool _isMealFav(String mealId) {
    return _favMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabScreen(_favMeals),
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      routes: {
        CategoryMealsScreen.routename: (context) =>
            CategoryMealsScreen(_availableMeals),
        MealDetail.routeName: (context) =>
            MealDetail(_favMealFunction, _isMealFav),
        FilterScreen.routeName: (context) => FilterScreen(_filters, _setFilter),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => TabScreen(_favMeals));
      },
    );
  }
}
