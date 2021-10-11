import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shopder/function/httpbackground/httpGetNotificationPostShopBuy.dart';
import 'package:shopder/function/httpbackground/object/httpObjectNotificationPostShopBuy.dart';
import 'package:shopder/module/NotificationManagement/notificationChat.dart';
import 'package:shopder/module/NotificationManagement/notificationType1.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
int index_notification_buy = 0; //0 - 5000
void BackGroundServiceManager(dynamic _data, String host) async {
  String data = _data;
  Map jsonData = jsonDecode(data);
  print("shopder ${jsonData}");
  //test//////////////
  // int id = jsonData['id'];
  // String message = jsonData['data'];
  // notificationTest(index_notification_buy, message);
  // index_notification_buy += 1;

  //////////////real////////////
  String type = jsonData['type'];
  String notification_id = jsonData['notification_id'];

  if (type == '1') {
    NotificationBuy(host, index_notification_buy, notification_id);
    index_notification_buy += 1;
    if (index_notification_buy > 5000) {
      index_notification_buy = 0;
    }
  }

  if (type == "5") {
    NotificationChat(host, _data);
  }
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
