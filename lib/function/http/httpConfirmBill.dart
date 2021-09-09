import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/dataManagement/dataOrderPost.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectConfirmBill.dart';

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<ConfirmBillResponse> HttpConfirmBill(
    {@required ConfirmBillRequest bufferConfirmBillRequest}) async {
  var body = bufferConfirmBillRequest.value();

  var url = Uri.parse("${HostName()}/billShopder/confirmBillShopder");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );

  var res = jsonDecode(uriResponse.body);

  String code = res['code'];

  return ConfirmBillResponse(code: code);
}
