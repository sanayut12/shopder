import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/dataManagement/dataOrderPost.dart';
import 'package:shopder/function/dataManagement/dateBox.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostBill.dart';

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<GetPostBillResponse> HttpGetPostBill(
    {@required GetPostBillRequest bufferGetPostBillRequest}) async {
  var body = bufferGetPostBillRequest.value();

  var url = Uri.parse("${HostName()}/post_shop/bill/getPostbill");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );

  List<Post> bufferPostOrder = [];

  var res = jsonDecode(uriResponse.body);
  // print(res);
  Map post = res['data']['post'];
  Map menu = res['data']['menu'];
  String code = res['code'];
  // print("${post.keys}");
  //วนลูปเพื่อเอาค่าใส่ class
  post.forEach((key, value) {
    Map start = value['start'];
    Map stop = value['stop'];
    Map send = value['send'];

    DateBox _start = DateBox(
        year: start['year'],
        month: start['month'],
        day: start['day'],
        hour: start['hour'],
        min: start['min']);
    DateBox _stop = DateBox(
        year: stop['year'],
        month: stop['month'],
        day: stop['day'],
        hour: stop['hour'],
        min: stop['min']);
    DateBox _send = DateBox(
        year: send['year'],
        month: send['month'],
        day: send['day'],
        hour: send['hour'],
        min: send['min']);

    Post _post = Post(
        post_id: value['post_id'],
        detail: value['detail'],
        how_send: value['how_send'],
        sendCost: value['sendCost'],
        start: _start,
        stop: _stop,
        send: _send);
    bufferPostOrder.add(_post);
  });
//ส่วนของเมนู
  // print(bufferPostOrder);
  Map<String, MenuOrder> menuList = {};
  menu.forEach((key, value) {
    // print("${key}");
    Map<int, Menu> bufferMenu = {};
    value.forEach((key2, value2) {
      // print("${value2}");
      Menu menu = Menu(
          inventory_id: value2['inventory_id'],
          menu_id: value2['menu_id'],
          name: value2['name'],
          quantity: value2['quantity'],
          cost: value2['cost'],
          type: value2['type'],
          path: value2['path'],
          status: value2['status']);
      bufferMenu[int.parse(key2)] = menu;
    });
    MenuOrder menuOrder = MenuOrder(bufferMenu: bufferMenu);
    menuList[key] = menuOrder;
  });

  GetPostBillResponse bufferGetPostBillResponse = GetPostBillResponse(
      bufferPostOrder: bufferPostOrder, menuList: menuList, code: code);

  return bufferGetPostBillResponse;
}
