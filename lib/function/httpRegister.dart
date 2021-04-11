import 'package:flutter/material.dart';
import 'package:shopder/loginANDregister/register.dart';
import 'readjson.dart';
import '../objects/httpObject.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:convert';

var client = http.Client();
String hostname;
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

void initHttp() async {
  hostname = await json.decode(await readJson())['http'];
}

Future<GetOTPResponse> httpGetOTP(GetOTPRequest bufferGetOTPRequest) async {
  var body = {
    'phone': bufferGetOTPRequest.phone,
  };
  var url = Uri.parse(hostname + "/otp/getOTP");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );
  var res = jsonDecode(uriResponse.body);
  GetOTPResponse data = GetOTPResponse(
      message: res["message"], key: res["key"], status: res["status"]);
  return data;
}

Future<ConfirmOTPResponse> httpConfirmOTP(
    ConfirmOTPRequest bufferconfirmOTPRequest) async {
  var body = {
    'phone': bufferconfirmOTPRequest.phone,
    'code': bufferconfirmOTPRequest.code
  };
  var url = Uri.parse(hostname + "/otp/confirmOTP");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );
  var res = jsonDecode(uriResponse.body);
  ConfirmOTPResponse data =
      ConfirmOTPResponse(message: res["message"], code: res["code"]);

  return data;
}

Future<RegisterResponse> httpRegister(
    RegisterRequest bufferRegisterRequest) async {
  var body = {
    'name': bufferRegisterRequest.name,
    'phone': bufferRegisterRequest.phone,
    'email': bufferRegisterRequest.email,
    'password': bufferRegisterRequest.password
  };

  var url = Uri.parse(hostname + '/users/register');
  var uriResponse =
      await client.post(url, body: jsonEncode(body), headers: Header);

  var res = jsonDecode(uriResponse.body);
  RegisterResponse data =
      RegisterResponse(message: res["message"], status: res["status"]);
  return data;
}
