import 'package:flutter/material.dart';
import 'package:meals_app/screens/category_meal_screen.dart';
import 'package:meals_app/screens/home_page.dart';
import 'package:meals_app/screens/meal_detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      routes: {
        CategoryMealsScreen.routename: (context) => CategoryMealsScreen(),
        MealDetail.routeName: (context) => MealDetail(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoryMealsScreen());
      },
    );
  }
}
