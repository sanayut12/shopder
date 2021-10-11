import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/subCalendar/Calendar_AppBarComponent.dart';
import 'package:shopder/MainScreen/subScreen/subCalendar/Calendar_BarComponent.dart';
import 'package:shopder/MainScreen/subScreen/subCalendar/Calendar_CalendarTableComponent.dart';
import 'package:shopder/MainScreen/subScreen/subCalendar/Calender_TableComponent.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  List<int> bufferNumberInCalendar = [];
  int year = 0;
  int month = 0;
  int day = 0;
  int day_select = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    InitCalendar();
  }

  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      color: Color(0xfffa897b),
      child: SafeArea(
          child: Column(
        children: [
          Calendar_AppBarComponent(),
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xfffa897b), Colors.white])),
              child: ListView(
                children: [
                  ////////////////////ส่วนของแสดงผลปฏิทิน///////////////////////
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Calendar_BarComponent(
                              year: year,
                              month: month,
                              ChangeMonth: ChangeMonth,
                            ),
                            Calender_TableComponent(),
                            bufferNumberInCalendar.length == 42
                                ? Calendar_CalendarTableComponent(
                                    bufferNumberInCalendar:
                                        bufferNumberInCalendar,
                                    select: day_select)
                                : Container()
                          ],
                        ),
                      ),
                    ],
                  ),
                  ///////////////////////////////////////////////////////////////////////
                  SizedBox(
                    height: 500,
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    ));
  }

  Future<void> InitCalendar() async {
    for (int i = 0; i < 42; i++) {
      bufferNumberInCalendar.add(0);
    }

    DateTime now = DateTime.now();
    int _year = now.year;
    int _month = now.month;
    year = _year;
    month = _month;
    DateTime date = DateTime(_year, _month);
    int last_day = 0;
    for (int i = 31; i >= 28; i--) {
      DateTime _date = DateTime(_year, _month, i);

      if (_date.month == _month) {
        last_day = i;
        break;
      }
    }

    if (date.day == 7) {
      for (int i = 1; i <= last_day; i++) {
        bufferNumberInCalendar[i] = i;
      }
    } else {
      for (int i = 1; i <= last_day; i++) {
        bufferNumberInCalendar[date.weekday + i - 1] = i;
      }
    }
  }

  Future<void> ChangeMonth(int index) {
    List<int> _bufferNumberInCalendar = [];
    for (int i = 0; i < 42; i++) {
      _bufferNumberInCalendar.add(0);
    }
    bufferNumberInCalendar = _bufferNumberInCalendar;
    month = month + (index * 1);
    if (month == 13) {
      year += 1;
      month = 1;
    } else if (month == 0) {
      year -= 1;
      month = 12;
    }
    int last_day = 0;
    DateTime date = DateTime(year, month);
    for (int i = 31; i >= 28; i--) {
      DateTime _date = DateTime(year, month, i);

      if (_date.month == month) {
        last_day = i;
        break;
      }
    }

    if (date.day == 7) {
      for (int i = 1; i <= last_day; i++) {
        bufferNumberInCalendar[i] = i;
      }
    } else {
      for (int i = 1; i <= last_day; i++) {
        bufferNumberInCalendar[date.weekday + i - 1] = i;
      }
    }
    setState(() {});
  }
}
