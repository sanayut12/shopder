import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shopder/function/httpbackground/httpGetNotificationPostShopBuy.dart';
import 'package:shopder/function/httpbackground/object/httpObjectNotificationPostShopBuy.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> NotificationBuy(
    String host, int _id, String notification_id) async {
  NotificationPostShopBuyRequest bufferNotificationPostShopBuyRequest =
      NotificationPostShopBuyRequest(notification_id: notification_id);
  NotificationPostShopBuyResponse bufferNotificationPostShopBuyResponse =
      await HttpGetNotificationPostShopBuy(
          bufferNotificationPostShopBuyRequest:
              bufferNotificationPostShopBuyRequest,
          host: host);
  String name = bufferNotificationPostShopBuyResponse.users.name;
  String _message = bufferNotificationPostShopBuyResponse.post_shop.detail;
  String message =
      _message.length > 20 ? _message.substring(0, 18) + "..." : _message;
  String status = "";
  String confirm_order =
      bufferNotificationPostShopBuyResponse.post_shop.confirm_order;
  if (confirm_order == "1") {
    status = "คำสั่งซื้อได้ยืนยันอัตโนมันติแล้ว";
  } else if (confirm_order == "2") {
    status = "กรุณายืนยันคำสั่งซื้อ";
  } else if (confirm_order == "3") {
    String check = bufferNotificationPostShopBuyResponse.bill.status;
    if (check == "0") {
      status = "กรุณายืนยันคำสั่งซื้อ เนื่องจากสินค้าเกินที่ระบุ";
    } else if (check == "1") {
      status = "คำสั่งซื้อได้ยืนยันอัตโนมันติแล้ว";
    }
  }

  String post_id = bufferNotificationPostShopBuyResponse.post_shop.post_id;
  String dataToFront = json.encode({"page": "1", "post_id": "${post_id}"});
  NotificationPostShopBuy(_id, name, message, status, dataToFront);

  // flutterLocalNotificationsPlugin.cancelAll();
}

Future<void> NotificationPostShopBuy(int _id, String name, String _message,
    String _status, String dataToFront) async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'your channel id',
    'your channel name',
    'your channel description',
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
  ); // styleInformation: bigPicture
  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.show(_id, '${name}',
      'ได้ซื้อสินค้าในโพสต์ "${_message}" ${_status}', platformChannelSpecifics,
      payload: '${dataToFront}');
}
