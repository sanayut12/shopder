import 'package:flutter/cupertino.dart';

class GetPostUsersInitRequest {
  String shop_id;
  GetPostUsersInitRequest({@required this.shop_id});
  Map<String, dynamic> value() {
    return {"shop_id": this.shop_id};
  }
}

class GetPostUsersInitResponse {
  List<String> bufferPostUser_id;
  String code;

  GetPostUsersInitResponse(
      {@required this.bufferPostUser_id, @required this.code});
}
