import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/dataManagement/dataCalendar.dart';
import 'package:shopder/function/dataManagement/dateBox.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostCalendar.dart';

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<GetPostCalendarResponse> HttpGetPostCalendar(
    {@required GetPostCalendarRequest bufferGetPostCalendarRequest}) async {
  var body = bufferGetPostCalendarRequest.value();

  var url = Uri.parse("${HostName()}/calendar/getPost");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );

  var res = jsonDecode(uriResponse.body);
  print(res);
  Map post = res['data']['post'];
  Map menu = res['data']['menu'];
  String code = res['code'];
  // print("${post.keys}");
  //วนลูปเพื่อเอาค่าใส่ class
  Map<String, PostCalendar> bufferPost = {};
  post.forEach((key, value) {
    Map start = value['start'];
    Map stop = value['stop'];
    Map send = value['send'];

    DateBox _start = DateBox(
        year: start['year'],
        month: start['month'],
        day: start['day'],
        hour: start['hour'],
        min: start['min']);
    DateBox _stop = DateBox(
        year: stop['year'],
        month: stop['month'],
        day: stop['day'],
        hour: stop['hour'],
        min: stop['min']);
    DateBox _send = DateBox(
        year: send['year'],
        month: send['month'],
        day: send['day'],
        hour: send['hour'],
        min: send['min']);

    bufferPost[key] = PostCalendar(
        detail: value['detail'], start: _start, stop: _stop, send: _send);
  });

  return GetPostCalendarResponse(bufferPost: bufferPost, code: code);
}
