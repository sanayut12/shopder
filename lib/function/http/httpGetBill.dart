import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/dataManagement/dataOrderPost.dart';
import 'package:shopder/function/dataManagement/dateBox.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetBill.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostBill.dart';

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<GetBillResponse> HttpGetBill(
    {@required GetBillRequest bufferGetBillRequest}) async {
  var body = bufferGetBillRequest.value();

  var url = Uri.parse("${HostName()}/post_shop/bill/getBill");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );

  var res = jsonDecode(uriResponse.body);

  //ส่วนของข้อมูลังไม่ได้แปลง
  Map billList = res['data']['bill'];
  Map userList = res['data']['user'];
  String code = res['code'];

  //ส่วนของข้อมูลที่แปลงแล้ว
  List<Bill> bufferBill = [];
  Map<String, UserBill> bufferUserBill = {};
  billList.forEach((key, value) {
    Map datetime = value['date'];
    Bill bill = Bill(
        bill_id: key,
        address_user_id: value['address_user_id'],
        user_id: value['user_id'],
        date: DateBox(
            year: datetime['year'],
            month: datetime['month'],
            day: datetime['day'],
            hour: datetime['hour'],
            min: datetime['min']),
        send: value['send']);
    bufferBill.add(bill);
  });

  userList.forEach((key, value) {
    UserBill userbill = UserBill(name: value['name'], image: value['image']);
    bufferUserBill[key] = userbill;
  });

  GetBillResponse bufferGetBillResponse = GetBillResponse(
      bufferBill: bufferBill, bufferUserBill: bufferUserBill, code: code);
  return bufferGetBillResponse;
}
