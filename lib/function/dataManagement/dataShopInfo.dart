import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:shopder/function/dataManagement/storageFunction.dart';

ShopInfo shopInfo;
Uint8List image_shop_profile_byte;

class ShopInfoMamagement {
  Future<void> InsertShopInfoToStorage(
      {@required ShopInfo bufferShopInfo}) async {
    shopInfo = bufferShopInfo;

    print(shopInfo);
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

  String GetShop_id() {
    return shopInfo.shop_id;
  }

  String GetName() {
    return shopInfo.name;
  }

  Uint8List GetImageShop() {
    return image_shop_profile_byte; //shopInfo.image;
  }

  String GetType() {
    return shopInfo.type;
  }

  String GetAddress() {
    return shopInfo.address;
  }

  String GetSub_district() {
    return shopInfo.sub_district;
  }

  String GetDistrict() {
    return shopInfo.district;
  }

  String GetProvice() {
    return shopInfo.province;
  }

  Position GetPosition() {
    return Position(
        latitude: shopInfo.latitude, longtitude: shopInfo.longtitude);
  }

  ShopInfo GetShopInfo() {
    return shopInfo;
  }
}

class Position {
  final double latitude;
  final double longtitude;
  Position({@required this.latitude, @required this.longtitude});
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
