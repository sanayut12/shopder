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
  Widget build(BuildContext context) {
    GetPostUsersDataResponse data = this.widget.data;
    String image = data.users_info.image;
    String name = data.users_info.name;
    return Container(
      height: 65,
      child: Row(
        children: [ShowImageUsersProfile(image: image), Text("${name}")],
      ),
    );
  }

  // Future<void> CountDateStartPostInit(String language) async {
  //   CountDateStartPost(language);
  //   DateTime datetime_now = DateTime.now();
  //   int sec = datetime_now.second;
  //   // print(sec);
  //   await Future.delayed(Duration(seconds: 61 - sec));
  //   // print("object");
  //   Timer.periodic(Duration(minutes: 1), (e) {
  //     if (!check_dispost) {
  //       e.cancel();
  //     }
  //     CountDateStartPost(language);
  //   });
  // }

  // Future<void> CountDateStartPost(String language) {
  //   LanguageManagement lgm = LanguageManagement();
  //   DateTime datetime_now = DateTime.now();
  //   DateTime datetime_start = this.widget.data.date.datetime();
  //   Duration datetime_diff = datetime_now.difference(datetime_start);

  //   int day = datetime_diff.inDays;
  //   int hour = datetime_diff.inHours;
  //   int min = datetime_diff.inMinutes;
  //   // print("day === ${day}");
  //   // print("hour === ${hour}");
  //   // print("min === ${min}");

  //   if (day > 365) {
  //     //แยกปี
  //     double _year = day / 365;
  //     int year = _year.toInt();
  //     setState(() {
  //       date_status = "${year} ${lgm.value('064', language)}";
  //     });
  //   } else if (day > 30) {
  //     //แยกเดือน
  //     double _month = day / (365 / 12);
  //     int month = _month.toInt();
  //     setState(() {
  //       date_status = "${month} ${lgm.value('063', language)}";
  //     });
  //   } else {
  //     //แยกวัน

  //     if (hour >= 24) {
  //       setState(() {
  //         date_status = "${day} ${lgm.value('062', language)}";
  //       });
  //     } else {
  //       if (min >= 60) {
  //         setState(() {
  //           date_status = "${hour} ${lgm.value('061', language)}";
  //         });
  //       } else {
  //         if (min == 0) {
  //           setState(() {
  //             date_status = "${lgm.value('059', language)}";
  //           });
  //         } else {
  //           setState(() {
  //             date_status = "${min} ${lgm.value('060', language)}";
  //           });
  //         }
  //       }
  //     }
  //   }
  // }
}
