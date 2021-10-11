import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end:
              Alignment(0.8, 1.0), // 10% of the width, so there are ten blinds.
          colors: <Color>[Color(0xffFA897B), Color(0xfffffff)],
        ),
      ),
      child: Column(
        children: [],
      ),
    );
  }
}
