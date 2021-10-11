import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectChatCenter.dart';

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

//r
Future<ChatCenterResponse> HttpChatCenter(
    {@required ChatCenterRequest bufferChatCenterRequest}) async {
  var body = bufferChatCenterRequest.value();
  // print("$body");
  var url = Uri.parse("${HostName()}/chat/chatCenter");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );

  // print("${uriResponse.bodyBytes.lengthInBytes * 0.001} kilo byte");
  Map res = jsonDecode(uriResponse.body);
  String code = res['code'];

  return ChatCenterResponse(code: code);
}
