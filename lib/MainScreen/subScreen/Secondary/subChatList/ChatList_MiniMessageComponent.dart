import 'package:flutter/cupertino.dart';
import 'package:shopder/function/dataManagement/dataChatBox.dart';

class ChatList_MiniMessageComponent extends StatefulWidget {
  ChatBox chatBox;
  ChatList_MiniMessageComponent({@required this.chatBox});
  @override
  _ChatList_MiniMessageComponentState createState() =>
      _ChatList_MiniMessageComponentState();
}

class _ChatList_MiniMessageComponentState
    extends State<ChatList_MiniMessageComponent> {
  @override
  Widget build(BuildContext context) {
    ChatBox chatBox = this.widget.chatBox;
    String type_chat = chatBox.type_chat;
    if (type_chat == "1") {
      String message = chatBox.message;
      return Container(
        child: Text("${message}"),
      );
    } else {
      return Container();
    }
  }
}
