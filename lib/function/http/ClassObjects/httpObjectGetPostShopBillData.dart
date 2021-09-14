import 'package:flutter/material.dart';
import 'package:shopder/function/dataManagement/dateBox.dart';

class GetPostShopBillDataRequest {
  final String post_id;
  GetPostShopBillDataRequest({@required this.post_id});
  Map<String, dynamic> value() {
    return {"post_id": this.post_id};
  }
}

class GetPostShopBillDataResposne {
  final PostShopBill_PostShop post_info;
  final Map<String, PostShopBill_Inventory>
      bufferInventory; //<inventory_id , data
  final Map<String, PostShopBill_Menu> bufferMenu; // <menu_id , data
  final Map<String, PostShopBill_Bill> bufferBill; //<bill_id , data
  final Map<String, PostShopBill_Item> bufferItem; //<item_id , data
  final Map<String, PostShopBill_Payment> bufferPayment; //<payment_id , data
  final Map<String, PostShopBill_Users> bufferUsers; //<user_id ,data
  final Map<String, PostShopBill_Address_user>
      bufferAddressUser; //<address_user_id ,data

  GetPostShopBillDataResposne(
      {@required this.post_info,
      @required this.bufferInventory,
      @required this.bufferMenu,
      @required this.bufferBill,
      @required this.bufferItem,
      @required this.bufferPayment,
      @required this.bufferUsers,
      @required this.bufferAddressUser});
}

class PostShopBill_PostShop {
  final String post_id, detail;
  final String how_send, over_order, confirm_order;
  final DateBox start, stop, send;
  final int sendCost;
  PostShopBill_PostShop(
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

class PostShopBill_Inventory {
  final String menu_id;
  final int level, quantity, cost;
  PostShopBill_Inventory(
      {@required this.menu_id,
      @required this.level,
      @required this.quantity,
      @required this.cost});
}

class PostShopBill_Menu {
  final String name, path;
  PostShopBill_Menu({@required this.name, @required this.path});
}

class PostShopBill_Bill {
  String address_user_id, how_send, how_pay, pay_status, status;
  final DateBox date, date_confirm;
  PostShopBill_Bill(
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

class PostShopBill_Item {
  final String bill_id, inventory_id, user_id, comment;
  final int quantity;
  PostShopBill_Item(
      {@required this.bill_id,
      @required this.inventory_id,
      @required this.user_id,
      @required this.quantity,
      @required this.comment});
}

class PostShopBill_Payment {
  final String bill_id, ref, status;
  final int cost;
  final DateBox date;
  PostShopBill_Payment(
      {@required this.bill_id,
      @required this.ref,
      @required this.cost,
      @required this.date,
      @required this.status});
}

class PostShopBill_Users {
  final String name, path;
  PostShopBill_Users({@required this.name, @required this.path});
}

class PostShopBill_Address_user {
  final String user_id,
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
  final double latitude, longtitude;
  PostShopBill_Address_user(
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
