import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/profilescreen/subShopProfile/ShopProfile_BackComponent.dart';
import 'package:shopder/MainScreen/subScreen/profilescreen/subShopProfile/ShopProfile_BackgroundImageComponent.dart';
import 'package:shopder/MainScreen/subScreen/profilescreen/subShopProfile/ShopProfile_DetailComponent.dart';
import 'package:shopder/MainScreen/subScreen/profilescreen/subShopProfile/ShopProfile_ShowImageComponent.dart';

class ShopProfileComponent extends StatefulWidget {
  @override
  _ShopProfileComponentState createState() => _ShopProfileComponentState();
}

class _ShopProfileComponentState extends State<ShopProfileComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Stack(
        children: [
          //หลัง
          Container(
            child: Column(
              children: [
                ShopProfile_BackgroundImageComponent(),
                ShopProfile_DetailComponent()
              ],
            ),
          ),
          //กลาง
          ShopProfile_ShowImageComponent(),
          // ShopProfile_BackComponent()

          //บนสุด
        ],
      ),
    );
  }
}
