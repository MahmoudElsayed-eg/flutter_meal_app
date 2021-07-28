import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../widgets/meal_item.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({Key? key}) : super(key: key);

  static const routeName = "/meals-screen";

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute
        .of(context)!
        .settings
        .arguments as Map<String, String>;
    final String id = args["id"]!;
    final String title = args["title"]!;
    final mealsList = DUMMY_MEALS.where((element) =>
        element.categories.contains(id)).toList();
    return Scaffold(
        appBar: AppBar(title: Text(title),),
        body: ListView.builder(itemBuilder: (ctx, index) {
          return MealItem(meal: mealsList[index]);
        }, itemCount: mealsList.length,));
  }
}
