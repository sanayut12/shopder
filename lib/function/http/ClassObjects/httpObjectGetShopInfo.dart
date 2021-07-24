import 'package:shopder/function/dataManagement/dataShopInfo.dart';

class GetShopInfoRequest {
  final String user_id;
  GetShopInfoRequest({this.user_id});
}

class GetShopInfoResponse {
  final ShopInfo shopInfo;
  final int code;
  GetShopInfoResponse({this.shopInfo, this.code});
}
