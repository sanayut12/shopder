import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calendar_BoxDateComponent extends StatefulWidget {
  int day;
  List<int> event;
  int select;
  final Function fun;
  Calendar_BoxDateComponent(
      {@required this.day,
      @required this.event,
      @required this.select,
      @required this.fun});
  @override
  _Calendar_BoxDateComponentState createState() =>
      _Calendar_BoxDateComponentState();
}

class _Calendar_BoxDateComponentState extends State<Calendar_BoxDateComponent> {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    if (this.widget.day == 0) {
      return Expanded(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Container(
              alignment: Alignment.center,
              // color: Colors.red,
              child: Text("")),
        ),
      );
    } else {
      return Expanded(
        child: GestureDetector(
          onTap: () {
            this.widget.fun(this.widget.day);
          },
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: this.widget.select == this.widget.day
                      ? Colors.blue[300].withOpacity(0.5)
                      : Colors.transparent,
                ),
                alignment: Alignment.center,
                child: Text("${this.widget.day}"),
              ),
              Container(
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.topRight,
                child: this.widget.event.contains(this.widget.day)
                    ? Image(
                        height: weight_screen * 0.05,
                        width: weight_screen * 0.05,
                        image: AssetImage("assets/image/markCalendar.png"))
                    : Text(""),
              ),
            ],
          ),
        ),
      );
    }
  }
}
