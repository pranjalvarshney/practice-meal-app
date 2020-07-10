import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavoriteScreen extends StatefulWidget {
  final List<Meal> favouriteMeal;
  FavoriteScreen(this.favouriteMeal);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.favouriteMeal);
    if (widget.favouriteMeal.isEmpty) {
      return Center(
        child: Container(
          child: Text("You have no favorites yet - Start adding some!",
              style: TextStyle(fontSize: 16, color: Colors.grey)),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: widget.favouriteMeal.length,
        itemBuilder: (context, index) {
          return MealItem(
            id: widget.favouriteMeal[index].id,
            title: widget.favouriteMeal[index].title,
            imageUrl: widget.favouriteMeal[index].imageUrl,
            cooktime: widget.favouriteMeal[index].cooktime,
            complexity: widget.favouriteMeal[index].complexity,
            affordability: widget.favouriteMeal[index].affordability,
          );
        },
      );
    }
  }
}
