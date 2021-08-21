import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectConfirmItem.dart';

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<ConfirmItemResponse> HttpConfirmItem(
    {@required ConfirmItemRequest bufferConfirmItemRequest}) async {
  var body = bufferConfirmItemRequest.value();

  var url = Uri.parse("${HostName()}/post_shop/Itemmanagement/confirmItem");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );
  var res = jsonDecode(uriResponse.body);
  print("confirm item ${res}");
  String code = res['code'];
  ConfirmItemResponse bufferConfirmItemResponse =
      ConfirmItemResponse(code: code);

  return bufferConfirmItemResponse;
}
