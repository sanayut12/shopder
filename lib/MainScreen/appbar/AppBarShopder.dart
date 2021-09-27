import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/appbar/subAppBar/CalandarAppBarComponent.dart';
import 'package:shopder/MainScreen/appbar/subAppBar/ChatAppBarComponent.dart';
import 'package:shopder/MainScreen/appbar/subAppBar/searchAppBarComponent.dart';

class AppBarShopder extends StatefulWidget {
  int page;
  AppBarShopder({@required this.page});
  @override
  _AppBarShopderState createState() => _AppBarShopderState();
}

class _AppBarShopderState extends State<AppBarShopder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.width * 0.2,
      color: Colors.amber,
      child: Row(
        children: [
          Expanded(flex: 4, child: SearchAppBarComponent()),
          Expanded(child: CalendarAppBarComponent()),
          Expanded(child: ChatAppBarComponent()),
        ],
      ),
    );
  }
}
