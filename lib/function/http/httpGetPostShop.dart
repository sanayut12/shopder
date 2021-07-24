import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/dataManagement/dataPostShop.dart';
import 'package:shopder/function/dataManagement/dateBox.dart';
import 'package:shopder/function/dataManagement/readjson.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShop.dart';

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<GetpostShopResponse> HttpGetPostShop(
    {@required GetPostShopRequest bufferGetPostShopRequest}) async {
  var body = bufferGetPostShopRequest.value();

  var url = Uri.parse("${HostName()}/shop/getPostShopProfile");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );
  var res = jsonDecode(uriResponse.body);
  Map res_data = res['data'];

  Map<int, PostList> bufferPostList = new Map();

  res_data.forEach((key, value) {
    int level = int.parse(key);
    // print(level);
    // print("=================================");

    Map menu_list = value['menu'];

    // print(menu_list);
    Map<int, MenuList> bufferMenuList = new Map();
    menu_list.forEach((key, value) {
      int no = int.parse(key);
      MenuList menuList = MenuList(
          menu_id: value["menu_id"],
          inventory_id: value["inventory_id"],
          name: value["name"],
          type: value["type"],
          quantity: value["quantity"],
          cost: value["cost"],
          path: value["path"],
          status: value["status"]);
      bufferMenuList[no] = menuList;
    });

    // menu_list
    // ส่วนของตัวแปรที่เก็บวันที่เวลา เริ่มโพสต์ ปิดการขาย ส่ง
    Map dateStart = value['start'];
    Map dateStop = value['stop'];
    Map dateSend = value['send'];

    PostList postList = PostList(
        post_id: value['post_id'],
        detail: value['detail'],
        sendCost: value['sendCost'],
        bufferMenuList: bufferMenuList,
        start: DateBox(
            year: dateStart["year"],
            month: dateStart["month"],
            day: dateStart['date'],
            hour: dateStart['hour'],
            min: dateStart['min']),
        stop: DateBox(
            year: dateStop['year'],
            month: dateStop['month'],
            day: dateStop['date'],
            hour: dateStop['hour'],
            min: dateStop['min']),
        send: DateBox(
            year: dateSend['year'],
            month: dateSend['month'],
            day: dateSend['date'],
            hour: dateSend['hour'],
            min: dateSend['min']));
    // print(postList);
    bufferPostList[level] = postList;
  });

  // print(bufferPostList);
  GetpostShopResponse bufferGetpostShopResponse =
      GetpostShopResponse(bufferPostList: bufferPostList, code: res['code']);

  return bufferGetpostShopResponse;
}
