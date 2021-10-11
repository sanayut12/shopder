import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopder/MainScreen/subScreen/subChatList/ChatList_AppBarComponent.dart';
import 'package:shopder/MainScreen/subScreen/subChatList/ChatList_BoxComponent.dart';
import 'package:shopder/provider/DataManagementProvider.dart';

class ChatListScreen extends StatefulWidget {
  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xfffa897b),
        child: SafeArea(
            child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              ChatList_AppBarComponent(),
              Expanded(
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xfffa897b), Colors.white])),
                  child: Consumer(builder:
                      (context, DataManagementProvider provider, Widget child) {
                    List<String> bufferChatmanager_id = provider.ChatSort;
                    return Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: ListView.builder(
                          itemCount: bufferChatmanager_id.length,
                          itemBuilder: (BuildContext context, int index) {
                            String chatmanager_id = bufferChatmanager_id[index];
                            return ChatList_BoxComponent(
                                chatmanager_id: chatmanager_id);
                          }),
                    );
                  }),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
