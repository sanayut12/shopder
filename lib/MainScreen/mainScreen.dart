import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:shopder/MainScreen/component/bottomBar.dart';
import 'package:shopder/MainScreen/subScreen/billScreen.dart';
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
      BillScreen(),
      NotificationScreen(),
      ProfileScreen()
    ];

    return Scaffold(
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
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                )),
            Expanded(flex: 9, child: ListSwapScreen[bottomBarIndex])
          ],
        ),
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
