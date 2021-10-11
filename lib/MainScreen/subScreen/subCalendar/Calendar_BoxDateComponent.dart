import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calendar_BoxDateComponent extends StatefulWidget {
  int day;
  final Function fun;
  Calendar_BoxDateComponent({@required this.day, @required this.fun});
  @override
  _Calendar_BoxDateComponentState createState() =>
      _Calendar_BoxDateComponentState();
}

class _Calendar_BoxDateComponentState extends State<Calendar_BoxDateComponent> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Container(
            alignment: Alignment.center,
            // color: Colors.red,
            child: Text("${this.widget.day == 0 ? '' : this.widget.day}")),
      ),
    );
  }
}
