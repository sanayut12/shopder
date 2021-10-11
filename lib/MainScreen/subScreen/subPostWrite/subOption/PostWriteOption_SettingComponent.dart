import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostWriteOption_SettingComponent extends StatefulWidget {
  String over_order, confirm_order;
  final Function callBack;
  PostWriteOption_SettingComponent(
      {@required this.over_order,
      @required this.confirm_order,
      @required this.callBack});
  @override
  _PostWriteOption_SettingComponentState createState() =>
      _PostWriteOption_SettingComponentState();
}

class _PostWriteOption_SettingComponentState
    extends State<PostWriteOption_SettingComponent> {
  int order_less = 1;
  int confirm = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      order_less = int.parse(this.widget.over_order);
      confirm = int.parse(this.widget.confirm_order);
    });
  }

  @override
  Widget build(BuildContext context) {
    /////////////////////////////////เลือกว่าออเดอะสั่งเกินได้ไหม///////////////////////
    Widget RadioOrderLess = Container(
      child: Row(
        children: [
          Radio(
              value: 1,
              groupValue: order_less,
              onChanged: (e) {
                setState(() {
                  order_less = e;
                  if (confirm == 3) {
                    confirm = 1;
                  }
                });
                ReturnCallBack();
              }),
          Text("ไม่เกินจำนวนที่ระบุ")
        ],
      ),
    );

    Widget RadioOrderMore = Container(
      child: Row(
        children: [
          Radio(
              value: 2,
              groupValue: order_less,
              onChanged: (e) {
                setState(() {
                  order_less = e;
                });
                ReturnCallBack();
              }),
          Text("สามารถเกินจำนวนที่ระบุ")
        ],
      ),
    );

    /////////////////////////////เลือการยืนยันออเดอร์//////////////////////////////////
    Widget RadioConfirmAuto = Container(
      child: Row(
        children: [
          Radio(
              value: 1,
              groupValue: confirm,
              onChanged: (e) {
                setState(() {
                  confirm = e;
                });
                ReturnCallBack();
              }),
          Text("ยืนยันอัตโนมัติ")
        ],
      ),
    );
    Widget RadioConfirmMan = Container(
      child: Row(
        children: [
          Radio(
              value: 2,
              groupValue: confirm,
              onChanged: (e) {
                setState(() {
                  confirm = e;
                });
                ReturnCallBack();
              }),
          Text("ยืนยันเอง")
        ],
      ),
    );
    Widget RadioConfirmMoreMan = Container(
      child: Row(
        children: [
          Radio(
              value: 3,
              groupValue: confirm,
              onChanged: (e) {
                setState(() {
                  confirm = e;
                });
                ReturnCallBack();
              }),
          Text("ยืนยันเองเมื่อเกินที่กำหนดเท่านั้น")
        ],
      ),
    );

    Widget FormOrder = Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("การสั่งออเดอะเกิน"), RadioOrderLess, RadioOrderMore],
      ),
    );
    Widget FormConfirm = Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("เลือกวิธีการยืนยันสินค้า"),
          RadioConfirmAuto,
          RadioConfirmMan,
          order_less == 2 ? RadioConfirmMoreMan : Container()
        ],
      ),
    );
    return Container(
      // height: 350,
      width: double.infinity,
      child: Column(
        children: [FormOrder, FormConfirm],
      ),
    );
  }

  Future<void> ReturnCallBack() {
    String _order_less = "";
    String _confirm = "";
    if (order_less == 1) {
      _order_less = "1";
    } else if (order_less == 2) {
      _order_less = "2";
    }

    if (confirm == 1) {
      _confirm = "1";
    } else if (confirm == 2) {
      _confirm = "2";
    } else if (confirm == 3) {
      _confirm = "3";
    }
    this.widget.callBack(_order_less, _confirm);
  }
}
