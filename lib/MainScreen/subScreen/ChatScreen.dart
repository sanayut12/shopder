import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopder/MainScreen/subScreen/subChatScreen/Chat_AppBarComponent.dart';
import 'package:shopder/MainScreen/subScreen/subChatScreen/Chat_BottomComponent.dart';
import 'package:shopder/MainScreen/subScreen/subChatScreen/Chat_ListMessage.dart';
import 'package:shopder/provider/DataManagementProvider.dart';

class ChatScreen extends StatefulWidget {
  String chatmanager_id;
  ChatScreen({@required this.chatmanager_id});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    String chatmanager_id = this.widget.chatmanager_id;
    DataManagementProvider provider =
        Provider.of<DataManagementProvider>(context, listen: false);
    String user_id = provider.bufferChatmanager[chatmanager_id].user_id;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color(0xfffa897b),
        child: SafeArea(
            child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Chat_AppBarComponent(chatmanager_id: chatmanager_id),
              Expanded(child: Chat_ListMessage(chatmanager_id: chatmanager_id)),
              Chat_BottomComponent(
                  chatmanager_id: chatmanager_id, user_id: user_id)
            ],
          ),
        )),
      ),
    );
  }
}
