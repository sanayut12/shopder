import 'package:shopder/CreateShopInfo/mainScreenRegisterShop.dart';
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectCreateShopInfo.dart';

import '../dataManagement/readjson.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

var client = http.Client();

Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<ShopInfoCreateResponse> HttpCreateShopInfo(
    ShopInfoCreateRequest bufferShopInfoCreateRequest) async {
  var body = bufferShopInfoCreateRequest.value();
  var url = Uri.parse("${HostName()}/shop/registerShop");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );
  // print(uriResponse.body);
  var res = jsonDecode(uriResponse.body);
  // ShopInfoCreateDataResponse shopInfoCreateDataResponse =
  //     ShopInfoCreateDataResponse(shop_id: res['shopInfo']['shop_id']);
  // ShopInfoCreateResponse data = ShopInfoCreateResponse(
  //     shopInfoCreateDataResponse: shopInfoCreateDataResponse,
  //     code: res['code']);
  // return data;
}
