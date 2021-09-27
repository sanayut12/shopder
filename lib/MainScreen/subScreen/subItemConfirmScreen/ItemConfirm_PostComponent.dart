import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/FullItemConfirmScreen.dart';
import 'package:shopder/MainScreen/subScreen/subItemConfirmScreen/subItemConfirmPost/ItemConfirmPost_Detail2Component.dart';
import 'package:shopder/MainScreen/subScreen/subItemConfirmScreen/subItemConfirmPost/ItemConfirmPost_DetailComponent.dart';
import 'package:shopder/MainScreen/subScreen/subItemConfirmScreen/subItemConfirmPost/ItemConfirmPost_ListMenuComponent.dart';
import 'package:shopder/MainScreen/subScreen/subItemConfirmScreen/subItemConfirmPost/ItemConfirmPost_SendComponent.dart';
import 'package:shopder/MainScreen/subScreen/subItemConfirmScreen/subItemConfirmPost/ItemConfirmPost_StartComponent.dart';
import 'package:shopder/MainScreen/subScreen/subItemConfirmScreen/subItemConfirmPost/ItemConfirmPost_StopComponent.dart';
import 'package:shopder/MainScreen/subScreen/subItemConfirmScreen/subItemConfirmPost/ItemConfirmPost_TableComponent.dart';
import 'package:shopder/function/http/ClassObjects/httpGetPostShopItemData.dart';

class ItemConfirm_PostComponent extends StatefulWidget {
  GetPostShopItemDataResposne data;
  ItemConfirm_PostComponent({@required this.data});
  @override
  _ItemConfirm_PostComponentState createState() =>
      _ItemConfirm_PostComponentState();
}

class _ItemConfirm_PostComponentState extends State<ItemConfirm_PostComponent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // print("object");
        OpenFullItemConfirm();
      },
      child: Container(
        /*12*/
        // height: 100,

        width: double.infinity,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
              color: Color(0xFFFF6F5D), width: 3.0, style: BorderStyle.solid),
        ),

        child: Column(
          children: [
            ItemConfirmPost_DetailComponent(
                post_info: this.widget.data.post_info),
            ItemConfirmPost_StartComponent(
                post_info: this.widget.data.post_info),
            ItemConfirmPost_StopComponent(
                post_info: this.widget.data.post_info),
            ItemConfirmPost_SendComponent(
                post_info: this.widget.data.post_info),
            ItemConfirmPost_Detail2Component(
                post_info: this.widget.data.post_info),
            ItemConfirmPost_TableComponent(),
            ItemConfirmPost_ListMenuComponent(data: this.widget.data)
          ],
        ),
      ),
    );
  }

  Future<void> OpenFullItemConfirm() async {
    await Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) =>
            FullItemConfirmScreen(data: this.widget.data)));

    setState(() {});
  }

  // Future<void> SetStatus(String bill_id, String _status) {
  //   this.widget.SetStatus(this.widget.index, bill_id, _status);
  // }
}
