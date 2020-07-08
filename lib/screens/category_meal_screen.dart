import 'package:flutter/material.dart';
import 'package:meals_app/dummy_category_data.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routename = "/category-meals";

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final id = routeArgs['id'];
    final title = routeArgs['title'];
    final color = routeArgs['color'];
    final mealCategory = DUMMY_MEALS
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
