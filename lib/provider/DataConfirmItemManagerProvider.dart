import 'package:flutter/foundation.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';
import 'package:shopder/function/http/ClassObjects/httpGetPostShopItemData.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShopItemInit.dart';
import 'package:shopder/function/http/httpGetPostShopItemData.dart';
import 'package:shopder/function/http/httpGetPostShopItemInit.dart';

class DataConfirmItemManagerProvider with ChangeNotifier {
  Map<String, GetPostShopItemDataResposne> data = {};
  Future<void> init() async {
    String shop_id = ShopInfoMamagement().GetShop_id();
    GetPostShopItemInitRequest bufferGetPostShopItemInitRequest =
        GetPostShopItemInitRequest(shop_id: shop_id);
    GetPostShopItemInitResponse bufferGetPostShopItemInitResponse =
        await HttpGetPostShopItemInit(
            bufferGetPostShopItemInitRequest: bufferGetPostShopItemInitRequest);

    for (String post_id in bufferGetPostShopItemInitResponse.bufferPost_id) {
      // print(post_id);
      GetPostShopItemDataRequest bufferGetPostShopItemDataRequest =
          GetPostShopItemDataRequest(post_id: post_id);
      GetPostShopItemDataResposne bufferGetPostShopItemDataResposne =
          await HttpGetPostShopItemData(
              bufferGetPostShopItemDataRequest:
                  bufferGetPostShopItemDataRequest);

      data[post_id] = bufferGetPostShopItemDataResposne;
      notifyListeners();
    }
  }
}
