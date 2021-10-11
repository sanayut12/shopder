import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/subCalendar/Calendar_BoxDateComponent.dart';

class Calendar_CalendarTableComponent extends StatefulWidget {
  List<int> bufferNumberInCalendar;
  int select;
  Calendar_CalendarTableComponent(
      {@required this.bufferNumberInCalendar, @required this.select});
  // Function fun;
  @override
  _Calendar_CalendarTableComponentState createState() =>
      _Calendar_CalendarTableComponentState();
}

class _Calendar_CalendarTableComponentState
    extends State<Calendar_CalendarTableComponent> {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    List<int> number = this.widget.bufferNumberInCalendar;
    return Container(
      height: weight_screen * 0.8,
      width: weight_screen * 0.8,
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Calendar_BoxDateComponent(day: number[0], fun: null),
                Calendar_BoxDateComponent(day: number[1], fun: null),
                Calendar_BoxDateComponent(day: number[2], fun: null),
                Calendar_BoxDateComponent(day: number[3], fun: null),
                Calendar_BoxDateComponent(day: number[4], fun: null),
                Calendar_BoxDateComponent(day: number[5], fun: null),
                Calendar_BoxDateComponent(day: number[6], fun: null),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Calendar_BoxDateComponent(day: number[7], fun: null),
                Calendar_BoxDateComponent(day: number[8], fun: null),
                Calendar_BoxDateComponent(day: number[9], fun: null),
                Calendar_BoxDateComponent(day: number[10], fun: null),
                Calendar_BoxDateComponent(day: number[11], fun: null),
                Calendar_BoxDateComponent(day: number[12], fun: null),
                Calendar_BoxDateComponent(day: number[13], fun: null),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Calendar_BoxDateComponent(day: number[14], fun: null),
                Calendar_BoxDateComponent(day: number[15], fun: null),
                Calendar_BoxDateComponent(day: number[16], fun: null),
                Calendar_BoxDateComponent(day: number[17], fun: null),
                Calendar_BoxDateComponent(day: number[18], fun: null),
                Calendar_BoxDateComponent(day: number[19], fun: null),
                Calendar_BoxDateComponent(day: number[20], fun: null),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Calendar_BoxDateComponent(day: number[21], fun: null),
                Calendar_BoxDateComponent(day: number[22], fun: null),
                Calendar_BoxDateComponent(day: number[23], fun: null),
                Calendar_BoxDateComponent(day: number[24], fun: null),
                Calendar_BoxDateComponent(day: number[25], fun: null),
                Calendar_BoxDateComponent(day: number[26], fun: null),
                Calendar_BoxDateComponent(day: number[27], fun: null),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Calendar_BoxDateComponent(day: number[28], fun: null),
                Calendar_BoxDateComponent(day: number[29], fun: null),
                Calendar_BoxDateComponent(day: number[30], fun: null),
                Calendar_BoxDateComponent(day: number[31], fun: null),
                Calendar_BoxDateComponent(day: number[32], fun: null),
                Calendar_BoxDateComponent(day: number[33], fun: null),
                Calendar_BoxDateComponent(day: number[34], fun: null),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Calendar_BoxDateComponent(day: number[35], fun: null),
                Calendar_BoxDateComponent(day: number[36], fun: null),
                Calendar_BoxDateComponent(day: number[37], fun: null),
                Calendar_BoxDateComponent(day: number[38], fun: null),
                Calendar_BoxDateComponent(day: number[39], fun: null),
                Calendar_BoxDateComponent(day: number[40], fun: null),
                Calendar_BoxDateComponent(day: number[41], fun: null),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
