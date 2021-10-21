import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopder/MainScreen/mainScreen.dart';
import 'package:shopder/provider/DataConfirmItemManagerProvider.dart';
import 'package:shopder/provider/DataPostManagerProvider.dart';
import 'package:shopder/provider/DataSendItemManagerProvider.dart';

class Load2Screen extends StatefulWidget {
  static String routeName = "/load2";
  @override
  _Load2ScreenState createState() => _Load2ScreenState();
}

class _Load2ScreenState extends State<Load2Screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SafeArea(
            child: Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          child: CircularProgressIndicator(),
        )),
      ),
    );
  }

  void Init() async {
    print("Load 2 ");
    DataPostManagementProvider postProvider =
        Provider.of<DataPostManagementProvider>(context, listen: false);
    postProvider.init();

    DataConfirmItemManagerProvider confirmitemProvider =
        Provider.of<DataConfirmItemManagerProvider>(context, listen: false);
    confirmitemProvider.init();

    DataSendItemManagerProvider senditemProvider =
        Provider.of<DataSendItemManagerProvider>(context, listen: false);
    senditemProvider.init();

    await Future.delayed(Duration(seconds: 2));
    Navigator.of(context).pushNamed("${MainScreen.routeName}");
  }
}
