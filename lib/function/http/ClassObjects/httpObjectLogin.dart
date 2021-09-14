import 'dart:convert';

import 'dart:typed_data';

import 'package:shopder/function/dataManagement/dataUserInfo.dart';

class LoginRequest {
  final String phone;
  final String password;

  LoginRequest({this.phone, this.password});
}

class LoginResponse {
  final DataUserInfo userInfo;
  final int code;

  LoginResponse({this.userInfo, this.code});
}

class DataUserInfo {
  final String user_id;
  final String name;
  final String phone;
  final String email;
  final Uint8List image;

  DataUserInfo({this.user_id, this.name, this.phone, this.email, this.image});

  Future<String> ToString() async {
    Map<String, dynamic> dataJson = {
      "user_id": user_id,
      "name": name,
      "phone": phone,
      "email": email,
      "image": image
    };

    String dataString = await json.encode(dataJson);
    return dataString;
  }

  UserInfo TranformUserInfo() {
    return UserInfo(
        user_id: this.user_id,
        name: this.name,
        phone: this.phone,
        email: this.email,
        image: this.image);
  }
}
