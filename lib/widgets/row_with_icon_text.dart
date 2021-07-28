import 'package:flutter/material.dart';
class RowItemIconText extends StatelessWidget {
  const RowItemIconText({Key? key,required this.icon,required this.text}) : super(key: key);
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(icon),
      SizedBox(width: 6,),
      Text(text)
    ],);
  }
}
