import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/Secondary/FullItemConfirmScreen.dart';
import 'package:shopder/MainScreen/subScreen/subItemConfirmScreen/subItemConfirmPost/ItemConfirmPost_Detail2Component.dart';
import 'package:shopder/MainScreen/subScreen/subItemConfirmScreen/subItemConfirmPost/ItemConfirmPost_DetailComponent.dart';
import 'package:shopder/MainScreen/subScreen/subItemConfirmScreen/subItemConfirmPost/ItemConfirmPost_ListMenuComponent.dart';
import 'package:shopder/MainScreen/subScreen/subItemConfirmScreen/subItemConfirmPost/ItemConfirmPost_SendComponent.dart';
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
    double weight_screen = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        OpenFullItemConfirm();
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(
            top: 15,
            bottom: 5,
            right: weight_screen * 0.025,
            left: weight_screen * 0.025),
        padding: EdgeInsets.only(
            left: weight_screen * 0.025,
            top: 10,
            bottom: 10,
            right: weight_screen * 0.025),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
              color: Colors.grey[300], width: 1.0, style: BorderStyle.solid),
        ),
        child: Column(
          children: [
            ItemConfirmPost_DetailComponent(
                post_info: this.widget.data.post_info),
            ItemConfirmPost_StopComponent(
                post_info: this.widget.data.post_info),
            ItemConfirmPost_SendComponent(
                post_info: this.widget.data.post_info),
            ItemConfirmPost_TableComponent(),
            ItemConfirmPost_ListMenuComponent(data: this.widget.data),
            ItemConfirmPost_Detail2Component(
                post_info: this.widget.data.post_info),
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
