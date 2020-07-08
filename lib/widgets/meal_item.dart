import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_detail.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int cooktime;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    @required this.id,
    @required this.affordability,
    @required this.cooktime,
    @required this.imageUrl,
    @required this.title,
    @required this.complexity,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Difficult:
        return "Difficult";
        break;
      default:
        return "Unknown";
    }
  }

  String get affordText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      default:
        return "Unknown";
    }
  }

  void navigateFun(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetail.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigateFun(context),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.all(16),
        child: Container(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16)),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        height: 200,
                        width: double.infinity,
                      )),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      color: Colors.black54,
                      child: Text(
                        title,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                        softWrap: true,
                        maxLines: 2,
                        textWidthBasis: TextWidthBasis.parent,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.schedule),
                        SizedBox(
                          width: 5,
                        ),
                        Text('$cooktime mins')
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.code),
                        SizedBox(
                          width: 5,
                        ),
                        Text(complexityText)
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.restaurant_menu),
                        SizedBox(
                          width: 5,
                        ),
                        Text(affordText)
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
