import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meal_app/screens/meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;

  const CategoryItem({Key? key, required this.title, required this.color})
      : super(key: key);

  void selectCategory(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return MealScreen();
    } ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      onTap:() => selectCategory(context),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
        child: Center(
            child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
          textAlign: TextAlign.center,
        )),
      ),
    );
  }
}
