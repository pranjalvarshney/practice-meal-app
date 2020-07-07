import 'package:flutter/material.dart';
import 'package:meals_app/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem({this.id, this.color, this.title});

  void selectcategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed("/category-meals",
        arguments: {"id": id, "title": title, "color": color});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectcategory(context),
      child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
          ),
          decoration: BoxDecoration(
            gradient: RadialGradient(colors: [color.withOpacity(0.7), color]),
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }
}
