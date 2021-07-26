import 'package:flutter/material.dart';
import 'package:flutter_meal_app/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),children: DUMMY_CATEGORIES.map((e) {
                return Container(color: e.color,child: Center(child: Text(e.title)),);
      }).toList(),),
    );
  }
}
