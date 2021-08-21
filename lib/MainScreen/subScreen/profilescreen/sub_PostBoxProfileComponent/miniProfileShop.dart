import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';

class MiniProfileShop extends StatefulWidget {
  @override
  _MiniProfileShopState createState() => _MiniProfileShopState();
}

class _MiniProfileShopState extends State<MiniProfileShop> {
  ShopInfo shopInfo = ShopInfoMamagement().value();
  @override
  Widget build(BuildContext context) {
    Widget ImageShop = Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: MemoryImage(base64Decode("${shopInfo.image}")))),
    );
    Widget NameShop = Container(
      height: double.infinity,
      width: double.infinity,
      child: Text("${shopInfo.name}"),
    );
    return Container(
      height: 50,
      width: double.infinity,
      child: Row(
        children: [
          ImageShop,
          Expanded(child: NameShop),
        ],
      ),
    );
  }
}
