import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:shopder/MainScreen/component/bottomBar.dart';
import 'package:shopder/MainScreen/subScreen/feedScreen.dart';
import 'package:shopder/MainScreen/subScreen/notificationScreen.dart';
import 'package:shopder/MainScreen/subScreen/orderScreen.dart';
import 'package:shopder/MainScreen/subScreen/profileScreen.dart';

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
      OrderScreen(),
      NotificationScreen(),
      ProfileScreen()
    ];

    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu_sharp),
          leadingWidth: 10,
          actions: [Text("data")],
        ),
        body: ListSwapScreen[bottomBarIndex],
        bottomNavigationBar: BottomBar(
          bottombarIndex: bottomBarIndex,
          changeScreen: ChangeScreen,
        ));
  }

  Future<void> ChangeScreen({@required int bottombarindex}) {
    setState(() {
      bottomBarIndex = bottombarindex;
    });
  }
}
