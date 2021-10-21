import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/dataManagement/dateBox.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetNotificationBill.dart';

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<GetNotificationBillResponse> httpGetNotificationBill(
    {@required
        GetNotificationBillRequest bufferGetNotificationBillRequest}) async {
  var body = bufferGetNotificationBillRequest.value();

  var url = Uri.parse("${HostName()}/shop/notification/getNotificationBill");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );
  var res = jsonDecode(uriResponse.body);
  print(res);
  Map _notification = res['data']['notification_shop'];
  Map _post = res['data']['post_shop'];
  Map _users = res['data']['users'];

  Map date_write = _notification['date_write'];
  Map date = _notification['date'];
  NB_notification notification = NB_notification(
      notification_id: _notification['notification_id'],
      bill_id: _notification['bill_id'],
      status: _notification['status'],
      date_write: MapDataToDateBox(data: date_write),
      date: date == null ? null : MapDataToDateBox(data: date));
  NB_Post post = NB_Post(post_id: _post['post_id'], detail: _post['detail']);
  NB_Users users = NB_Users(
      user_id: _users['user_id'], name: _users['name'], image: _users['image']);
  return GetNotificationBillResponse(
      notification: notification, post: post, users: users);
}
