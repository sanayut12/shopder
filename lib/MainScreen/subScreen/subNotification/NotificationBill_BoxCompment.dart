import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/subNotification/notification_showImage.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetNotificationBill.dart';

class NotificationBill_BoxCompment extends StatefulWidget {
  GetNotificationBillResponse data;
  NotificationBill_BoxCompment({@required this.data});
  @override
  _NotificationBill_BoxCompmentState createState() =>
      _NotificationBill_BoxCompmentState();
}

class _NotificationBill_BoxCompmentState
    extends State<NotificationBill_BoxCompment> {
  String date = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CountDateStartPost();
  }

  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    String name = this.widget.data.users.name;
    String detail = this.widget.data.post.detail;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(weight_screen * 0.025),
      margin: EdgeInsets.all(weight_screen * 0.025),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(weight_screen * 0.025),
          color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Notification_showImage(image: this.widget.data.users.image),
          Column(
            children: [
              Container(
                width: weight_screen * 0.8,
                child: Text("${name} ได้ซื้อสินค้าจากโพสต์ ${detail}"),
              ),
              Container(
                width: weight_screen * 0.8,
                alignment: Alignment.centerRight,
                child: Text("${date}"),
              )
            ],
          )
          // Text("${}")
        ],
      ),
    );
  }

  Future<void> CountDateStartPost() {
    DateTime datetime_now = DateTime.now();
    DateTime datetime_start =
        this.widget.data.notification.date_write.datetime();
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
        date = "${year} ปีที่แล้ว";
      });
    } else if (day > 30) {
      //แยกเดือน
      double _month = day / (365 / 12);
      int month = _month.toInt();
      setState(() {
        date = "${month} เดือน";
      });
    } else {
      //แยกวัน

      if (hour >= 24) {
        setState(() {
          date = "${day} วัน";
        });
      } else {
        if (min >= 60) {
          setState(() {
            date = "${hour} ชั่วโมง";
          });
        } else {
          if (min == 0) {
            setState(() {
              date = "เมื่อซักครู่";
            });
          } else {
            setState(() {
              date = "${min} นาทีที่ผ่านมา";
            });
          }
        }
      }
    }
  }
}
