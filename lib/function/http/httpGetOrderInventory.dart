import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/dataManagement/dateBox.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetOrderInventory.dart';

import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShop.dart';

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<GetOrderInventoryResponse> HttpGetOrderInventory(
    {@required GetOrderInventoryRequest bufferGetOrderInventoryRequest}) async {
  var body = bufferGetOrderInventoryRequest.value();

  var url = Uri.parse("${HostName()}/post_shop/getOrderInventory");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );
  var res = jsonDecode(uriResponse.body);
  // print(res);
  //กระจายดาต้า
  Map inventory_wait = res['data']['inventory_wait'];
  Map inventory_confirm = res['data']['inventory_confirm'];
  Map user_inventory = res['data']['users_inventory'];
  String code = res['code'];
  //ส่วนในการเก็บข้อมูลที่แปลงเสร็จ
  Map<int, InventoryWait> bufferInventoryWait = {};
  Map<int, InventoryConfirm> bufferInventoryConfirm = {};
  Map<String, UserInventory> bufferUserInventory = {};

  inventory_wait.forEach((key, value) {
    // print("${key}");
    Map date_time = value['date_time'];
    DateBox _date_time = DateBox(
        year: date_time['year'],
        month: date_time['month'],
        day: date_time['day'],
        hour: date_time['hour'],
        min: date_time['min'],
        sec: date_time['sec']);
    InventoryWait inventoryWait = InventoryWait(
        item_id: value['item_id'],
        bill_id: value['bill_id'],
        inventor_id: value['inventor_id'],
        user_id: value['user_id'],
        quantity: value['quantity'],
        comment: value['comment'],
        date_time: _date_time,
        status: value['status']);
    bufferInventoryWait[int.parse(key)] = inventoryWait;
  });
  inventory_confirm.forEach((key, value) {
    // print("${key}");
    Map date_time = value['date_time'];
    DateBox _date_time = DateBox(
        year: date_time['year'],
        month: date_time['month'],
        day: date_time['day'],
        hour: date_time['hour'],
        min: date_time['min'],
        sec: date_time['sec']);
    InventoryConfirm inventoryConfirm = InventoryConfirm(
        item_id: value['item_id'],
        bill_id: value['bill_id'],
        inventor_id: value['inventor_id'],
        user_id: value['user_id'],
        quantity: value['quantity'],
        comment: value['comment'],
        date_time: _date_time,
        status: value['status']);
    bufferInventoryConfirm[int.parse(key)] = inventoryConfirm;
  });
  user_inventory.forEach((key, value) {
    // print("${key}");
    UserInventory userInventory =
        UserInventory(name: value['name'], image: value['image']);
    bufferUserInventory[key] = userInventory;
  });

  GetOrderInventoryResponse bufferGetOrderInventoryResponse =
      GetOrderInventoryResponse(
          bufferInventoryWait: bufferInventoryWait,
          bufferInventoryConfirm: bufferInventoryConfirm,
          bufferUserInventory: bufferUserInventory,
          code: code);
  return bufferGetOrderInventoryResponse;
}
