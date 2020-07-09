import 'package:flutter/material.dart';
import 'package:meals_app/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget _listHeading(
      BuildContext context, IconData icon, String title, Function ontapfun) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: ontapfun,
    );
  }

  void _onMealTap(BuildContext context) {
    Navigator.of(context).pushReplacementNamed("/");
  }

  void _onFilterTap(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        child: Column(
          children: <Widget>[
            Card(
              elevation: 2,
              margin: const EdgeInsets.all(0),
              child: Container(
                height: 120,
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                alignment: Alignment.centerLeft,
                child: Text("Meal o' meal",
                    style:
                        TextStyle(fontSize: 26, fontWeight: FontWeight.w600)),
              ),
            ),
            _listHeading(
                context, Icons.restaurant, "Meals", () => _onMealTap(context)),
            _listHeading(
                context, Icons.settings, "Filter", () => _onFilterTap(context)),
          ],
        ),
      ),
    );
  }
}
