import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/subNotification/NotificationBill_BoxCompment.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetNotificationBill.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetNotificationInit.dart';
import 'package:shopder/function/http/httpGetNotificationBill.dart';
import 'package:shopder/function/http/httpGetNotificationShopInit.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  Map<String, GetNotificationBillResponse> data = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end:
              Alignment(0.8, 1.0), // 10% of the width, so there are ten blinds.
          colors: <Color>[Color(0xffFA897B), Color(0xfffffff)],
        ),
      ),
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            String notification_id = data.keys.toList()[index];
            return NotificationBill_BoxCompment(data: data[notification_id]);
          }),
    );
  }

  void init() async {
    String shop_id = ShopInfoMamagement().GetShop_id();
    GetNotificationShopInitRequest bufferGetNotificationShopInitRequest =
        GetNotificationShopInitRequest(shop_id: shop_id);
    GetNotificationShopInitResponse bufferGetNotificationShopInitResponse =
        await HttpGetNotificationInit(
            bufferGetNotificationShopInitRequest:
                bufferGetNotificationShopInitRequest);

    for (int i = 0;
        i < bufferGetNotificationShopInitResponse.list_notification.length;
        i++) {
      String type =
          bufferGetNotificationShopInitResponse.list_notification[i].type;
      String notification_id = bufferGetNotificationShopInitResponse
          .list_notification[i].notification_id;
      if (type == "1") {
        GetNotificationBillRequest bufferGetNotificationBillRequest =
            GetNotificationBillRequest(notification_id: notification_id);
        GetNotificationBillResponse bufferGetNotificationBillResponse =
            await httpGetNotificationBill(
                bufferGetNotificationBillRequest:
                    bufferGetNotificationBillRequest);
        setState(() {
          data[notification_id] = bufferGetNotificationBillResponse;
        });
      }
    }
  }
}
