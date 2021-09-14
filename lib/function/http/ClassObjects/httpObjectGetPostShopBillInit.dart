import 'package:flutter/material.dart';

class GetPostShopBillInitRequest {
  final String shop_id;
  GetPostShopBillInitRequest({@required this.shop_id});

  Map<String, dynamic> value() {
    return {"shop_id": this.shop_id};
  }
}

class GetPostShopBillInitResponse {
  List<String> bufferPost_id;
  String code;
  GetPostShopBillInitResponse(
      {@required this.bufferPost_id, @required this.code});
}
