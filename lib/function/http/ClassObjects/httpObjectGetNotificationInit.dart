import 'package:flutter/cupertino.dart';

class GetNotificationShopInitRequest {
  String shop_id;
  GetNotificationShopInitRequest({@required this.shop_id});
  Map<String, String> value() {
    return {"shop_id": this.shop_id};
  }
}

class GetNotificationShopInitResponse {
  List<GetNotificationShopInit_data> list_notification;
  String code;
  GetNotificationShopInitResponse(
      {@required this.list_notification, @required this.code});
}

class GetNotificationShopInit_data {
  String notification_id, type;
  GetNotificationShopInit_data(
      {@required this.notification_id, @required this.type});
}
