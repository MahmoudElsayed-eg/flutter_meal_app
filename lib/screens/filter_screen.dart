import 'package:flutter/material.dart';
import 'package:flutter_meal_app/widgets/main_drawer.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);
  static const String routeName = "/filter_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("filter")),
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text("Filters"),
      ),
    );
  }
}
