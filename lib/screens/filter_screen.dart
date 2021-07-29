import 'package:flutter/material.dart';
import 'package:flutter_meal_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key, required this.function, required this.filters}) : super(key: key);
  static const String routeName = "/filter_screen";
  final Function function;
  final Map<String,bool> filters;

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late bool _vegan;
  late bool _vegetarian;
  late bool _lactoseFree;
  late bool _glutenFree;

  @override
  void initState() {
    _vegan = widget.filters["vegan"]!;
    _vegetarian = widget.filters["vegetarian"]!;
    _lactoseFree = widget.filters["lactose"]!;
    _glutenFree = widget.filters["gluten"]!;
    super.initState();
  }

  Widget _buildSwitchList(
      String title, String description, bool value, Function updateValue) {
    return SwitchListTile(
      value: value,
      onChanged: (value) => updateValue(value),
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          _buildSwitchList(
              "Gluten-Free", "Only include gluten-free meals", _glutenFree,
              (newValue) {
            setState(() {
              _glutenFree = newValue;
            });
          }),
          _buildSwitchList(
              "Lactose-Free", "Only include lactose-free meals", _lactoseFree,
              (newValue) {
            setState(() {
              _lactoseFree = newValue;
            });
          }),
          _buildSwitchList(
              "Vegetarian", "Only include vegetarian meals", _vegetarian,
              (newValue) {
            setState(() {
              _vegetarian = newValue;
            });
          }),
          _buildSwitchList("Vegan", "Only include vegan meals", _vegan,
              (newValue) {
            setState(() {
              _vegan = newValue;
            });
          }),
        ],
      ),
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(
              onPressed: () {
                final Map<String, bool> selectedFilters = {
                  "gluten": _glutenFree,
                  "lactose": _lactoseFree,
                  "vegan": _vegan,
                  "vegetarian": _vegetarian,
                };
                widget.function(selectedFilters);
              },
              icon: Icon(Icons.save)),
        ],
      ),
    );
  }
}
