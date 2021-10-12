import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/subCalendar/Calendar_AppBarComponent.dart';
import 'package:shopder/MainScreen/subScreen/subCalendar/Calendar_BarComponent.dart';
import 'package:shopder/MainScreen/subScreen/subCalendar/Calendar_CalendarTableComponent.dart';
import 'package:shopder/MainScreen/subScreen/subCalendar/Calendar_ListEventComponent.dart';
import 'package:shopder/MainScreen/subScreen/subCalendar/Calender_TableComponent.dart';
import 'package:shopder/function/dataManagement/dataCalendar.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';
import 'package:shopder/function/dataManagement/dateBox.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostCalendar.dart';
import 'package:shopder/function/http/httpGetPostCalendar.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  List<int> bufferNumberInCalendar = []; //จำนวน 42 ตัว
  List<int> bufferEvent = []; //ใส่วันที่ ที่มีเหตุการณ์
  int year = 0;
  int month = 0;
  int day = 0;
  int day_select = 0;
  Map<String, PostCalendar> bufferPost = {};
  Map<String, PostCalendar> bufferPostEventSelectDay = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetPost();
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
                                    bufferEvent: bufferEvent,
                                    select: day_select,
                                    SelectDay: SelectDay,
                                  )
                                : Container()
                          ],
                        ),
                      ),
                    ],
                  ),
                  ///////////////////////////////////////////////////////////////////////
                  Calendar_ListEventComponent(
                      bufferPostEventSelectDay: bufferPostEventSelectDay),
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

  Future<void> SelectDay(int index) {
    setState(() {
      day_select = index;
    });
    SetPostEvent();
  }

  Future<void> GetPost() async {
    String shop_id = ShopInfoMamagement().GetShop_id();
    GetPostCalendarRequest bufferGetPostCalendarRequest =
        GetPostCalendarRequest(shop_id: shop_id);
    GetPostCalendarResponse bufferGetPostCalendarResponse =
        await HttpGetPostCalendar(
            bufferGetPostCalendarRequest: bufferGetPostCalendarRequest);
    bufferPost = bufferGetPostCalendarResponse.bufferPost;
    SetEvent();
  }

  Future<void> InitCalendar() async {
    List<int> _bufferNumberInCalendar = [];
    for (int i = 0; i < 42; i++) {
      _bufferNumberInCalendar.add(0);
    }
    bufferNumberInCalendar = _bufferNumberInCalendar;
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
    SetEvent();

    setState(() {});
  }

  Future<void> SetEvent() {
    print("object");
    bufferEvent = [];
    bufferPost.forEach((key, value) {
      print(value);
      DateBox date_send = value.send;
      int _year = date_send.year;
      int _month = date_send.month;
      print("${year} ${_year} = ${year == _year}");
      print("${month} ${_month} ${month == _month}");
      if (_year == year && _month == month) {
        setState(() {
          bufferEvent.add(date_send.day);
        });
      }
    });
    print(bufferEvent);
  }

  Future<void> SetPostEvent() {
    bufferPostEventSelectDay = {};
    bufferPost.forEach((key, value) {
      DateBox date_send = value.send;
      if (year == date_send.year &&
          month == date_send.month &&
          day_select == date_send.day) {
        setState(() {
          bufferPostEventSelectDay[key] = value;
        });
      }
    });
    print("ddd${bufferPostEventSelectDay.length}");
  }
}
