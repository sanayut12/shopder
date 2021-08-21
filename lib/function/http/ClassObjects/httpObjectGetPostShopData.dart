import 'package:flutter/cupertino.dart';
import 'package:shopder/function/dataManagement/dateBox.dart';

class GetPostShopDataRequest {
  final String post_id;
  GetPostShopDataRequest({@required this.post_id});

  Map<String, dynamic> value() {
    return {"post_id": this.post_id};
  }
}

class GetPostShopDataResponse {
  final PostShopData_post postShopData_post;
  final List<PostShopData_inventory> bufferPostShopData_inventory;
  final Map<String, PostShopData_menu> bufferPostShopData_menu;
  final String code;
  GetPostShopDataResponse(
      {@required this.postShopData_post,
      @required this.bufferPostShopData_inventory,
      @required this.bufferPostShopData_menu,
      @required this.code});
}

class PostShopData_post {
  final String post_id, shop_id, detail, how_send, over_order, confirm_order;
  final int sendCost;
  final DateBox start, stop, send;
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
  final String inventory_id, post_id, menu_id;
  final int quantity, cost;
  PostShopData_inventory(
      {@required this.inventory_id,
      @required this.post_id,
      @required this.menu_id,
      @required this.quantity,
      @required this.cost});
}

class PostShopData_menu {
  final String shop_id, name, detail, type, path;
  PostShopData_menu(
      {@required this.shop_id,
      @required this.name,
      @required this.detail,
      @required this.type,
      @required this.path});
}
