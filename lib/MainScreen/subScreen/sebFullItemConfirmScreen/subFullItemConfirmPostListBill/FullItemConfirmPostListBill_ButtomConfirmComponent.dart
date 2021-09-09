import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FullItemConfirmPostListBill_ButtomConfirmComponent
    extends StatefulWidget {
  @override
  _FullItemConfirmPostListBill_ButtomConfirmComponentState createState() =>
      _FullItemConfirmPostListBill_ButtomConfirmComponentState();
}

class _FullItemConfirmPostListBill_ButtomConfirmComponentState
    extends State<FullItemConfirmPostListBill_ButtomConfirmComponent> {
  @override
  Widget build(BuildContext context) {
    Widget ButtonConfirm = GestureDetector(
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.red),
        child: Text("ยืนยันแล้ว"),
      ),
    );
    Widget ButtonCancel = GestureDetector(
      child: Container(
        alignment: Alignment.center,
        // decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(10), color: Colors.red),
        // child: Text("ยกเลิก"),
        // margin: EdgeInsets.all(2),
      ),
    );

    return Container(
      height: MediaQuery.of(context).size.width * 0.1,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(child: ButtonCancel),
          Expanded(child: ButtonConfirm)
        ],
      ),
    );
  }
}
