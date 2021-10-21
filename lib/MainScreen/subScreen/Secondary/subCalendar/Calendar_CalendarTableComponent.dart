import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/Secondary/subCalendar/Calendar_BoxDateComponent.dart';

class Calendar_CalendarTableComponent extends StatefulWidget {
  List<int> bufferNumberInCalendar;
  List<int> bufferEvent;
  int select;
  final Function SelectDay;
  Calendar_CalendarTableComponent(
      {@required this.bufferNumberInCalendar,
      @required this.bufferEvent,
      @required this.select,
      @required this.SelectDay});
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
    List<int> bufferEvent = this.widget.bufferEvent;
    int select = this.widget.select;
    return Container(
      height: weight_screen * 0.8,
      width: weight_screen * 0.8,
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Calendar_BoxDateComponent(
                    day: number[0],
                    event: bufferEvent,
                    select: select,
                    fun: this.widget.SelectDay),
                Calendar_BoxDateComponent(
                    day: number[1],
                    event: bufferEvent,
                    select: select,
                    fun: this.widget.SelectDay),
                Calendar_BoxDateComponent(
                    day: number[2],
                    event: bufferEvent,
                    select: select,
                    fun: this.widget.SelectDay),
                Calendar_BoxDateComponent(
                    day: number[3],
                    event: bufferEvent,
                    select: select,
                    fun: this.widget.SelectDay),
                Calendar_BoxDateComponent(
                    day: number[4],
                    event: bufferEvent,
                    select: select,
                    fun: this.widget.SelectDay),
                Calendar_BoxDateComponent(
                    day: number[5],
                    event: bufferEvent,
                    select: select,
                    fun: this.widget.SelectDay),
                Calendar_BoxDateComponent(
                    day: number[6],
                    event: bufferEvent,
                    select: select,
                    fun: this.widget.SelectDay),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Calendar_BoxDateComponent(
                    day: number[7],
                    event: bufferEvent,
                    select: select,
                    fun: this.widget.SelectDay),
                Calendar_BoxDateComponent(
                    day: number[8],
                    event: bufferEvent,
                    select: select,
                    fun: this.widget.SelectDay),
                Calendar_BoxDateComponent(
                    day: number[9],
                    event: bufferEvent,
                    select: select,
                    fun: this.widget.SelectDay),
                Calendar_BoxDateComponent(
                    day: number[10],
                    event: bufferEvent,
                    select: select,
                    fun: this.widget.SelectDay),
                Calendar_BoxDateComponent(
                    day: number[11],
                    event: bufferEvent,
                    select: select,
                    fun: this.widget.SelectDay),
                Calendar_BoxDateComponent(
                    day: number[12],
                    event: bufferEvent,
                    select: select,
                    fun: this.widget.SelectDay),
                Calendar_BoxDateComponent(
                    day: number[13],
                    event: bufferEvent,
                    select: select,
                    fun: this.widget.SelectDay),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Calendar_BoxDateComponent(
                    day: number[14],
                    event: bufferEvent,
                    select: select,
                    fun: this.widget.SelectDay),
                Calendar_BoxDateComponent(
                    day: number[15],
                    event: bufferEvent,
                    select: select,
                    fun: this.widget.SelectDay),
                Calendar_BoxDateComponent(
                    day: number[16],
                    event: bufferEvent,
                    select: select,
                    fun: this.widget.SelectDay),
                Calendar_BoxDateComponent(
                    day: number[17],
                    event: bufferEvent,
                    select: select,
                    fun: this.widget.SelectDay),
                Calendar_BoxDateComponent(
                    day: number[18],
                    event: bufferEvent,
                    select: select,
                    fun: this.widget.SelectDay),
                Calendar_BoxDateComponent(
                    day: number[19],
                    event: bufferEvent,
                    select: select,
                    fun: this.widget.SelectDay),
                Calendar_BoxDateComponent(
                    day: number[20],
                    event: bufferEvent,
                    select: select,
                    fun: this.widget.SelectDay),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Calendar_BoxDateComponent(
                    day: number[21],
                    event: bufferEvent,
                    select: select,
                    fun: this.widget.SelectDay),
                Calendar_BoxDateComponent(
                    day: number[22],
                    event: bufferEvent,
                    select: select,
                    fun: this.widget.SelectDay),
                Calendar_BoxDateComponent(
                    day: number[23],
                    event: bufferEvent,
                    select: select,
                    fun: this.widget.SelectDay),
                Calendar_BoxDateComponent(
                    day: number[24],
                    event: bufferEvent,
                    select: select,
                    fun: this.widget.SelectDay),
                Calendar_BoxDateComponent(
                    day: number[25],
                    event: bufferEvent,
                    select: select,
                    fun: this.widget.SelectDay),
                Calendar_BoxDateComponent(
                    day: number[26],
                    event: bufferEvent,
                    select: select,
                    fun: this.widget.SelectDay),
                Calendar_BoxDateComponent(
                    day: number[27],
                    event: bufferEvent,
                    select: select,
                    fun: this.widget.SelectDay),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Calendar_BoxDateComponent(
                    day: number[28],
                    event: bufferEvent,
                    select: select,
                    fun: this.widget.SelectDay),
                Calendar_BoxDateComponent(
                    day: number[29],
                    event: bufferEvent,
                    select: select,
                    fun: this.widget.SelectDay),
                Calendar_BoxDateComponent(
                    day: number[30],
                    event: bufferEvent,
                    select: select,
                    fun: this.widget.SelectDay),
                Calendar_BoxDateComponent(
                    day: number[31],
                    event: bufferEvent,
                    select: select,
                    fun: this.widget.SelectDay),
                Calendar_BoxDateComponent(
                    day: number[32],
                    event: bufferEvent,
                    select: select,
                    fun: this.widget.SelectDay),
                Calendar_BoxDateComponent(
                    day: number[33],
                    event: bufferEvent,
                    select: select,
                    fun: this.widget.SelectDay),
                Calendar_BoxDateComponent(
                    day: number[34],
                    event: bufferEvent,
                    select: select,
                    fun: this.widget.SelectDay),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Calendar_BoxDateComponent(
                    day: number[35],
                    event: bufferEvent,
                    select: select,
                    fun: this.widget.SelectDay),
                Calendar_BoxDateComponent(
                    day: number[36],
                    event: bufferEvent,
                    select: select,
                    fun: this.widget.SelectDay),
                Calendar_BoxDateComponent(
                    day: number[37],
                    event: bufferEvent,
                    select: select,
                    fun: this.widget.SelectDay),
                Calendar_BoxDateComponent(
                    day: number[38],
                    event: bufferEvent,
                    select: select,
                    fun: this.widget.SelectDay),
                Calendar_BoxDateComponent(
                    day: number[39],
                    event: bufferEvent,
                    select: select,
                    fun: this.widget.SelectDay),
                Calendar_BoxDateComponent(
                    day: number[40],
                    event: bufferEvent,
                    select: select,
                    fun: this.widget.SelectDay),
                Calendar_BoxDateComponent(
                    day: number[41],
                    event: bufferEvent,
                    select: select,
                    fun: this.widget.SelectDay),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
