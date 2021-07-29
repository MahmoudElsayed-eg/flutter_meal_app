import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meal_app/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static final String routeName = "/meals_details";

  const MealDetailScreen({Key? key}) : super(key: key);

  Widget buildText(BuildContext context, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: child,
      height: 150,
      width: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,border: Border.all(color: Colors.grey)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(meal.imageUrl,
                width: double.infinity, height: 300, fit: BoxFit.cover),
            buildText(context, "Ingredient"),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) => Card(
                child: Text(meal.ingredients[index]),
                color: Theme.of(context).accentColor,
              ),
              itemCount: meal.ingredients.length,
            )),
            buildText(context, "Steps"),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(child: Text("# ${index + 1}"),),
                    title: Text(meal.steps[index]),
                  ),
                  Divider()
                ],
              ),
              itemCount: meal.steps.length,
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).pop(meal.id);
      },child: Icon(Icons.delete),),
    );
  }
}
