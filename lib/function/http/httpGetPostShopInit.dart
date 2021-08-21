import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/dataManagement/dataPostShop.dart';
import 'package:shopder/function/dataManagement/dateBox.dart';
import 'package:shopder/function/dataManagement/readjson.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShop.dart';

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<GetpostShopInitResponse> httpGetPostShopInit(
    {@required GetPostShopInitRequest bufferGetPostShopInitRequest}) async {
  var body = bufferGetPostShopInitRequest.value();

  var url = Uri.parse("${HostName()}/shop/getPostShopProfileInit");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );
  var res = jsonDecode(uriResponse.body);
  // print(res);
  //ส่วนข้มูลที่ยังไม่แปลง
  String code = res['code'];
  Map list_post = res['data']['list_post'];

  /// ส่วนข้อมูลที่แปลงแล้ว
  List<String> bufferListPost = [];
  list_post.forEach((key, value) {
    bufferListPost.add(value);
  });
  // print(bufferListPost);
  GetpostShopInitResponse bufferGetpostShopInitResponse =
      GetpostShopInitResponse(bufferListPost: bufferListPost, code: code);
  return bufferGetpostShopInitResponse;
  // Map post_list = res['data'][];
}
