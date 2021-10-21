import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shopder/function/dataManagement/Readhostname.dart';

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

//r
Future<Uint8List> HttpGetImage({@required String image_name}) async {
  var url = Uri.parse("${HostName()}/getimage/${image_name}");
  var uriResponse = await client.get(
    url,
    headers: Header,
  );
  // print("${uriResponse.bodyBytes.lengthInBytes * 0.001} kilo byte");
  Map res = jsonDecode(uriResponse.body);
  String image = res['image'];

  Uint8List _image = base64Decode(image);

  return _image;
}
