import 'package:flutter/material.dart';
import 'package:flutter_meal_app/models/meal.dart';
import '../widgets/meal_item.dart';

class MealScreen extends StatefulWidget {
  const MealScreen({Key? key,required this.list}) : super(key: key);
  final List<Meal> list;
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
      mealsList = widget.list.where((element) =>
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
        body: widget.list.length==0? Center(child: const Text("No meals found!"),) :ListView.builder(itemBuilder: (ctx, index) {
          return MealItem(meal: mealsList[index]);
        }, itemCount: mealsList.length,));
  }
}
