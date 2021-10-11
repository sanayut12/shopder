import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopder/function/dataManagement/dataChatBox.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetUserProfileMini.dart';

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<GetUserProfileMiniResponse> HttpGetUserProfileMini(
    {@required GetUserProfileMiniRequest bufferGetUserProfileMiniRequest,
    @required String host}) async {
  var body = bufferGetUserProfileMiniRequest.value();

  var url = Uri.parse("${host}/users/getUsersProfileMini");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );

  var res = jsonDecode(uriResponse.body);
  print(res);
  String code = res['code'];
  String name = res['data']['user_info']['name'];
  String image = res['data']['user_info']['image'];
  UsersProfileMini user_info = UsersProfileMini(name: name, image: image);
  return GetUserProfileMiniResponse(user_info: user_info, code: code);
}
