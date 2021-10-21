import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calendar_AppBarComponent extends StatefulWidget {
  @override
  _Calendar_AppBarComponentState createState() =>
      _Calendar_AppBarComponentState();
}

class _Calendar_AppBarComponentState extends State<Calendar_AppBarComponent> {
  @override
  Widget build(BuildContext context) {
    Widget ButtonBack = GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        height: 65,
        width: 65,
        alignment: Alignment.center,
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
    );
    return Container(
      height: 65,
      width: double.infinity,
      color: Color(0xfffa897b),
      child: Row(
        children: [
          ButtonBack,
          Text(
            "ปฏิทิน",
            style: TextStyle(
                fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white),
          )
        ],
      ),
    );
  }
}
