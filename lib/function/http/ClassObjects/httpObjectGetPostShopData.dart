import 'package:flutter/cupertino.dart';
import 'package:shopder/function/dataManagement/dateBox.dart';

class GetPostShopDataRequest {
  String post_id;
  GetPostShopDataRequest({@required this.post_id});

  Map<String, dynamic> value() {
    return {"post_id": this.post_id};
  }
}

class GetPostShopDataResponse {
  PostShopData_post postShopData_post;
  Map<String, PostShopData_inventory>
      bufferPostShopData_inventory; //<inventory_id , data
  Map<String, PostShopData_menu> bufferPostShopData_menu; //<menu_id , data
  String code;
  GetPostShopDataResponse(
      {@required this.postShopData_post,
      @required this.bufferPostShopData_inventory,
      @required this.bufferPostShopData_menu,
      @required this.code});
}

class PostShopData_post {
  String post_id, shop_id, detail, how_send, over_order, confirm_order;
  int sendCost;
  DateBox start, stop, send;
  PostShopData_post(
      {@required this.post_id,
      @required this.shop_id,
      @required this.detail,
      @required this.sendCost,
      @required this.start,
      @required this.stop,
      @required this.send,
      @required this.how_send,
      @required this.over_order,
      @required this.confirm_order});
}

class PostShopData_inventory {
  String menu_id;
  int quantity, cost;
  PostShopData_inventory(
      {@required this.menu_id, @required this.quantity, @required this.cost});
}

class PostShopData_menu {
  String name, detail, type, path;
  PostShopData_menu(
      {@required this.name,
      @required this.detail,
      @required this.type,
      @required this.path});
}
