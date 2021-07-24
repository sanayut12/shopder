import 'package:flutter/cupertino.dart';
import 'package:shopder/function/dataManagement/dataOrderPost.dart';

//block ข้อมูลก่อนที่จะส่งไปขอ post ที่ยังซื้อขายอยู่ปัจจุบัน
class GetOrderPostShopCurrentRequest {
  final String shop_id;
  GetOrderPostShopCurrentRequest({@required this.shop_id});

  Map<String, dynamic> value() {
    return {"shop_id": this.shop_id};
  }
}

class GetOrderPostShopCurrentResponse {
  final Map<int, Post> bufferPostOrder;
  final Map<String, MenuOrder> menuList;
  final String code;
  GetOrderPostShopCurrentResponse(
      {@required this.bufferPostOrder,
      @required this.menuList,
      @required this.code});
}
