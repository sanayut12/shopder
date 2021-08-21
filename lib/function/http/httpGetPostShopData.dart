import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/dataManagement/dateBox.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShopData.dart';

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<GetPostShopDataResponse> httpGetPostShopData(
    {@required GetPostShopDataRequest bufferGetPostShopDataRequest}) async {
  var body = bufferGetPostShopDataRequest.value();

  var url = Uri.parse("${HostName()}/shop/getPostShopProfileData");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );
  var res = jsonDecode(uriResponse.body);

  String code = res['code'];
  //ส่วนของข้อมูลที่ยังไม่ได้แปลง
  Map data_post = res['data']['data_post'];
  Map data_inventory = res['data']['data_inventory'];
  Map data_menu = res['data']['data_menu'];

  // print(res);
  // ส่วนของข้อมูลที่ทำการแปลงแล้ว
  PostShopData_post postShopData_post;
  List<PostShopData_inventory> bufferPostShopData_inventory = [];
  Map<String, PostShopData_menu> bufferPostShopData_menu = {};

  /// ทำการแปลงข้อมูลเข้า class คือข้อมูลของโพสต์

  DateBox start = DateBox(
      year: data_post['start']['year'],
      month: data_post['start']['month'],
      day: data_post['start']['day'],
      hour: data_post['start']['hour'],
      min: data_post['start']['min'],
      sec: data_post['start']['sec']);
  DateBox stop = DateBox(
      year: data_post['stop']['year'],
      month: data_post['stop']['month'],
      day: data_post['stop']['day'],
      hour: data_post['stop']['hour'],
      min: data_post['stop']['min']);
  DateBox send = DateBox(
      year: data_post['send']['year'],
      month: data_post['send']['month'],
      day: data_post['send']['day'],
      hour: data_post['send']['hour'],
      min: data_post['send']['min']);
  postShopData_post = PostShopData_post(
      post_id: data_post['post_id'],
      shop_id: data_post['shop_id'],
      detail: data_post['detail'],
      sendCost: data_post['sendCost'],
      start: start,
      stop: stop,
      send: send,
      how_send: data_post['how_send'],
      over_order: data_post['over_order'],
      confirm_order: data_post['confirm_order']);

  //////ส่วนของข้อมูลสตอกสินค้าที่จะจัดเข้า class //////
  data_inventory.forEach((key, value) {
    // print(value);

    PostShopData_inventory postShopData_inventory = PostShopData_inventory(
        inventory_id: value['inventory_id'],
        post_id: value['post_id'],
        menu_id: value['menu_id'],
        quantity: value['quantity'],
        cost: value['cost']);
    bufferPostShopData_inventory.add(postShopData_inventory);
  });

  //////  ส่วนของข้อมูลสินค้าที่จะจัดเข้า class /////////////
  data_menu.forEach((key, value) {
    PostShopData_menu postShopData_menu = PostShopData_menu(
        shop_id: value['shop_id'],
        name: value['name'],
        detail: value['detail'],
        type: value['type'],
        path: value['path']);
    bufferPostShopData_menu[key] = postShopData_menu;

    // print(value);
  });
  // print("object");
  // data_post
  GetPostShopDataResponse bufferGetPostShopDataResponse =
      GetPostShopDataResponse(
          postShopData_post: postShopData_post,
          bufferPostShopData_inventory: bufferPostShopData_inventory,
          bufferPostShopData_menu: bufferPostShopData_menu,
          code: code);

  return bufferGetPostShopDataResponse;
}
