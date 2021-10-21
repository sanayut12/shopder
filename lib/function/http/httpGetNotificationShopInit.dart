import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectConfirmBill.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetNotificationInit.dart';

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<GetNotificationShopInitResponse> HttpGetNotificationInit(
    {@required
        GetNotificationShopInitRequest
            bufferGetNotificationShopInitRequest}) async {
  var body = bufferGetNotificationShopInitRequest.value();

  var url = Uri.parse("${HostName()}/shop/getNotificationShopInit");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );

  var res = jsonDecode(uriResponse.body);
  print(res);
  String code = res['code'];
  List<GetNotificationShopInit_data> list_notification = [];
  List _list_notification = res["data"]["list_notification"];

  _list_notification.forEach((element) {
    list_notification.add(GetNotificationShopInit_data(
        notification_id: element['notification_id'], type: element['type']));
  });
  return GetNotificationShopInitResponse(
      list_notification: list_notification, code: code);
}
