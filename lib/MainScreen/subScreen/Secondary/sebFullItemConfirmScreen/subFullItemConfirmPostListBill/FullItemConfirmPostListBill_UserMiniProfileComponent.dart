import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/http/ClassObjects/httpGetPostShopItemData.dart';
import 'package:shopder/module/ShowImageUsersProfile.dart';

class FullItemConfirmPostListBill_UserMiniProfileComponent
    extends StatefulWidget {
  String user_id;
  Map<String, PostShopItem_Users> bufferUsers; //<user_id ,data
  FullItemConfirmPostListBill_UserMiniProfileComponent(
      {@required this.user_id, @required this.bufferUsers});
  @override
  _FullItemConfirmPostListBill_UserMiniProfileComponentState createState() =>
      _FullItemConfirmPostListBill_UserMiniProfileComponentState();
}

class _FullItemConfirmPostListBill_UserMiniProfileComponentState
    extends State<FullItemConfirmPostListBill_UserMiniProfileComponent> {
  @override
  Widget build(BuildContext context) {
    String user_id = this.widget.user_id;
    Map<String, PostShopItem_Users> bufferUsers =
        this.widget.bufferUsers; //<use
    String image = bufferUsers[user_id].path;

    Widget NameProfile = Container(
      padding: EdgeInsets.only(left: 20),
      alignment: Alignment.centerLeft,
      child: Text("${this.widget.bufferUsers[this.widget.user_id].name}"),
    );
    return Container(
      child: Row(
        children: [
          ShowImageUsersProfile(image: image),
          Expanded(child: NameProfile)
        ],
      ),
    );
  }
}
