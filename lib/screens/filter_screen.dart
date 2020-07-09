import 'package:flutter/material.dart';
import 'package:meals_app/widgets/drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = "/filter-screen";

  final Function saveFilter;
  final Map<String, bool> _cfilters;

  FilterScreen(this._cfilters, this.saveFilter);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isGlutenfree = false;
  bool _isVegetarian = false;
  bool _isVegan = false;
  bool _isLactoseFree = false;

  void _filterSelect() {}

  Widget _filterList(
      String title, String subtitle, bool isoption, Function ontapfun) {
    return SwitchListTile(
      title: Text(title),
      value: isoption,
      subtitle: Text(subtitle),
      onChanged: ontapfun,
    );
  }

  @override
  void initState() {
    _isGlutenfree = widget._cfilters['gluten'];
    _isLactoseFree = widget._cfilters['lactose'];
    _isVegetarian = widget._cfilters['vegetarian'];
    _isVegan = widget._cfilters['vegan'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Filters"), actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _isGlutenfree,
                  'vegan': _isVegan,
                  'vegetarian': _isVegetarian,
                  'lactose': _isLactoseFree,
                };
                widget.saveFilter(selectedFilters);
              })
        ]),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
                padding: const EdgeInsets.all(20),
                child: Text("Filter your meal")),
            Expanded(
                child: ListView(
              children: <Widget>[
                _filterList("Gluten-free", "Only include gluten-free meals",
                    _isGlutenfree, (value) {
                  setState(() {
                    _isGlutenfree = value;
                  });
                }),
                _filterList("Lactose-free", "Only include lacotse-free meals",
                    _isLactoseFree, (value) {
                  setState(() {
                    _isLactoseFree = value;
                  });
                }),
                _filterList("Vegetarian", "Only include Vegetarian meals",
                    _isVegetarian, (value) {
                  setState(() {
                    _isVegetarian = value;
                  });
                }),
                _filterList("Vegan", "Only include Vegan meals", _isVegan,
                    (value) {
                  setState(() {
                    _isVegan = value;
                  });
                })
              ],
            )),
          ],
        ));
  }
}
