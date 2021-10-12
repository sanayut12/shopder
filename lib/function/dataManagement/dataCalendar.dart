import 'package:flutter/cupertino.dart';
import 'package:shopder/function/dataManagement/dateBox.dart';

class PostCalendar {
  String detail;
  DateBox start, stop, send;
  PostCalendar(
      {@required this.detail,
      @required this.start,
      @required this.stop,
      @required this.send});
}
