import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:shopder/function/dataManagement/dataChatBox.dart';
import 'package:shopder/function/dataManagement/randomInt.dart';
import 'package:shopder/function/dataManagement/storageFunction.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetUserProfileMini.dart';
import 'package:shopder/function/http/httpGetUserProfileMini.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> NotificationChat(String host, String data) async {
  ChatBox chatBox = await TranformChatBox(jsonString: data).chatbox();
  String chatmessage_id = chatBox.chatmanager_id;
  int id = 0;
  int _id = await RandomInt(6);
  String _message_id = await ReadDataInStorage(key: chatmessage_id);
  if (_message_id == null) {
    InsertDataToStorage(key: chatmessage_id, buffer: _id.toString());
    id = _id;
  } else {
    id = int.parse(_message_id);
  }

  String user_id = chatBox.sender_id;
  GetUserProfileMiniRequest bufferGetUserProfileMiniRequest =
      GetUserProfileMiniRequest(user_id: user_id);
  GetUserProfileMiniResponse bufferGetUserProfileMiniResponse =
      await HttpGetUserProfileMini(
          bufferGetUserProfileMiniRequest: bufferGetUserProfileMiniRequest,
          host: host);
  String name = bufferGetUserProfileMiniResponse.user_info.name;
  if (chatBox.type_chat == "1") {
    String message = chatBox.message;
    ShowNotificationChat(id, name, message);
  }
}

Future<void> ShowNotificationChat(int _id, String name, String _message) async {
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
      _id, '${name} ได้ส่งข้อความ', '"${_message}"', platformChannelSpecifics,
      payload: '');
}
