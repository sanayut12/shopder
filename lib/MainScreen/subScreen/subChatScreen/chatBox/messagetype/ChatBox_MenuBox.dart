import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/MenuProfileScreen.dart';
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/dataManagement/dataChatBox.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetMenuTrack.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShopData.dart';
import 'package:shopder/function/http/httpGetMenuTrack.dart';
import 'package:shopder/function/http/httpGetPostShopData.dart';

class ChatBox_MenuBox extends StatefulWidget {
  ChatBox chatBox;
  ChatBox_MenuBox({@required this.chatBox});

  @override
  _ChatBox_MenuBoxState createState() => _ChatBox_MenuBoxState();
}

class _ChatBox_MenuBoxState extends State<ChatBox_MenuBox> {
  GetMenuTrackResponse menu_track;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetMenu();
  }

  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    String user_id = ShopInfoMamagement().GetShop_id();
    String inventory_id = this.widget.chatBox.message;
    if (menu_track == null) {
      return Container();
    } else {
      Widget ShowImage = Container(
        height: weight_screen * 0.1,
        width: weight_screen * 0.1,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "${HostName()}/image/menuImage/${menu_track.menu.image}"))),
      );
      return Container(
        margin: EdgeInsets.only(top: 1, bottom: 2),
        padding: EdgeInsets.all(5),
        constraints: BoxConstraints(maxWidth: weight_screen * 0.6),
        decoration: BoxDecoration(
            color: Colors.grey[500].withOpacity(0.5),
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          crossAxisAlignment: this.widget.chatBox.sender_id == user_id
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ShowImage,
                Container(
                  constraints: BoxConstraints(maxWidth: weight_screen * 0.4),
                  child: Text(
                      "จาก สินค้า\n${menu_track.menu.name} \nราคา ${menu_track.inventory.cost} บาท "),
                ),
              ],
            ),
            TextButton(
                onPressed: () {
                  OpenBuyMenuScreen();
                },
                child: Text("เปิด"))
          ],
        ),
      );
    }
  }

  Future<void> GetMenu() async {
    String inventory_id = this.widget.chatBox.message;
    GetMenuTrackRequest bufferGetMenuTrackRequest =
        GetMenuTrackRequest(inventory_id: inventory_id);
    GetMenuTrackResponse _menu_track = await HttpGetMenuTrack(
        bufferGetMenuTrackRequest: bufferGetMenuTrackRequest);
    setState(() {
      menu_track = _menu_track;
    });
  }

  Future<void> OpenBuyMenuScreen() async {
    String post_id = menu_track.inventory.post_id;
    String inventory_id = this.widget.chatBox.message;

    GetPostShopDataRequest bufferGetPostShopDataRequest =
        GetPostShopDataRequest(post_id: post_id);
    GetPostShopDataResponse data = await httpGetPostShopData(
        bufferGetPostShopDataRequest: bufferGetPostShopDataRequest);

    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) =>
            MenuProfileScreen(inventory_id: inventory_id, data: data)));
  }
}
