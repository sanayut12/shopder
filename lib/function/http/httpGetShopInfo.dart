import 'package:flutter/cupertino.dart';
import 'package:shopder/ClassObjects/httpObjectGetShopInfo.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopder/function/dataManagement/dataShopInfo.dart';
import 'package:shopder/function/dataManagement/readjson.dart';

var client = http.Client();
String hostname;
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

void initHttpGetShopInfo() async {
  hostname = await json.decode(await readJson())['http'];
  // print(hostname);
}

Future<GetShopInfoResponse> HttpGetShopInfo(
    {@required GetShopInfoRequest bufferGetShopInfoRequest}) async {
  var body = {
    'user_id': bufferGetShopInfoRequest.user_id,
  };
  // print(" ===========$hostname ===============");
  var url = Uri.parse(hostname + "/shop/getShopInfo");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );
  var res = jsonDecode(uriResponse.body);
  // print(res);
  ShopInfo shopInfo = ShopInfo(
      shop_id: res['shopInfo']['shop_id'],
      name: res['shopInfo']['name'],
      type: res['shopInfo']['type'],
      image: res['shopInfo']['image'],
      address: res['shopInfo']['address'],
      sub_district: res['shopInfo']['sub_district'],
      district: res['shopInfo']['district'],
      province: res['shopInfo']['province'],
      latitude: res['shopInfo']['latitude'].toDouble(),
      longtitude: res['shopInfo']['longtitude'].toDouble());
  GetShopInfoResponse data =
      GetShopInfoResponse(shopInfo: shopInfo, code: res['code']);
  return data;
}
