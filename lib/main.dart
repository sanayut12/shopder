import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:provider/provider.dart';
import 'package:shopder/FirstScreen/mainFirstScreen.dart';
import 'package:shopder/Load/loadScreen.dart';
import 'package:shopder/Load2/load2Screen.dart';
import 'package:shopder/MainScreen/mainScreen.dart';
import 'package:shopder/module/BackGroundService.dart';
import 'package:shopder/provider/DataConfirmItemManagerProvider.dart';
import 'package:shopder/provider/DataImageManagerProvider.dart';
import 'package:shopder/provider/DataManagementProvider.dart';
import 'package:shopder/provider/DataPostManagerProvider.dart';
import 'package:shopder/provider/DataSendItemManagerProvider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterBackgroundService.initialize(onStartBackGroundService);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays([]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return DataManagementProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return DataPostManagementProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return DataImageManagerProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return DataConfirmItemManagerProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return DataSendItemManagerProvider();
        }),
      ],
      child: MaterialApp(
        title: 'shopder',
        debugShowCheckedModeBanner: false,

        theme: ThemeData(
          fontFamily: 'SukhumvitSet-Light',
          primarySwatch: Colors.blue,
        ),
        // home: MainFirstScreen(),
        initialRoute: LoadScreen.routeName,
        routes: <String, WidgetBuilder>{
          LoadScreen.routeName: (context) => LoadScreen(),
          Load2Screen.routeName: (context) => Load2Screen(),
          MainFirstScreen.routeName: (context) => MainFirstScreen(),
          MainScreen.routeName: (context) => MainScreen()
        },
      ),
    );
  }
}
