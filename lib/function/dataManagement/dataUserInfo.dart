import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:shopder/function/dataManagement/storageFunction.dart';

UserInfo userInfo;

class UserInfoManagement {
  //ใช้ทำการ เก็บข้อมูลของ user ลงใน Local storage ชื่อ 'userInfo'
  Future<void> InsertUserInfoToStorage(
      {@required UserInfo bufferUserInfo}) async {
    userInfo = bufferUserInfo;

    Map<String, dynamic> dataJson = {
      "user_id": bufferUserInfo.user_id,
      "name": bufferUserInfo.name,
      "phone": bufferUserInfo.phone,
      "email": bufferUserInfo.email,
      "image": bufferUserInfo.image
    };
    String buffer = await json.encode(dataJson);
    await InsertDataToStorage(key: 'userInfo', buffer: buffer);
  }

  //ทำการนำข้อมมูลจาก local storage ชื่อ 'userInfo' แล้วไป update ที่ตัวแปร userInfo ของ class นี้
  Future<void> init() async {
    String dataString = await ReadDataInStorage(key: 'userInfo');
    print(dataString);
    // var dataJson = await json.decode(dataString);

    // UserInfo bufferUserInfo = UserInfo(
    //     user_id: dataJson['user_id'],
    //     name: dataJson['name'],
    //     phone: dataJson['phone'],
    //     email: dataJson['email'],
    //     image: dataJson['image']);
    // userInfo = bufferUserInfo;
  }

  String User_id() {
    return userInfo.user_id;
  }

  String Name() {
    return userInfo.name;
  }

  String Phone() {
    return userInfo.phone;
  }

  String Email() {
    return userInfo.email;
  }

  Uint8List Image() {
    return userInfo.image;
  }
}

class UserInfo {
  final String user_id;
  String name;
  String phone;
  String email;
  Uint8List image;

  UserInfo(
      {@required this.user_id,
      @required this.name,
      @required this.phone,
      @required this.email,
      @required this.image});
}

// class DataUserInfo(){
//   final
// }
