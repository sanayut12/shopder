import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopder/MainScreen/appbar/AppBarShopder.dart';
import 'package:shopder/MainScreen/appbar/Appbar2Shopder.dart';
import 'package:shopder/MainScreen/subScreen/ItemBillScreen.dart';
import 'package:shopder/MainScreen/subScreen/ItemConfirmScreen.dart';
import 'package:shopder/MainScreen/drawer/DrawerApp.dart';
import 'package:shopder/MainScreen/subScreen/feedScreen.dart';
import 'package:shopder/MainScreen/subScreen/notificationScreen.dart';
import 'package:shopder/MainScreen/subScreen/profileScreen.dart';
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/dataManagement/dataChatBox.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetChatMessage.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetListChatManager.dart';
import 'package:shopder/function/http/httpGetChatMessage.dart';
import 'package:shopder/function/http/httpGetListChatManager.dart';
import 'package:shopder/module/AlertCard.dart';
import 'package:shopder/provider/DataManagementProvider.dart';

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
    Init();
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
        // appBar: AppbarShopder(OpenDrawer, MediaQuery.of(context).size.width),
        body: Container(
          child: SafeArea(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                children: [
                  AppBar2Shopder(),
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          // AppBarShopder(page: bottomBarIndex),
                          Expanded(child: ListSwapScreen[bottomBarIndex]),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          index: 0,
          height: 60.0,
          items: <Widget>[
            Icon(
              Icons.home,
              size: 30,
              color: Colors.white,
            ),
            Icon(Icons.event, size: 30, color: Colors.white),
            Icon(Icons.local_shipping, size: 30, color: Colors.white),
            Icon(Icons.notifications, size: 30, color: Colors.white),
            Icon(Icons.account_circle_sharp, size: 30, color: Colors.white),
          ],
          color: Color(0xFFFA897B).withOpacity(0.8),
          buttonBackgroundColor: Color(0xFFFA897B).withOpacity(0.8),
          backgroundColor: Colors.white,
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

  Future<void> Init() async {
    DataManagementProvider provider =
        Provider.of<DataManagementProvider>(context, listen: false);
    provider.initSocket();
    String shop_id = ShopInfoMamagement().GetShop_id();
    GetListChatManagerRequest bufferGetListChatManagerRequest =
        GetListChatManagerRequest(shop_id: shop_id);
    GetListChatManagerResponse bufferGetListChatManagerResponse =
        await HttpGetListChatManager(
            bufferGetListChatManagerRequest: bufferGetListChatManagerRequest,
            host: HostName());
    List<String> bufferChatManager_id =
        bufferGetListChatManagerResponse.bufferChatManager_id;
    Map<String, ChatManager> bufferChatManager =
        bufferGetListChatManagerResponse.bufferChatManager;
    Map<String, UsersProfileMini> bufferUserProfileMini =
        bufferGetListChatManagerResponse.bufferUserProfileMini;

    bufferUserProfileMini.forEach((key, value) {
      provider.AddUsers(key, value);
    });

    bufferChatManager.forEach((key, value) {
      provider.AddChatmanager(key, value);
    });

    for (String chatmanager_id in bufferChatManager_id) {
      GetChatMessageRequest bufferGetChatMessageRequest =
          GetChatMessageRequest(chatmanager_id: chatmanager_id);
      GetChatMessageResponse bufferGetChatMessageResponse =
          await HttpGetChatMessage(
              bufferGetChatMessageRequest: bufferGetChatMessageRequest,
              host: HostName());

      int len_chatbox = bufferGetChatMessageResponse.bufferChatBox.length;

      for (String chatmessage_id in bufferGetChatMessageResponse
          .bufferChatBox.keys
          .toList()
          .reversed) {
        provider.AddChatBox(chatmessage_id,
            bufferGetChatMessageResponse.bufferChatBox[chatmessage_id]);
      }
    }

    bufferChatManager_id.forEach((element) {
      provider.AddChatSort(element);
    });
  }
}
