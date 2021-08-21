import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectCancelItem.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectConfirmItem.dart';

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<CancelItemResponse> HttpCancelItem(
    {@required CancelItemRequest bufferCancelItemRequest}) async {
  var body = bufferCancelItemRequest.value();

  var url = Uri.parse("${HostName()}/post_shop/Itemmanagement/cancelItem");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );
  var res = jsonDecode(uriResponse.body);
  print("cancel item ${res}");
  String code = res['code'];
  CancelItemResponse bufferCancelItemResponse = CancelItemResponse(code: code);

  return bufferCancelItemResponse;
}
