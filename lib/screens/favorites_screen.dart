import 'package:flutter/material.dart';
import 'package:flutter_meal_app/models/meal.dart';
import 'package:flutter_meal_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key, required this.favorite}) : super(key: key);
  final List<Meal> favorite;

  @override
  Widget build(BuildContext context) {
    return favorite.length == 0
        ? Center(
            child: Text(
              "No favorite set yet - add some!",
              style: Theme.of(context).textTheme.headline6,
            ),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return MealItem(meal: favorite[index]);
            },
            itemCount: favorite.length,
          );
  }
}
