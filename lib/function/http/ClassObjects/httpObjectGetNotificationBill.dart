import 'package:flutter/cupertino.dart';
import 'package:shopder/function/dataManagement/dateBox.dart';

class GetNotificationBillRequest {
  String notification_id;
  GetNotificationBillRequest({@required this.notification_id});
  Map<String, String> value() {
    return {"notification_id": this.notification_id};
  }
}

class GetNotificationBillResponse {
  NB_notification notification;
  NB_Post post;
  NB_Users users;
  GetNotificationBillResponse(
      {@required this.notification, @required this.post, @required this.users});
}

class NB_notification {
  String notification_id, bill_id, status;
  DateBox date_write, date;
  NB_notification(
      {@required this.notification_id,
      @required this.bill_id,
      @required this.status,
      @required this.date_write,
      @required this.date});
}

class NB_Post {
  String post_id, detail;
  NB_Post({@required this.post_id, @required this.detail});
}

class NB_Users {
  String user_id, name, image;
  NB_Users({@required this.user_id, @required this.name, @required this.image});
}
