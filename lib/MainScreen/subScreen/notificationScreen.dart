import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    Widget Buttom1 = Container(
      width: double.infinity,
      color: Colors.green,
      child: Text("data"),
    );
    Widget Buttom2 = Container(
      color: Colors.blue,
      child: Text("data"),
    );
    Widget Buttom3 = Container(
      width: double.infinity,
      color: Colors.red,
      child: Text("data"),
    );

    return Container(
      child: Column(
        children: [
          Expanded(child: Buttom1),
          Expanded(child: Buttom2),
          Expanded(child: Buttom3)
        ],
      ),
    );
  }
}
