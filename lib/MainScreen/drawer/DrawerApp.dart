import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:shopder/FirstScreen/mainFirstScreen.dart';
import 'package:shopder/MainScreen/drawer/subDrawer/Drawer_HistoryComponent.dart';
import 'package:shopder/MainScreen/drawer/subDrawer/Drawer_OptionComponent.dart';
import 'package:shopder/MainScreen/drawer/subDrawer/Drawer_ShopProfileComponent.dart';
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
        height: MediaQuery.of(context).size.width * 0.15,
        width: double.infinity,
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.all(2),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]),
            borderRadius:
                BorderRadius.circular(MediaQuery.of(context).size.width * 0.1),
            color: Colors.white),
        child: Text("ออกจากระบบ"),
      ),
    );

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xfffa897b), Colors.white])),
      child: Column(
        children: [
          Expanded(
              flex: 5,
              child: Container(
                child: Column(
                  children: [
                    Drawer_ShopProfileComponent(),
                    Drawer_OptionComponent(),
                    Drawer_HistoryComponent()
                  ],
                ),
              )),
          Expanded(
              child: Row(
            children: [Expanded(child: Container()), Expanded(child: Logout)],
          )),
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
      FlutterBackgroundService().sendData({
        "event": "stop_service_push_notification",
        "shop_id": ShopInfoMamagement().GetShop_id()
      });

      Navigator.of(context).pushNamed("${MainFirstScreen.routeName}");
    }
  }
}
