import 'package:flutter/material.dart';
import 'package:meals_app/category_meal_screen.dart';
import 'package:meals_app/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      routes: {
        '/category-meals': (context) => CategoryMealsScreen(),
      },
    );
  }
}
