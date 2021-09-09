import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/dataManagement/dataOrderPost.dart';
import 'package:shopder/function/dataManagement/dateBox.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostBill.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShopItemInit.dart';

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<GetPostShopItemInitResponse> HttpGetPostShopItemInit(
    {@required
        GetPostShopItemInitRequest bufferGetPostShopItemInitRequest}) async {
  var body = bufferGetPostShopItemInitRequest.value();

  var url = Uri.parse("${HostName()}/billShopder/getPostShopItemsInit");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );

  List<Post> bufferPostOrder = [];

  var res = jsonDecode(uriResponse.body);

  String code = res['code'];
  List list_post_id = res['data']['list_post_id'];

  List<String> bufferPost_id = [];
  list_post_id.forEach((element) {
    bufferPost_id.add(element);
  });

  return GetPostShopItemInitResponse(bufferPost_id: bufferPost_id, code: code);
}
