import 'package:flutter/cupertino.dart';

class GetPostShopInitRequest {
  final String user_id;
  GetPostShopInitRequest({@required this.user_id});

  Map<String, dynamic> value() {
    return {"shop_id": this.user_id};
  }
}

class GetpostShopInitResponse {
  final List<String> bufferListPost;
  final String code;

  GetpostShopInitResponse({@required this.bufferListPost, @required this.code});
}
