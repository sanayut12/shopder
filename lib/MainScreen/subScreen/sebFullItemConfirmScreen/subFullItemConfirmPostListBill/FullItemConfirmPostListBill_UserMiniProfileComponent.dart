import 'package:flutter/cupertino.dart';
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/http/ClassObjects/httpGetPostShopItemData.dart';

class FullItemConfirmPostListBill_UserMiniProfileComponent
    extends StatefulWidget {
  final String user_id;
  final Map<String, PostShopItem_Users> bufferUsers; //<user_id ,data
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
    Widget ImageProfile = Container(
      height: MediaQuery.of(context).size.width * 0.15,
      width: MediaQuery.of(context).size.width * 0.15,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "${this.widget.bufferUsers[this.widget.user_id].path == null ? '${HostName()}/image/menuImage/0AD3246B86B391E52B9FA3DF0163E8CB.jpg' : ''}"))),
    );

    Widget NameProfile = Container(
      padding: EdgeInsets.only(left: 20),
      alignment: Alignment.centerLeft,
      child: Text("${this.widget.bufferUsers[this.widget.user_id].name}"),
    );
    return Container(
      child: Row(
        children: [ImageProfile, Expanded(child: NameProfile)],
      ),
    );
  }
}
