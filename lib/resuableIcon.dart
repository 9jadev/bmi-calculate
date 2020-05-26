import 'package:flutter/material.dart';
import 'constants.dart';
class ReusableIcons extends StatelessWidget {
  ReusableIcons({@required this.text , @required this.color , @required this.icon});
  final String text;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
            height: 15.0
        ),
        Text(
          text ,
          style:  TextStyle(
          fontSize: 18.0, color: color
        ),)
      ],
    );
  }
}