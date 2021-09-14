import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectConfirmSended.dart';

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<ConfirmSendedResponse> HttpConfirmSended(
    {@required ConfirmSendedRequest bufferConfirmSendedRequest}) async {
  var body = bufferConfirmSendedRequest.value();

  var url = Uri.parse("${HostName()}/billShopder/ConfirmBillSended");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );
  var res = jsonDecode(uriResponse.body);
  String code = res['code'];
  return ConfirmSendedResponse(code: code);
}
