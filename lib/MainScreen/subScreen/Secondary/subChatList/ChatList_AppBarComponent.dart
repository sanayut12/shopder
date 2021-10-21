import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatList_AppBarComponent extends StatefulWidget {
  @override
  _ChatList_AppBarComponentState createState() =>
      _ChatList_AppBarComponentState();
}

class _ChatList_AppBarComponentState extends State<ChatList_AppBarComponent> {
  @override
  Widget build(BuildContext context) {
    Widget BackButton = GestureDetector(
      onTap: () {
        Back();
      },
      child: Container(
        height: 65,
        width: 65,
        alignment: Alignment.center,
        child: Icon(Icons.arrow_back_ios),
      ),
    );
    return Container(
      height: 65,
      width: double.infinity,
      color: Color(0xfffa897b),
      child: Row(
        children: [BackButton],
      ),
    );
  }

  Future<void> Back() async {
    Navigator.of(context).pop();
  }
}
