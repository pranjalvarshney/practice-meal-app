import 'package:flutter/material.dart';

enum Complexity { Simple, Challenging, Difficult }
enum Affordability { Affordable, Pricey, Luxurious }

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final int cooktime;
  final List<String> steps;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isVegetarian;
  final bool isVegan;
  final bool isLactoseFree;

  const Meal(
      {@required this.id,
      @required this.complexity,
      @required this.cooktime,
      @required this.steps,
      @required this.ingredients,
      @required this.categories,
      @required this.imageUrl,
      @required this.title,
      @required this.affordability,
      @required this.isGlutenFree,
      @required this.isLactoseFree,
      @required this.isVegan,
      @required this.isVegetarian});
}
