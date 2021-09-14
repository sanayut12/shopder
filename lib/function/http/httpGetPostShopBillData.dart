import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/dataManagement/dateBox.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShopBillData.dart';

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<GetPostShopBillDataResposne> HttpGetPostShopBillData(
    {@required
        GetPostShopBillDataRequest bufferGetPostShopBillDataRequest}) async {
  var body = bufferGetPostShopBillDataRequest.value();

  var url = Uri.parse("${HostName()}/billShopder/getPostShopBillData");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );

  var res = jsonDecode(uriResponse.body);
  // print(res);

  PostShopBill_PostShop post_info;
  Map<String, PostShopBill_Inventory> bufferInventory =
      {}; //<inventory_id , data
  Map<String, PostShopBill_Menu> bufferMenu = {}; // <menu_id , data
  Map<String, PostShopBill_Bill> bufferBill = {}; //<bill_id , data
  Map<String, PostShopBill_Item> bufferItem = {}; //<item_id , data
  Map<String, PostShopBill_Payment> bufferPayment = {}; //<payment_id , data
  Map<String, PostShopBill_Users> bufferUsers = {}; //<user_id ,data
  Map<String, PostShopBill_Address_user> bufferAddressUser = {}; //<address_us

  String code = res['code'];

  Map _post_shop = res['data']['post_shop'];
  Map _inventory = res['data']['inventory'];
  Map _menu = res['data']['menu'];
  Map _bill = res['data']['bill'];
  Map _item = res['data']['item'];
  Map _payment = res['data']['payment'];
  Map _users = res['data']['users'];
  Map _address_user = res['data']['address_user'];

  //ส่วนของการจัดรข้อมูลเข้าไปในตัวแปร
  DateBox date_start = DateBox(
      year: _post_shop['start']['year'],
      month: _post_shop['start']['month'],
      day: _post_shop['start']['day'],
      hour: _post_shop['start']['hour'],
      min: _post_shop['start']['min'],
      sec: _post_shop['start']['sec']);
  DateBox date_stop = DateBox(
      year: _post_shop['stop']['year'],
      month: _post_shop['stop']['month'],
      day: _post_shop['stop']['day'],
      hour: _post_shop['stop']['hour'],
      min: _post_shop['stop']['min']);
  DateBox date_send = DateBox(
      year: _post_shop['send']['year'],
      month: _post_shop['send']['month'],
      day: _post_shop['send']['day'],
      hour: _post_shop['send']['hour'],
      min: _post_shop['send']['min']);
  post_info = PostShopBill_PostShop(
      post_id: _post_shop['post_id'],
      detail: _post_shop['detail'],
      sendCost: _post_shop['sendCost'],
      start: date_start,
      stop: date_stop,
      send: date_send,
      how_send: _post_shop['how_send'],
      over_order: _post_shop['over_order'],
      confirm_order: _post_shop['confirm_order']);

  _inventory.forEach((key, value) {
    bufferInventory[key] = PostShopBill_Inventory(
        menu_id: value['menu_id'],
        level: value['level'],
        quantity: value['quantity'],
        cost: value['cost']);
  });
  _menu.forEach((key, value) {
    bufferMenu[key] =
        PostShopBill_Menu(name: value['name'], path: value['path']);
  });

  _bill.forEach((key, value) {
    DateBox date_bill = DateBox(
        year: value['date']['year'],
        month: value['date']['month'],
        day: value['date']['day'],
        hour: value['date']['hour'],
        min: value['date']['min'],
        sec: value['date']['sec']);
    if (value['date_confirm'] == null) {
      bufferBill[key] = PostShopBill_Bill(
          address_user_id: value['address_user_id'],
          date: date_bill,
          how_send: value['how_send'],
          how_pay: value['how_pay'],
          pay_status: value['pay_status'],
          date_confirm: null,
          status: value['status']);
    } else {
      DateBox date_confirm_bill = DateBox(
          year: value['date_confirm']['year'],
          month: value['date_confirm']['month'],
          day: value['date_confirm']['day'],
          hour: value['date_confirm']['hour'],
          min: value['date_confirm']['min'],
          sec: value['date_confirm']['sec']);
      bufferBill[key] = PostShopBill_Bill(
          address_user_id: value['address_user_id'],
          date: date_bill,
          how_send: value['how_send'],
          how_pay: value['how_pay'],
          pay_status: value['pay_status'],
          date_confirm: date_confirm_bill,
          status: value['status']);
    }
  });

  _item.forEach((key, value) {
    bufferItem[key] = PostShopBill_Item(
        bill_id: value['bill_id'],
        inventory_id: value['inventory_id'],
        user_id: value['user_id'],
        quantity: value['quantity'],
        comment: value['comment']);
  });
  _payment.forEach((key, value) {
    DateBox date_payment = DateBox(
        year: value['date']['year'],
        month: value['date']['month'],
        day: value['date']['day'],
        hour: value['date']['hour'],
        min: value['date']['min'],
        sec: value['date']['sec']);
    bufferPayment[key] = PostShopBill_Payment(
        bill_id: value['bill_id'],
        ref: value['ref'],
        cost: value['cost'],
        date: date_payment,
        status: value['status']);
  });

  _users.forEach((key, value) {
    bufferUsers[key] =
        PostShopBill_Users(name: value['name'], path: value['path']);
  });

  _address_user.forEach((key, value) {
    bufferAddressUser[key] = PostShopBill_Address_user(
        user_id: value['user_id'],
        name: value['name'],
        phone: value['phone'],
        address: value['address'],
        no: value['no'],
        moo: value['moo'],
        baan: value['baan'],
        road: value['road'],
        soy: value['soy'],
        sub_district: value['sub_district'],
        district: value['district'],
        province: value['province'],
        latitude: value['latitude'].toDouble(),
        longtitude: value['longtitude'].toDouble());
  });
  return GetPostShopBillDataResposne(
      post_info: post_info,
      bufferInventory: bufferInventory,
      bufferMenu: bufferMenu,
      bufferBill: bufferBill,
      bufferItem: bufferItem,
      bufferPayment: bufferPayment,
      bufferUsers: bufferUsers,
      bufferAddressUser: bufferAddressUser);
}
