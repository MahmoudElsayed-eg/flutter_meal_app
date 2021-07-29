import 'package:flutter/material.dart';
import 'package:flutter_meal_app/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String title,IconData iconData , Function function) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(fontFamily: "Roboto",fontWeight: FontWeight.bold,),
      ),
      onTap: () => function(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 120,
            color: theme.accentColor,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                  color: theme.primaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 30),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile("Meals", Icons.restaurant,() {
            Navigator.of(context).pushReplacementNamed("/");
          }),
          buildListTile("Filters", Icons.settings,() {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          }),
        ],
      ),
    );
  }
}
