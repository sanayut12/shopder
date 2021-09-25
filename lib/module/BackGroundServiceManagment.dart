import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shopder/function/httpbackground/httpGetNotificationPostShopBuy.dart';
import 'package:shopder/function/httpbackground/object/httpObjectNotificationPostShopBuy.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
int index_notification_buy = 0;
void BackGroundServiceManager(dynamic _data, String host) async {
  String data = _data;
  Map jsonData = jsonDecode(data);
  print("hhhhhhhhhh ${jsonData}");
  //test//////////////
  // int id = jsonData['id'];
  // String message = jsonData['data'];
  // notificationTest(index_notification_buy, message);
  // index_notification_buy += 1;

  //////////////real////////////
  String type = jsonData['type'];
  String notification_id = jsonData['notification_id'];

  if (type == '1') {
    ThreadNotificationBuy(host, index_notification_buy, notification_id);
    index_notification_buy += 1;
  }
  // print(data);
  // print(data.runtimeType);
  // _showNotification();
}

Future<void> ThreadNotificationBuy(
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
  NotificationPostShopBuy(_id, name, message, status);
}

Future<void> _showNotification() async {
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
  await flutterLocalNotificationsPlugin.show(
      0, 'plain title', 'plain body', platformChannelSpecifics,
      payload: 'item x');
}

Future<void> notificationTest(int _id, String _message) async {
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
  await flutterLocalNotificationsPlugin.show(
      _id, 'hello ${_id}', 'message : ${_message}', platformChannelSpecifics,
      payload: 'item x');
}

Future<void> Notification(int _id, String _message) async {
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
  await flutterLocalNotificationsPlugin.show(
      _id, 'hello ${_id}', 'message : ${_message}', platformChannelSpecifics,
      payload: 'item x');
}

Future<void> NotificationPostShopBuy(
    int _id, String name, String _message, String _status) async {
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
      payload: 'item x');
}

Future<void> NotificationCheckOpenApp(String message) async {
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
  await flutterLocalNotificationsPlugin.show(
      9999, 'plain title', '${message}', platformChannelSpecifics,
      payload: 'item x');
}

Future<void> NotificationStart() async {
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
  await flutterLocalNotificationsPlugin.show(
      10000,
      'plain title',
      'กำลังเริ่มการทำงาน ของแบลกราวหลังจากเปิดเครื่อง',
      platformChannelSpecifics,
      payload: 'item x');
}
