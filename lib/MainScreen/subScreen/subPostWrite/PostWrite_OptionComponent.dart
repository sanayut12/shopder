import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/subPostWrite/subOption/PostWriteOption_DatePickerComponent.dart';
import 'package:shopder/MainScreen/subScreen/subPostWrite/subOption/PostWriteOption_HowSendComponent.dart';
import 'package:shopder/MainScreen/subScreen/subPostWrite/subOption/PostWriteOption_SendCostComponent.dart';
import 'package:shopder/MainScreen/subScreen/subPostWrite/subOption/PostWriteOption_SettingComponent.dart';
import 'package:shopder/function/dataManagement/dateBox.dart';

class PostWrite_OptionComponent extends StatefulWidget {
  int sendCost;
  DateBox dateClose, dateSend;
  String how_send, over_order, confirm_order;
  final Function fun;
  PostWrite_OptionComponent(
      {@required this.sendCost,
      @required this.dateClose,
      @required this.dateSend,
      @required this.how_send,
      @required this.over_order,
      @required this.confirm_order,
      @required this.fun});
  @override
  _PostWrite_OptionComponentState createState() =>
      _PostWrite_OptionComponentState();
}

class _PostWrite_OptionComponentState extends State<PostWrite_OptionComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15,right: 15),
      width: double.infinity,
      child: Column(
        children: [
          PostWriteOption_SendCostComponent(
              sendCost: this.widget.sendCost, fun: SetSendCost),
          PostWriteOption_DatePickerComponent(
              date: this.widget.dateClose,
              title: "วันที่ปิดการขาย",
              fun: SetDateClose),
          PostWriteOption_DatePickerComponent(
              date: this.widget.dateSend,
              title: "วันที่จัดส่ง",
              fun: SetDateSend),
          PostWriteOption_HowSendComponent(
              how_send: this.widget.how_send, callback: SetHowSend),
          PostWriteOption_SettingComponent(
              over_order: this.widget.over_order,
              confirm_order: this.widget.confirm_order,
              callBack: SetSetting)
        ],
      ),
    );
  }

  Future<void> SetSendCost(int sendCost) {
    this.widget.fun(sendCost, null, null, null, null, null);
  }

  Future<void> SetDateClose(DateBox dateClose) {
    this.widget.fun(null, dateClose, null, null, null, null);
  }

  Future<void> SetDateSend(DateBox dateClose) {
    this.widget.fun(null, null, dateClose, null, null, null);
  }

  Future<void> SetHowSend(String how_send) {
    this.widget.fun(null, null, null, how_send, null, null);
  }

  Future<void> SetSetting(String over_order, String confirm_order) {
    this.widget.fun(null, null, null, null, over_order, confirm_order);
  }
}
