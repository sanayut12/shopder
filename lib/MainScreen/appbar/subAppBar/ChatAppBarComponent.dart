import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/ChatListScreen.dart';
import 'package:shopder/MainScreen/subScreen/ChatScreen.dart';

class ChatAppBarComponent extends StatefulWidget {
  @override
  _ChatAppBarComponentState createState() => _ChatAppBarComponentState();
}

class _ChatAppBarComponentState extends State<ChatAppBarComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => ChatListScreen()));
          },
          icon: Icon(
            Icons.chat_outlined,
            size: MediaQuery.of(context).size.width * 0.1,
          )),
    );
  }
}
