import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/dataManagement/dateBox.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetOrderAndUser.dart';

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<GetOrderAndUserResponse> HttpGetOrderAndUser(
    {@required GetOrderAndUserRequest bufferGetOrderAndUserRequest}) async {
  var body = bufferGetOrderAndUserRequest.value();
  var url = Uri.parse("${HostName()}/post_shop/bill/getOrderAndUsers");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );

  var res = jsonDecode(uriResponse.body);
  //ข้อมูลดิบ
  Map order = res['data']['order'];
  String code = res['code'];

  // ข้อมูลที่แปลง
  Map<String, InventoryBill> bufferInventoryBill = {};

  order.forEach((key, element) {
    Map date_start = element['date_time'];
    Map date_shop = element['date_shop'];

    InventoryBill inventoryBill = InventoryBill(
        item_id: element['item_id'],
        bill_id: element['bill_id'],
        inventory_id: element['inventory_id'],
        user_id: element['user_id'],
        comment: element['comment'],
        quantity: element['quantity'],
        date_shop: DateBox(
            year: date_start['year'],
            month: date_start['month'],
            day: date_start['date'],
            hour: date_start['hour'],
            min: date_start['min']),
        date_time: DateBox(
            year: date_shop['year'],
            month: date_shop['month'],
            day: date_shop['date'],
            hour: date_shop['hour'],
            min: date_shop['min']));

    bufferInventoryBill[key] = inventoryBill;
  });

  GetOrderAndUserResponse bufferGetOrderAndUserResponse =
      GetOrderAndUserResponse(
          bufferInventoryBill: bufferInventoryBill, code: code);

  return bufferGetOrderAndUserResponse;
}
