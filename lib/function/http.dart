import 'package:flutter/material.dart';
import 'package:shopder/loginANDregister/register.dart';
import './readjson.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:convert';

var client = http.Client();
String httpJson;
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

void initHttp() async {
  httpJson = await json.decode(await readJson())['http'];
}

Future gethttp() async {
  var url = Uri.parse(httpJson);
  var uriResponse = await client.post(
    url,
    body: jsonEncode({'phone': '0962439665'}),
    headers: Header,
  );
  print(uriResponse.body);
  return "hello";
}

Future httpJsonRegister(
    String name, String password, String phone, String email) async {
  var body = {
    'name': name,
    'password': password,
    'phone': phone,
    'email': email
  };
  var url = Uri.parse(httpJson + "/users/register");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );
  return uriResponse.body;
}

Future httpGetOTP(String phone) async {
  var body = {
    'phone': phone,
  };
  var url = Uri.parse(httpJson + "/otp/getOTP");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );
  return uriResponse.body;
}

Future httpConfirmOTP(String phone, String code) async {
  var body = {'phone': phone, 'code': code};
  var url = Uri.parse(httpJson + "/otp/confirmOTP");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );
  return uriResponse.body;
}
