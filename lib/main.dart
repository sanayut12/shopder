import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopder/FirstScreen/mainFirstScreen.dart';
import 'package:shopder/Load/loadScreen.dart';
import 'package:shopder/MainScreen/mainScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      title: 'shopder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SukhumvitSet-Light',
        primarySwatch: Colors.blue,
      ),
      // home: MainFirstScreen(),
      initialRoute: "/",
      routes: <String, WidgetBuilder>{
        "/": (context) => LoadScreen(),
        "/login": (context) => MainFirstScreen(),
        "/main": (context) => MainScreen()
      },
    );
  }
}
