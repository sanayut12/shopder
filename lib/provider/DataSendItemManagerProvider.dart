import 'package:flutter/cupertino.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShopBillData.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShopBillInit.dart';
import 'package:shopder/function/http/httpGetPostShopBillData.dart';
import 'package:shopder/function/http/httpGetPostShopBillInit.dart';

class DataSendItemManagerProvider with ChangeNotifier {
  Map<String, GetPostShopBillDataResposne> data = {};
  Future<void> init() async {
    String shop_id = ShopInfoMamagement().GetShop_id();
    GetPostShopBillInitRequest bufferGetPostShopBillInitRequest =
        GetPostShopBillInitRequest(shop_id: shop_id);
    GetPostShopBillInitResponse bufferGetPostShopBillInitResponse =
        await HttpGetPostShopBillInit(
            bufferGetPostShopBillInitRequest: bufferGetPostShopBillInitRequest);

    for (String post_id in bufferGetPostShopBillInitResponse.bufferPost_id) {
      GetPostShopBillDataRequest bufferGetPostShopBillDataRequest =
          GetPostShopBillDataRequest(post_id: post_id);
      GetPostShopBillDataResposne bufferGetPostShopBillDataResposne =
          await HttpGetPostShopBillData(
              bufferGetPostShopBillDataRequest:
                  bufferGetPostShopBillDataRequest);
      data[post_id] = bufferGetPostShopBillDataResposne;
      notifyListeners();
    }
  }
}
