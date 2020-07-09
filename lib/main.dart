import 'package:flutter/material.dart';
import 'package:meals_app/screens/category_meal_screen.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/screens/meal_detail.dart';
import 'package:meals_app/screens/tab_srceen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabScreen(),
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      routes: {
        CategoryMealsScreen.routename: (context) => CategoryMealsScreen(),
        MealDetail.routeName: (context) => MealDetail(),
        FilterScreen.routeName: (context) => FilterScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => TabScreen());
      },
    );
  }
}
