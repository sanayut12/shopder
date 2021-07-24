import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';

class ProfileInPostComponent extends StatefulWidget {
  // final ShopInfo shopInfo;
  // ProfileInPostComponent({@required this.shopInfo});
  @override
  _ProfileInPostComponentState createState() => _ProfileInPostComponentState();
}

class _ProfileInPostComponentState extends State<ProfileInPostComponent> {
  ShopInfo shopInfo = ShopInfoMamagement().GetShopInfo();
  Uint8List image_profile = ShopInfoMamagement().GetImageShop();

  @override
  Widget build(BuildContext context) {
    Widget ShopImage = Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover, image: MemoryImage(image_profile))),
    );

    Widget ShopName = Container(
      margin: EdgeInsets.only(left: 5),
      child: Text(
        "${shopInfo.name}",
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
    );

    return Container(
      height: 50,
      width: double.infinity,
      // color: Colors.black,
      child: Row(
        children: [ShopImage, ShopName],
      ),
    );
  }
}
