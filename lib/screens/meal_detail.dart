import 'package:flutter/material.dart';
import 'package:meals_app/dummy_category_data.dart';

class MealDetail extends StatelessWidget {
  static const routeName = "/meal-detail";
  final Function _favMealToggle;
  final Function _isfavMeal;
  MealDetail(this._favMealToggle, this._isfavMeal);

  Widget _section(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Text(
        text,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final meal = DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
          backgroundColor: Colors.redAccent,
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(
              _isfavMeal(mealId) ? Icons.favorite : Icons.favorite_border,
            ),
            onPressed: () => _favMealToggle(mealId)),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Container(
                      child: Image.network(
                        meal.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: Card(
                        elevation: 3,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.schedule,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '${meal.cooktime} mins',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _section(context, "Ingrediants"),
                    Container(
                      height: 200,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      child: ListView.builder(
                          itemCount: meal.ingredients.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.control_point),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(meal.ingredients[index]),
                                ],
                              ),
                            );
                          }),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _section(context, "Steps to cook"),
                    Container(
                      height: 200,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      child: ListView.builder(
                          itemCount: meal.steps.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Icon(Icons.control_point),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: 250,
                                    child: Text(
                                      meal.steps[index],
                                      maxLines: 3,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
