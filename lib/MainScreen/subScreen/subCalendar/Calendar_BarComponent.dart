import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calendar_BarComponent extends StatefulWidget {
  int year;
  int month;
  final Function ChangeMonth;
  Calendar_BarComponent(
      {@required this.year, @required this.month, @required this.ChangeMonth});
  @override
  _Calendar_BarComponentState createState() => _Calendar_BarComponentState();
}

class _Calendar_BarComponentState extends State<Calendar_BarComponent> {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    Widget Box = Container(
      alignment: Alignment.center,
      child: Row(
        children: [
          Text("${this.widget.month}",
              style: TextStyle(fontSize: weight_screen * 0.08)),
          Text(
            "${this.widget.year}",
            style: TextStyle(fontSize: weight_screen * 0.05),
          )
        ],
      ),
    );
    return Container(
      width: weight_screen * 0.8,
      height: weight_screen * 0.1,
      child: Row(
        children: [
          Button(
              icon: Icons.keyboard_arrow_left_outlined,
              fun: this.widget.ChangeMonth,
              index: -1),
          Expanded(child: Box),
          Button(
              icon: Icons.keyboard_arrow_right_outlined,
              fun: this.widget.ChangeMonth,
              index: 1)
        ],
      ),
    );
  }
}

class Button extends StatefulWidget {
  IconData icon;
  final Function fun;
  int index;
  Button({@required this.icon, @required this.fun, @required this.index});
  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        this.widget.fun(this.widget.index);
      },
      child: Container(
        height: weight_screen * 0.1,
        width: weight_screen * 0.1,
        alignment: Alignment.center,
        child: Icon(
          this.widget.icon,
          size: weight_screen * 0.09,
        ),
      ),
    );
  }
}
