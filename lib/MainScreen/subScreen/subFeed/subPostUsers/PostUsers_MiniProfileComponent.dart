import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostUsers_Data.dart';
import 'package:shopder/module/ShowImageUsersProfile.dart';

class PostUsers_MiniProfileComponent extends StatefulWidget {
  GetPostUsersDataResponse data;
  PostUsers_MiniProfileComponent({@required this.data});
  @override
  _PostUsers_MiniProfileComponentState createState() =>
      _PostUsers_MiniProfileComponentState();
}

class _PostUsers_MiniProfileComponentState
    extends State<PostUsers_MiniProfileComponent> {
  bool check_dispost = true;
  String date_status = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CountDateStartPostInit("language");
  }

  @override
  Widget build(BuildContext context) {
    GetPostUsersDataResponse data = this.widget.data;
    String image = data.users_info.image;
    String name = data.users_info.name;
    return Container(
      height: 65,
      child: Row(
        children: [
          ShowImageUsersProfile(image: image),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text("${name}"), Text("${date_status}")],
          )
        ],
      ),
    );
  }

  Future<void> CountDateStartPostInit(String language) async {
    CountDateStartPost(language);
    DateTime datetime_now = DateTime.now();
    int sec = datetime_now.second;
    // print(sec);
    await Future.delayed(Duration(seconds: 61 - sec));
    // print("object");
    Timer.periodic(Duration(minutes: 1), (e) {
      if (!check_dispost) {
        e.cancel();
      }
      CountDateStartPost(language);
    });
  }

  Future<void> CountDateStartPost(String language) {
    DateTime datetime_now = DateTime.now();
    DateTime datetime_start = this.widget.data.post_info.date.datetime();
    Duration datetime_diff = datetime_now.difference(datetime_start);

    int day = datetime_diff.inDays;
    int hour = datetime_diff.inHours;
    int min = datetime_diff.inMinutes;
    // print("day === ${day}");
    // print("hour === ${hour}");
    // print("min === ${min}");

    if (day > 365) {
      //แยกปี
      double _year = day / 365;
      int year = _year.toInt();
      setState(() {
        date_status = "${year} ปี";
      });
    } else if (day > 30) {
      //แยกเดือน
      double _month = day / (365 / 12);
      int month = _month.toInt();
      setState(() {
        date_status = "${month} เดือน";
      });
    } else {
      //แยกวัน

      if (hour >= 24) {
        setState(() {
          date_status = "${day} วัน";
        });
      } else {
        if (min >= 60) {
          setState(() {
            date_status = "${hour} ชั่วโมงที่แล้ว";
          });
        } else {
          if (min == 0) {
            setState(() {
              date_status = "เมื่อซักครู่";
            });
          } else {
            setState(() {
              date_status = "${min} นาที";
            });
          }
        }
      }
    }
  }
}
