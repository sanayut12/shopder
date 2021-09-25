import 'package:flutter/cupertino.dart';

class NotificationPostShopBuyRequest {
  String notification_id;
  NotificationPostShopBuyRequest({@required this.notification_id});
  Map<String, dynamic> value() {
    return {"notification_id": this.notification_id};
  }
}

class NotificationPostShopBuyResponse {
  NotificationPostShopBuyBill bill;
  NotificationPostShopBuyPost post_shop;
  NotificationPostShopBuyUsers users;
  String code;
  NotificationPostShopBuyResponse(
      {@required this.bill,
      @required this.post_shop,
      @required this.users,
      @required this.code});
}

class NotificationPostShopBuyBill {
  String bill_id, status;
  NotificationPostShopBuyBill({@required this.bill_id, @required this.status});
}

class NotificationPostShopBuyPost {
  String post_id, detail, confirm_order;
  NotificationPostShopBuyPost(
      {@required this.post_id,
      @required this.detail,
      @required this.confirm_order});
}

class NotificationPostShopBuyUsers {
  String user_id, name, image;
  NotificationPostShopBuyUsers(
      {@required this.user_id, @required this.name, @required this.image});
}
