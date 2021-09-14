import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/dataManagement/dataOrderPost.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShopBillInit.dart';

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<GetPostShopBillInitResponse> HttpGetPostShopBillInit(
    {@required
        GetPostShopBillInitRequest bufferGetPostShopBillInitRequest}) async {
  var body = bufferGetPostShopBillInitRequest.value();

  var url = Uri.parse("${HostName()}/billShopder/getPostShopBillInit");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );

  List<Post> bufferPostOrder = [];

  var res = jsonDecode(uriResponse.body);
  print(res);
  String code = res['code'];
  List list_post_id = res['data']['list_post_id'];

  List<String> bufferPost_id = [];
  list_post_id.forEach((element) {
    bufferPost_id.add(element);
  });

  return GetPostShopBillInitResponse(bufferPost_id: bufferPost_id, code: code);
}
