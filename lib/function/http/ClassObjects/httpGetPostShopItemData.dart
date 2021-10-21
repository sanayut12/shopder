import 'package:flutter/material.dart';
import 'package:shopder/function/dataManagement/dateBox.dart';

class GetPostShopItemDataRequest {
  String post_id;
  GetPostShopItemDataRequest({@required this.post_id});
  Map<String, dynamic> value() {
    return {"post_id": this.post_id};
  }
}

class GetPostShopItemDataResposne {
  PostShopItem_PostShop post_info;
  Map<String, PostShopItem_Inventory> bufferInventory; //<inventory_id , data
  Map<String, PostShopItem_Menu> bufferMenu; // <menu_id , data
  Map<String, PostShopItem_Bill> bufferBill; //<bill_id , data
  Map<String, PostShopItem_Item> bufferItem; //<item_id , data
  Map<String, PostShopItem_Payment> bufferPayment; //<payment_id , data
  Map<String, PostShopItem_Users> bufferUsers; //<user_id ,data
  Map<String, PostShopItem_Address_user>
      bufferAddressUser; //<address_user_id ,data

  GetPostShopItemDataResposne(
      {@required this.post_info,
      @required this.bufferInventory,
      @required this.bufferMenu,
      @required this.bufferBill,
      @required this.bufferItem,
      @required this.bufferPayment,
      @required this.bufferUsers,
      @required this.bufferAddressUser});
}

class PostShopItem_PostShop {
  String post_id, detail;
  String how_send, over_order, confirm_order;
  DateBox start, stop, send;
  int sendCost;
  PostShopItem_PostShop(
      {@required this.post_id,
      @required this.detail,
      @required this.sendCost,
      @required this.start,
      @required this.stop,
      @required this.send,
      @required this.how_send,
      @required this.over_order,
      @required this.confirm_order});
}

class PostShopItem_Inventory {
  String menu_id;
  int level, quantity, cost;
  PostShopItem_Inventory(
      {@required this.menu_id,
      @required this.level,
      @required this.quantity,
      @required this.cost});
}

class PostShopItem_Menu {
  String name, path;
  PostShopItem_Menu({@required this.name, @required this.path});
}

class PostShopItem_Bill {
  String address_user_id, how_send, how_pay, pay_status, status;
  DateBox date, date_confirm;
  PostShopItem_Bill(
      {@required this.address_user_id,
      @required this.date,
      @required this.how_send,
      @required this.how_pay,
      @required this.pay_status,
      @required this.date_confirm,
      @required this.status});
  // Future<void> SetStatus(String _status) {
  //   this.status = _status;
  // }
}

class PostShopItem_Item {
  String bill_id, inventory_id, user_id, comment;
  int quantity;
  PostShopItem_Item(
      {@required this.bill_id,
      @required this.inventory_id,
      @required this.user_id,
      @required this.quantity,
      @required this.comment});
}

class PostShopItem_Payment {
  String bill_id, ref, status;
  int cost;
  DateBox date;
  PostShopItem_Payment(
      {@required this.bill_id,
      @required this.ref,
      @required this.cost,
      @required this.date,
      @required this.status});
}

class PostShopItem_Users {
  String name, path;
  PostShopItem_Users({@required this.name, @required this.path});
}

class PostShopItem_Address_user {
  String user_id,
      name,
      phone,
      address,
      no,
      moo,
      baan,
      road,
      soy,
      sub_district,
      district,
      province;
  double latitude, longtitude;
  PostShopItem_Address_user(
      {@required this.user_id,
      @required this.name,
      @required this.phone,
      @required this.address,
      @required this.no,
      @required this.moo,
      @required this.baan,
      @required this.road,
      @required this.soy,
      @required this.sub_district,
      @required this.district,
      @required this.province,
      @required this.latitude,
      @required this.longtitude});
}
