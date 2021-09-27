import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/appbar/AppBarShopder.dart';
import 'package:shopder/MainScreen/subScreen/ItemBillScreen.dart';
import 'package:shopder/MainScreen/subScreen/ItemConfirmScreen.dart';
import 'package:shopder/MainScreen/drawer/DrawerApp.dart';
import 'package:shopder/MainScreen/subScreen/feedScreen.dart';
import 'package:shopder/MainScreen/subScreen/notificationScreen.dart';
import 'package:shopder/MainScreen/subScreen/profileScreen.dart';
import 'package:shopder/module/AlertCard.dart';

class MainScreen extends StatefulWidget {
  static String routeName = "/main";
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String data;
  int bottomBarIndex = 0;

  ///0-3uj
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getDataUserInfo();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("=================main dispost========================");
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
        key: _key,
        drawer: Drawer(child: DrawerApp()),
        appBar: AppbarShopder(OpenDrawer, MediaQuery.of(context).size.width),
        body: Stack(
          children: [
            Expanded(
              // flex: 1,
              child: Container(
                  alignment: Alignment.center,
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    // color: Colors.green,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          "assets/image/background/backgroundInfor.png"),
                    ),
                  )
                  // color: Colors.red,
                  // child: Text(
                  // "shopder",
                  // style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
            ),
            Column(
              children: [
                // AppBarShopder(page: bottomBarIndex),
                Expanded(child: ListSwapScreen[bottomBarIndex]),
              ],
            )
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          index: 0,
          height: 60.0,
          items: <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.event, size: 30),
            Icon(Icons.local_shipping, size: 30),
            Icon(Icons.notifications, size: 30),
            Icon(Icons.account_circle_sharp, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Color(0xFFFA897B),
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              bottomBarIndex = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        // bottomNavigationBar: BottomBar(
        //   bottombarIndex: bottomBarIndex,
        //   changeScreen: ChangeScreen,
        // )
      ),
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

  Future<void> OpenDrawer() {
    _key.currentState.openDrawer();
  }
}
