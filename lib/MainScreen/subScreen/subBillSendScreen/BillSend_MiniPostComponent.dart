import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/subBillSendScreen/BillSendMiniPost/BillSendMiniPost_ListMenuComponent.dart';
import 'package:shopder/MainScreen/subScreen/subBillSendScreen/BillSendMiniPost/BillSendMiniPost_ShopProfileComponent.dart';
import 'package:shopder/MainScreen/subScreen/subBillSendScreen/BillSendMiniPost/BillSendMiniPost_StatusComponent.dart';
import 'package:shopder/MainScreen/subScreen/subBillSendScreen/BillSendMiniPost/BillSendMiniPost_TableComponent.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShopBillData.dart';

class BillSend_PostBoxComponent extends StatefulWidget {
  GetPostShopBillDataResposne data;
  BillSend_PostBoxComponent({@required this.data});
  @override
  _BillSend_PostBoxComponentState createState() =>
      _BillSend_PostBoxComponentState();
}

class _BillSend_PostBoxComponentState extends State<BillSend_PostBoxComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(top: 1,left: 10,right: 10),
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(10),
      //     border: Border.all(color: Colors.red)),
      child: Column(
        children: [
          BillSendMiniPost_ShopProfileComponent(),
          BillSendMiniPost_StatusComponent(data: this.widget.data),
          BillSendMiniPost_TableComponent(),
          BillSendMiniPost_ListMenuComponent(data: this.widget.data),
        ],
      ),
    );
  }
}
