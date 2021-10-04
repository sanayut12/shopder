import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShopData.dart';

class MiniProfileShop extends StatefulWidget {
  GetPostShopDataResponse data;
  MiniProfileShop({@required this.data});
  @override
  _MiniProfileShopState createState() => _MiniProfileShopState();
}

class _MiniProfileShopState extends State<MiniProfileShop> {
  ShopInfo shopInfo = ShopInfoMamagement().value();
  bool check_dispost = true;
  String date_status = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CountDateStartPostInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    check_dispost = false;
  }

  @override
  Widget build(BuildContext context) {
    int sendCost = this.widget.data.postShopData_post.sendCost;
    Widget ImageShop = Container(
      height: 50,
      width: 50,
      margin: EdgeInsets.only(left: 5, top: 5),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover, image: MemoryImage(shopInfo.image))),
    );
    Widget NameShop = Container(
      margin: EdgeInsets.only(left: 5),
      child: Text("${shopInfo.name}",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
    );
    return Container(
      height: 50,
      width: double.infinity,
      child: Row(
        children: [
          ImageShop,
          Expanded(
              child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NameShop,
                Text("${date_status} . ${sendCost} บาท"),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Future<void> CountDateStartPostInit() async {
    CountDateStartPost();
    DateTime datetime_now = DateTime.now();
    int sec = datetime_now.second;
    // print(sec);
    await Future.delayed(Duration(seconds: 61 - sec));
    // print("object");
    Timer.periodic(Duration(minutes: 1), (e) {
      if (!check_dispost) {
        e.cancel();
      }
      CountDateStartPost();
    });
  }

  Future<void> CountDateStartPost() {
    DateTime datetime_now = DateTime.now();
    DateTime datetime_start =
        this.widget.data.postShopData_post.start.datetime();
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
            date_status = "${hour} ชั่วโมง";
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
