import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/FirstScreen/mainFirstScreen.dart';
import 'package:shopder/Load/spaceScreen.dart';
import 'package:shopder/MainScreen/mainScreen.dart';
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';
import 'package:shopder/function/dataManagement/readJsonAddress.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:rxdart/subjects.dart';
import 'package:shopder/module/socketioManagerForgound.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

// final BehaviorSubject<String> selectNotificationSubject =
//     BehaviorSubject<String>();

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
          color: Colors.yellow,
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
        Navigator.of(context).pushNamed("${MainScreen.routeName}");
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

        await Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => SpaceScreen()));
      }
    });
  }

  // void _configureSelectNotificationSubject() {
  //   selectNotificationSubject.stream.listen((String payload) async {
  //     print("กด notification ตอนแอปเปิด ${payload}");
  //     await Navigator.pushNamed(context, '/login');
  //   });
  // }
}
