import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/dataManagement/dateBox.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostUsers_Data.dart';
import 'package:shopder/module/imageProcressing.dart';

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

//r
Future<GetPostUsersDataResponse> HttpGetPostUsersData(
    {@required GetPostUsersDataRequest bufferGetPostUsersDataRequest}) async {
  var body = bufferGetPostUsersDataRequest.value();
  var url = Uri.parse("${HostName()}/shop/getPostUsersForShop_Data");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );
  // print("${uriResponse.bodyBytes.lengthInBytes * 0.001} kilo byte");
  Map res = jsonDecode(uriResponse.body);
  print(res);
  String code = res['code'];
  Map _post_info = res['data']['post_info'];
  Map _users_info = res['data']['user_info'];
  GetPostUsers_PostInfo post_info = GetPostUsers_PostInfo(
      post_users_id: _post_info['post_users_id'],
      user_id: _post_info['user_id'],
      message: _post_info['message'],
      bufferImage: TextImageToListImageString(textimage: _post_info['images']),
      date: MapDataToDateBox(data: _post_info['date']),
      latitude: _post_info['latitude'],
      longtitude: _post_info['longtitude'],
      status: _post_info['status']);
  GetPostUsers__UsersInfo users_info = GetPostUsers__UsersInfo(
      user_id: _users_info['user_id'],
      name: _users_info['name'],
      image: _users_info['image']);
  return GetPostUsersDataResponse(
      users_info: users_info, post_info: post_info, code: code);
}
