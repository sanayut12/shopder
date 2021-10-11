import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:provider/provider.dart';
import 'package:shopder/FirstScreen/mainFirstScreen.dart';
import 'package:shopder/Load/loadScreen.dart';
import 'package:shopder/MainScreen/mainScreen.dart';
import 'package:shopder/module/BackGroundService.dart';
import 'package:shopder/provider/DataManagementProvider.dart';

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
        })
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
          MainFirstScreen.routeName: (context) => MainFirstScreen(),
          MainScreen.routeName: (context) => MainScreen()
        },
      ),
    );
  }
}
