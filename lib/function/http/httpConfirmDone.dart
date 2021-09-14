import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectConfirmDone.dart';

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<ConfirmDoneResponse> HttpConfirmDone(
    {@required ConfirmDoneRequest bufferConfirmDoneRequest}) async {
  var body = bufferConfirmDoneRequest.value();

  var url = Uri.parse("${HostName()}/billShopder/ConfirmBillDone");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );
  var res = jsonDecode(uriResponse.body);
  String code = res['code'];
  return ConfirmDoneResponse(code: code);
}
