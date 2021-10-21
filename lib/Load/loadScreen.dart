import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/FirstScreen/mainFirstScreen.dart';
import 'package:shopder/Load/navigator_notification/page1GotoFullItemConfirmScreen.dart';
import 'package:shopder/Load2/load2Screen.dart';
import 'package:shopder/MainScreen/mainScreen.dart';
import 'package:shopder/MainScreen/subScreen/Secondary/FullItemConfirmScreen.dart';
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';
import 'package:shopder/function/dataManagement/readJsonAddress.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shopder/function/http/ClassObjects/httpGetPostShopItemData.dart';
import 'package:shopder/module/socketioManagerForgound.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

String selectedNotificationPayload;

class LoadScreen extends StatefulWidget {
  static String routeName = "/load";
  @override
  _LoadScreenState createState() => _LoadScreenState();
}

class _LoadScreenState extends State<LoadScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Load();
    // _configureSelectNotificationSubject();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // _showNotification();
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          color: Colors.white,
          child: Text("Loading"),
        ),
      ),
    );
  }

  Future<void> Load() async {
    final NotificationAppLaunchDetails notificationAppLaunchDetails =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

    await initLoadHostName();
    await AddressThailand().init();
    await SocketioManagerForgound().init();
    await notification();

    bool userinfo_check = await ShopInfoMamagement().init();
    print(userinfo_check);

    //เช็คการเปิดแอปจาก icon
    print("init ${notificationAppLaunchDetails.didNotificationLaunchApp}");
    if (notificationAppLaunchDetails.didNotificationLaunchApp) {
      //เปิดจาก icon
      String payload = notificationAppLaunchDetails.payload;
      // print("object");
      print("กด notification ตอนแอปปิด");
      Navigator.of(context).pushNamed("${MainScreen.routeName}");
    } else {
      //เปิดจาก notification
      if (userinfo_check == true) {
        Navigator.of(context).pushNamed("${Load2Screen.routeName}");
        // print("ffffffffffffffffffssssssssssssssssssssssssssssssssss");
      } else {
        Navigator.of(context).pushNamed("${MainFirstScreen.routeName}");
      }
      //ทำการย้ายหน้า
      print("เปิดแอปจาก icon");
    }
  }

  void notification() async {
    //##1111
    final NotificationAppLaunchDetails notificationAppLaunchDetails =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('fooder_notify');

    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String payload) async {
      if (payload != null) {
        // debugPrint('notification payload: $payload');
        debugPrint("กด notification ตอนแอปเปิด ${payload}");

        Map dataJson = json.decode(payload);
        String page = dataJson['page'];

        if (page == "1") {
          String post_id = dataJson['post_id'];
          GetPostShopItemDataResposne data =
              await Page1GotoFullItemConfirmScreen(post_id);
          await Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) =>
                  FullItemConfirmScreen(data: data)));
        }
      }
    });
  }
}
