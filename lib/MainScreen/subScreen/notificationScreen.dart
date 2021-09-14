import 'package:flutter/material.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';
import 'package:shopder/function/dataManagement/dataUserInfo.dart';
import 'package:shopder/function/dataManagement/storageFunction.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    Widget Buttom1 = Container(
      width: double.infinity,
      color: Colors.green,
      child: Text("data"),
    );
    Widget Buttom2 = GestureDetector(
      onTap: () async {
        bool check = await ShopInfoMamagement().init();
        print("namef ${check}");
      },
      child: Container(
        color: Colors.blue,
        alignment: Alignment.center,
        child: Text("data"),
      ),
    );
    Widget Buttom3 = GestureDetector(
      onTap: () {
        DeleteDataInLocalStorage(key: "shopInfo");
      },
      child: Container(
        width: double.infinity,
        color: Colors.red,
        child: Text("data"),
      ),
    );

    return Container(
      child: Column(
        children: [
          Expanded(child: Buttom1),
          Expanded(child: Buttom2),
          Expanded(child: Buttom3)
        ],
      ),
    );
  }
}
