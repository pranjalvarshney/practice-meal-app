import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routename = "/category-meals";

  final List<Meal> _availablemeals;
  CategoryMealsScreen(this._availablemeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final id = routeArgs['id'];
    final title = routeArgs['title'];
    final color = routeArgs['color'];
    final mealCategory = widget._availablemeals
        .where((element) => element.categories.contains(id))
        .toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: color,
        ),
        body: ListView.builder(
          itemCount: mealCategory.length,
          itemBuilder: (context, index) {
            return MealItem(
              id: mealCategory[index].id,
              title: mealCategory[index].title,
              imageUrl: mealCategory[index].imageUrl,
              cooktime: mealCategory[index].cooktime,
              complexity: mealCategory[index].complexity,
              affordability: mealCategory[index].affordability,
            );
          },
        ));
  }
}
