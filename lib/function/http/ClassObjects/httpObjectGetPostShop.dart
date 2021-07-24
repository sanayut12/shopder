import 'package:flutter/cupertino.dart';
import 'package:shopder/function/dataManagement/dataPostShop.dart';

class GetPostShopRequest {
  final String user_id;
  final int level;
  GetPostShopRequest({@required this.user_id, this.level});

  Map<String, dynamic> value() {
    var data;
    if (this.level != null) {
      data = {"shop_id": this.user_id, "level": this.level};
    } else {
      data = {"shop_id": this.user_id};
    }
    return data;
  }
}

class GetpostShopResponse {
  final Map<int, PostList> bufferPostList;
  final String code;

  GetpostShopResponse({@required this.bufferPostList, @required this.code});
}
