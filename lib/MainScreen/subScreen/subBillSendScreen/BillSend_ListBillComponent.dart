import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/FullBillScreen.dart';
import 'package:shopder/MainScreen/subScreen/subBillSendScreen/BillSend_ListBillComponent/BillSendListBill_ListMenuComponent.dart';
import 'package:shopder/MainScreen/subScreen/subBillSendScreen/BillSend_ListBillComponent/BillSendListBill_MiniProfilecomponent.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShopBillData.dart';

class BillSend_ListBillComponent extends StatefulWidget {
  String bill_id;
  GetPostShopBillDataResposne data;
  BillSend_ListBillComponent({@required this.bill_id, @required this.data});
  @override
  _BillSend_ListBillComponentState createState() =>
      _BillSend_ListBillComponentState();
}

class _BillSend_ListBillComponentState
    extends State<BillSend_ListBillComponent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => FullBillScreen(
                bill_id: this.widget.bill_id, data: this.widget.data)));

        setState(() {});
      },
      child: Container(
        // height: 500,
        width: double.infinity,
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey)),
        // color: Colors.red,
        child: Column(
          children: [
            BillSendListBill_MiniProfilecomponent(
              bill_id: this.widget.bill_id,
              data: this.widget.data,
              status: this.widget.data.bufferBill[this.widget.bill_id].status,
            ),
            BillSendListBill_ListMenuComponent(
                bill_id: this.widget.bill_id, data: this.widget.data),
          ],
        ),
        // child: ,
      ),
    );
  }
}
