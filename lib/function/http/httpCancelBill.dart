import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectCancelBill.dart';

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<CancelBillResponse> HttpCancelBill(
    {@required CancelBillRequest bufferCancelBillRequest}) async {
  var body = bufferCancelBillRequest.value();

  var url = Uri.parse("${HostName()}/billShopder/cancelBillShopder");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );

  var res = jsonDecode(uriResponse.body);

  String code = res['code'];

  return CancelBillResponse(code: code);
}
