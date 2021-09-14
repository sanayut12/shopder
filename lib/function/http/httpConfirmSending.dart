import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectConfirmSending.dart';

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<ConfirmSendingResponse> HttpConfirmSending(
    {@required ConfirmSendingRequest bufferConfirmSendingRequest}) async {
  var body = bufferConfirmSendingRequest.value();

  var url = Uri.parse("${HostName()}/billShopder/ConfirmBillSending");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );
  var res = jsonDecode(uriResponse.body);
  String code = res['code'];
  return ConfirmSendingResponse(code: code);
}
