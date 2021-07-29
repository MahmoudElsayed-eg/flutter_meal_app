import 'package:flutter/material.dart';
import 'package:flutter_meal_app/models/meal.dart';
import '../data/dummy_data.dart';
import '../widgets/meal_item.dart';

class MealScreen extends StatefulWidget {
  const MealScreen({Key? key}) : super(key: key);

  static const routeName = "/meals-screen";

  @override
  _MealScreenState createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  late List<Meal> mealsList;
  late String title;
  bool _isFirstLoaded = false;

  @override
  initState() {

    super.initState();
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if(!_isFirstLoaded) {
      final args = ModalRoute
          .of(context)!
          .settings
          .arguments as Map<String, String>;
      final String id = args["id"]!;
      title = args["title"]!;
      mealsList = DUMMY_MEALS.where((element) =>
          element.categories.contains(id)).toList();
      _isFirstLoaded = true;
    }
    super.didChangeDependencies();
  }

  void _deleteMeal(String id) {
    setState(() {
      mealsList.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title),),
        body: ListView.builder(itemBuilder: (ctx, index) {
          return MealItem(meal: mealsList[index],function: _deleteMeal,);
        }, itemCount: mealsList.length,));
  }
}
