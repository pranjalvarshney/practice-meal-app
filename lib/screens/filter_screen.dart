import 'package:flutter/material.dart';
import 'package:meals_app/widgets/drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = "/filter-screen";

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Filters"),
        ),
        drawer: MainDrawer(),
        body: Center(
          child: Text("filter"),
        ));
  }
}
