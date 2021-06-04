import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:shopder/CreateShopInfo/mainScreenRegisterShop.dart';
import 'package:shopder/function/dataManagement/storageFunction.dart';

ShopInfo shopInfo;
Uint8List image_shop_profile_byte;

class ShopInfoMamagement {
  Future<void> InsertShopInfoToStorage(
      {@required ShopInfo bufferShopInfo}) async {
    shopInfo = bufferShopInfo;
    image_shop_profile_byte = base64Decode(bufferShopInfo.image);
    Map<String, dynamic> dataJson = {
      'shop_id': bufferShopInfo.shop_id,
      'name': bufferShopInfo.name,
      'image': bufferShopInfo.image,
      'type': bufferShopInfo.type,
      'address': bufferShopInfo.address,
      'sub_district': bufferShopInfo.sub_district,
      'district': bufferShopInfo.district,
      'province': bufferShopInfo.province,
      'latitude': bufferShopInfo.latitude,
      'longtitude': bufferShopInfo.longtitude,
    };
    String buffer = await json.encode(dataJson);
    await InsertDataToStorage(key: 'shopInfo', buffer: buffer);
  }

  Future<void> init() async {
    String dataString = await ReadDataInStorage(key: 'shopInfo');
    var dataJson = await json.decode(dataString);

    ShopInfo bufferShopInfo = ShopInfo(
        shop_id: dataJson['shop_id'],
        name: dataJson['name'],
        type: dataJson['type'],
        image: dataJson['image'],
        address: dataJson['address'],
        sub_district: dataJson['sub_district'],
        district: dataJson['district'],
        province: dataJson['province'],
        latitude: dataJson['latitude'].toDouble(),
        longtitude: dataJson['longtitude'].toDouble());

    shopInfo = bufferShopInfo;
  }

  Uint8List GetImageShop() {
    return image_shop_profile_byte; //shopInfo.image;
  }

  String GetShop_id() {
    return shopInfo.shop_id;
  }
}

class ShopInfo {
  final String shop_id;
  final String name;
  final String address;
  final String sub_district;
  final String district;
  final String province;
  final String type;
  final String image;
  final double latitude;
  final double longtitude;

  ShopInfo(
      {this.shop_id,
      this.name,
      this.type,
      this.image,
      this.address,
      this.sub_district,
      this.district,
      this.province,
      this.latitude,
      this.longtitude});
}
