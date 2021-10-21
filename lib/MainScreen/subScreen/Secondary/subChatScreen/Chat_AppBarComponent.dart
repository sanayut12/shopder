import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/provider/DataManagementProvider.dart';

class Chat_AppBarComponent extends StatefulWidget {
  String chatmanager_id;
  Chat_AppBarComponent({@required this.chatmanager_id});
  @override
  _Chat_AppBarComponentState createState() => _Chat_AppBarComponentState();
}

class _Chat_AppBarComponentState extends State<Chat_AppBarComponent> {
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
        child: Icon(
          Icons.arrow_back_ios,
          size: 40,
          color: Colors.white,
        ),
      ),
    );

    String chatmanager_id = this.widget.chatmanager_id;
    return Consumer(
        builder: (context, DataManagementProvider provider, Widget child) {
      String user_id = provider.bufferChatmanager[chatmanager_id].user_id;
      String name = provider.bufferUsersProfileMini[user_id].name;
      String image = provider.bufferUsersProfileMini[user_id].image;

      Widget ShopImage = image == null
          ? Container()
          : Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "${HostName()}/image/ImageUsers/${image}"))),
            );
      Widget ShowName = Container(
        margin: EdgeInsets.only(left: 15),
        child: Text(
          "${name}",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
        ),
      );
      return Container(
        height: 65,
        width: double.infinity,
        color: Color(0xfffa897b),
        child: Row(
          children: [BackButton, ShopImage, ShowName],
        ),
      );
    });
  }

  Future<void> Back() async {
    Navigator.of(context).pop();
  }
}

//ส่วนของการประมวลผล

// //ส่วนของการแสดงผล


