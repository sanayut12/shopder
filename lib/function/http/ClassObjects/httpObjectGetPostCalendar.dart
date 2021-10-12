import 'package:flutter/cupertino.dart';
import 'package:shopder/function/dataManagement/dataCalendar.dart';

class GetPostCalendarRequest {
  String shop_id;
  GetPostCalendarRequest({@required this.shop_id});
  Map<String, String> value() {
    return {"shop_id": this.shop_id};
  }
}

class GetPostCalendarResponse {
  Map<String, PostCalendar> bufferPost;
  String code;
  GetPostCalendarResponse({@required this.bufferPost, @required this.code});
}
