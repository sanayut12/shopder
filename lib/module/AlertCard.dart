import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertCard extends StatefulWidget {
  @override
  _AlertCardState createState() => _AlertCardState();
}

class _AlertCardState extends State<AlertCard> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("ตกลง"))
      ],
      content: Text("ddddd"),
    );
  }
}
