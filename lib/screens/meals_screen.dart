import 'package:flutter/material.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({Key? key}) : super(key: key);

  static const routeName = "/meals-screen";

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String,String>;
    //final String id = args["id"]!;
    final String title = args["title"]!;
    return Scaffold(
      appBar: AppBar(title: Text(title),),
        body: Center(
            child: Container(
      child: Text("haha"),
    )));
  }
}
