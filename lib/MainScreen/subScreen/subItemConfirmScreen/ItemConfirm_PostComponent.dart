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
  final GetPostShopItemDataResposne data;
  final int index;
  final Function SetStatus;
  ItemConfirm_PostComponent(
      {@required this.data, @required this.index, @required this.SetStatus});
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
        // height: 100,
        width: double.infinity,
        color: Colors.red,
        margin: EdgeInsets.only(top: 10),
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
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => FullItemConfirmScreen(
              data: this.widget.data,
              SetStatus: SetStatus,
            )));
  }

  Future<void> SetStatus(String bill_id, String _status) {
    this.widget.SetStatus(this.widget.index, bill_id, _status);
  }
}
