import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopder/function/httpbackground/object/httpObjectNotificationPostShopBuy.dart';

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<NotificationPostShopBuyResponse> HttpGetNotificationPostShopBuy(
    {@required
        NotificationPostShopBuyRequest bufferNotificationPostShopBuyRequest,
    @required
        String host}) async {
  var body = bufferNotificationPostShopBuyRequest.value();

  var url = Uri.parse("${host}/notification/notification_postshop");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );

  var res = jsonDecode(uriResponse.body);
  print(res);
  String code = res['code'];

  Map _bill = res['data']['bill'];

  Map _post_shop = res['data']['post_shop'];

  Map _users = res['data']['users'];

  NotificationPostShopBuyBill bill = NotificationPostShopBuyBill(
      bill_id: _bill['bill_id'], status: _bill['status']);
  NotificationPostShopBuyPost post_shop = NotificationPostShopBuyPost(
      post_id: _post_shop['post_id'],
      detail: _post_shop['detail'],
      confirm_order: _post_shop['confirm_order']);

  NotificationPostShopBuyUsers users = NotificationPostShopBuyUsers(
      user_id: _users['user_id'], name: _users['name'], image: _users['image']);

  return NotificationPostShopBuyResponse(
      bill: bill, post_shop: post_shop, users: users, code: code);
}
