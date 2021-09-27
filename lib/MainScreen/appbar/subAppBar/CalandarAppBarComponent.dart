import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/CalendarScreen.dart';

class CalendarAppBarComponent extends StatefulWidget {
  @override
  _CalendarAppBarComponentState createState() =>
      _CalendarAppBarComponentState();
}

class _CalendarAppBarComponentState extends State<CalendarAppBarComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => CalendarScreen()));
          },
          icon: Icon(
            Icons.calendar_today,
            size: MediaQuery.of(context).size.width * 0.1,
          )),
    );
  }
}
