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
            margin: EdgeInsets.only(left: 5,top: 5), 
      decoration: BoxDecoration(
        
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover, image: MemoryImage(shopInfo.image))),
    );
    Widget NameShop = Container(
      margin: EdgeInsets.only(left: 5,top: 15),
      height: double.infinity,
      width: double.infinity,
      child: Text("${shopInfo.name}",
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
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
