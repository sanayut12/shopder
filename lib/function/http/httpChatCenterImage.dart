import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectChatCenterImage.dart';

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<ChatCenterImageResponse> HttpChatCenterImage(
    {@required ChatCenterImageRequest bufferChatCenterImageRequest}) async {
  var body = bufferChatCenterImageRequest.value();

  var url = Uri.parse("${HostName()}/chat/chatCenterImage");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );

  var res = jsonDecode(uriResponse.body);
  print(res);

  // String code = res['code'];

  // return ChatCenterImageResponse(code: code);
}
