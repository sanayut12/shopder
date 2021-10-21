import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/Secondary/sebFullItemConfirmScreen/subFullItemConfirmPostListBill/FullItemConfirmPostListBill_ButtomCancelComponent.dart';
import 'package:shopder/MainScreen/subScreen/Secondary/sebFullItemConfirmScreen/subFullItemConfirmPostListBill/FullItemConfirmPostListBill_ButtomConfirmComponent.dart';
import 'package:shopder/MainScreen/subScreen/Secondary/sebFullItemConfirmScreen/subFullItemConfirmPostListBill/FullItemConfirmPostListBill_ButtomWaitComponent.dart';
import 'package:shopder/MainScreen/subScreen/Secondary/sebFullItemConfirmScreen/subFullItemConfirmPostListBill/FullItemConfirmPostListBill_ShowListMenuComponent.dart';
import 'package:shopder/MainScreen/subScreen/Secondary/sebFullItemConfirmScreen/subFullItemConfirmPostListBill/FullItemConfirmPostListBill_UserMiniProfileComponent.dart';

import 'package:shopder/function/http/ClassObjects/httpGetPostShopItemData.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectCancelBill.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectConfirmBill.dart';
import 'package:shopder/function/http/httpCancelBill.dart';
import 'package:shopder/function/http/httpConfirmBill.dart';

class FullItemConfirmPostListBill_BillComponent extends StatefulWidget {
  final String bill_id;
  final int status;
  final GetPostShopItemDataResposne data;
  final Function SetStatus;
  FullItemConfirmPostListBill_BillComponent(
      {@required this.bill_id,
      @required this.status,
      @required this.data,
      @required this.SetStatus});
  @override
  _FullItemConfirmPostListBill_BillComponentState createState() =>
      _FullItemConfirmPostListBill_BillComponentState();
}

class _FullItemConfirmPostListBill_BillComponentState
    extends State<FullItemConfirmPostListBill_BillComponent> {
  @override
  Widget build(BuildContext context) {
    ///ส่วนของโปรไฟล์ลูกค้าที่ซื้อ
    String user_id = "";
    this.widget.data.bufferItem.forEach((key, value) {
      if (value.bill_id == this.widget.bill_id) {
        user_id = value.user_id;
      }
    });

    ///ส่วนของรายการที่ซื้อ

    return Container(
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: this.widget.status == 0
              ? Colors.grey[200]
              : this.widget.status == 1
                  ? Colors.white
                  : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey)),
      child: Column(
        children: [
          Text("รหัสคำสั่งซื้อ ${this.widget.bill_id}"),
          FullItemConfirmPostListBill_UserMiniProfileComponent(
              user_id: user_id, bufferUsers: this.widget.data.bufferUsers),
          SizedBox(
            height: 25,
          ),
          FullItemConfirmPostListBill_ShowListMenuComponent(
              bill_id: this.widget.bill_id, data: this.widget.data),

          this.widget.status == 0
              ? FullItemConfirmPostListBill_ButtomWaitComponent(
                  fun1: ConfirmBill, fun2: CancelBill)
              : this.widget.status == 1
                  ? FullItemConfirmPostListBill_ButtomConfirmComponent()
                  : FullItemConfirmPostListBill_ButtomCancelComponent(),
          // Text(
          //     "${this.widget.data.bufferBill[this.widget.bill_id].address_user_id}")
        ],
      ),
    );
  }

  Future<void> ConfirmBill() async {
    ConfirmBillRequest bufferConfirmBillRequest =
        ConfirmBillRequest(bill_id: this.widget.bill_id);
    ConfirmBillResponse bufferConfirmBillResponse = await HttpConfirmBill(
        bufferConfirmBillRequest: bufferConfirmBillRequest);

    if (bufferConfirmBillResponse.code == "20200") {
      this.widget.SetStatus(this.widget.bill_id, "1");
    }
  }

  Future<void> CancelBill() async {
    CancelBillRequest bufferCancelBillRequest =
        CancelBillRequest(bill_id: this.widget.bill_id);
    CancelBillResponse bufferCancelBillResponse =
        await HttpCancelBill(bufferCancelBillRequest: bufferCancelBillRequest);
    if (bufferCancelBillResponse.code == "20200") {
      this.widget.SetStatus(this.widget.bill_id, "9");
    }
  }
}
