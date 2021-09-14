import 'dart:io';

import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:shopder/MainScreen/component/bottomBar.dart';
import 'package:shopder/MainScreen/subScreen/ItemBillScreen.dart';
import 'package:shopder/MainScreen/subScreen/ItemConfirmScreen.dart';
import 'package:shopder/MainScreen/subScreen/billScreen.dart';
import 'package:shopder/MainScreen/subScreen/feedScreen.dart';
import 'package:shopder/MainScreen/subScreen/notificationScreen.dart';
import 'package:shopder/MainScreen/subScreen/orderScreen.dart';
import 'package:shopder/MainScreen/subScreen/profileScreen.dart';
import 'package:shopder/module/AlertCard.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String data;
  int bottomBarIndex = 0;

  ///0-3uj

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getDataUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> ListSwapScreen = [
      FeedScreen(),
      ItemConfirmScreen(),
      // OrderScreen(),
      ItemBillScreen(),
      // BillScreen(),
      NotificationScreen(),
      ProfileScreen()
    ];

    return WillPopScope(
      onWillPop: () {
        ShowExit();
      },
      child: Scaffold(
          drawer: Drawer(
            child: Container(
              height: double.infinity,
              width: 200,
              // color: Colors.red,
            ),
          ),
          body: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.red,
                    child: Text(
                      "shopder",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  )),
              Expanded(flex: 9, child: ListSwapScreen[bottomBarIndex])
            ],
          ),
          bottomNavigationBar: BottomBar(
            bottombarIndex: bottomBarIndex,
            changeScreen: ChangeScreen,
          )),
    );
  }

  Future<void> ChangeScreen({@required int bottombarindex}) {
    setState(() {
      bottomBarIndex = bottombarindex;
    });
  }

  Future<void> ShowExit() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertCardAsk(
              message: "ต้องการออกจากแอปหรือไม่", func: ExitApp);
        });
  }

  Future<void> ExitApp() {
    exit(0);
  }
}
