import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meal_app/models/meal.dart';
import 'package:flutter_meal_app/screens/favorites_screen.dart';

class MealDetailScreen extends StatefulWidget {
  static final String routeName = "/meals_details";

  const MealDetailScreen(
      {Key? key, required this.function, required this.favoriteFunction})
      : super(key: key);
  final Function function;
  final Function favoriteFunction;

  @override
  _MealDetailScreenState createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
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
          color: Colors.white,
          border: Border.all(color: Colors.grey)),
    );
  }

  late bool _isFavorite;
  bool first = false;
  late Meal meal;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!first) {
      meal = ModalRoute.of(context)!.settings.arguments as Meal;
      _isFavorite = widget.favoriteFunction(meal);
      first = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Image.network(meal.imageUrl,
                  width: double.infinity, height: 300, fit: BoxFit.cover),
              Positioned(
                bottom: 20,
                  right: 30,
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          _isFavorite = !_isFavorite;
                          widget.function(meal,_isFavorite);
                        });
                      },
                      icon: _isFavorite
                          ? const Icon(Icons.star,color: Colors.amber,size: 26,)
                          : const Icon(Icons.star_border,color: Colors.amber,size: 26,)))
            ]),
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
                    leading: CircleAvatar(
                      child: Text("# ${index + 1}"),
                    ),
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
    );
  }
}
