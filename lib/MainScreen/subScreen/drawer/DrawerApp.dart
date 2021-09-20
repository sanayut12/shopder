import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/FirstScreen/mainFirstScreen.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';
import 'package:shopder/function/dataManagement/dataUserInfo.dart';
import 'package:shopder/module/AlertCard.dart';

class DrawerApp extends StatefulWidget {
  @override
  _DrawerAppState createState() => _DrawerAppState();
}

class _DrawerAppState extends State<DrawerApp> {
  @override
  Widget build(BuildContext context) {
    Widget Logout = GestureDetector(
      onTap: () async {
        ShowLogout();
      },
      child: Container(
        height: 30,
        width: double.infinity,
        padding: EdgeInsets.all(2),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.red),
        child: Text("ล๊อกเอ้า"),
      ),
    );

    return Container(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Logout,
        ],
      ),
    );
  }

  Future<void> ShowLogout() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertCardAsk(message: "ต้องการล๊อกเอ้าหรือไม่", func: Logout);
        });
  }

  Future<void> Logout() async {
    bool status = await ShopInfoMamagement().DeleteUser();
    if (status) {
      Navigator.of(context).pushNamed("${MainFirstScreen.routeName}");
    }
  }
}
