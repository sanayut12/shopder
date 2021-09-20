import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';

class ShopProfile_DetailComponent extends StatefulWidget {
  @override
  _ShopProfile_DetailComponentState createState() =>
      _ShopProfile_DetailComponentState();
}

class _ShopProfile_DetailComponentState
    extends State<ShopProfile_DetailComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.4,
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(
                left: 25, top: MediaQuery.of(context).size.width * 0.18),
            // padding: const EdgeInsets.only(left: 30, top: 20, bottom: 20),
            // color: Colors.red,
            child: Text("${ShopInfoMamagement().GetName()}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
