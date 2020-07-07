import 'package:flutter/material.dart';
import 'package:meals_app/categories_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yum Meals"),
      ),
      body: CategoriesScreen(),
    );
  }
}
