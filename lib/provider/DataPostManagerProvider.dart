import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostUsers_Data.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostUsers_Init.dart';
import 'package:shopder/function/http/httpGetPostUsers_Data.dart';
import 'package:shopder/function/http/httpGetPostUsers_Init.dart';

class DataPostManagementProvider with ChangeNotifier {
  Map<String, GetPostUsersDataResponse> data = {};
  Future<void> init() async {
    String shop_id = ShopInfoMamagement().GetShop_id();
    GetPostUsersInitRequest bufferGetPostUsersInitRequest =
        GetPostUsersInitRequest(shop_id: shop_id);
    GetPostUsersInitResponse bufferGetPostUsersInitResponse =
        await HttpGetPostUsersInit(
            bufferGetPostUsersInitRequest: bufferGetPostUsersInitRequest);
    print(bufferGetPostUsersInitResponse.bufferPostUser_id);
    for (int i = 0;
        i < bufferGetPostUsersInitResponse.bufferPostUser_id.length;
        i++) {
      String post_users_id =
          bufferGetPostUsersInitResponse.bufferPostUser_id[i];
      GetPostUsersDataRequest bufferGetPostUsersDataRequest =
          GetPostUsersDataRequest(post_users_id: post_users_id);
      GetPostUsersDataResponse _data = await HttpGetPostUsersData(
          bufferGetPostUsersDataRequest: bufferGetPostUsersDataRequest);

      data[post_users_id] = _data;
      notifyListeners();
    }
  }
}
