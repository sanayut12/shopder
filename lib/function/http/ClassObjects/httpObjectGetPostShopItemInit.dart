import 'package:flutter/material.dart';

class GetPostShopItemInitRequest {
  final String shop_id;
  GetPostShopItemInitRequest({@required this.shop_id});
  Map<String, dynamic> value() {
    return {"shop_id": this.shop_id};
  }
}

class GetPostShopItemInitResponse {
  final List<String> bufferPost_id;
  final String code;
  GetPostShopItemInitResponse(
      {@required this.bufferPost_id, @required this.code});
}
