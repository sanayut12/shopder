import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FullItemConfirmPostListBill_ButtomCancelComponent extends StatefulWidget {
  @override
  _FullItemConfirmPostListBill_ButtomCancelComponentState createState() =>
      _FullItemConfirmPostListBill_ButtomCancelComponentState();
}

class _FullItemConfirmPostListBill_ButtomCancelComponentState
    extends State<FullItemConfirmPostListBill_ButtomCancelComponent> {
  @override
  Widget build(BuildContext context) {
    Widget ButtonConfirm = GestureDetector(
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.red),
        child: Text("ยกเลิกแล้ว"),
      ),
    );
    Widget ButtonCancel = GestureDetector(
      child: Container(
        alignment: Alignment.center,
        // decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(10), color: Colors.red),
        // child: Text("ยกเลิก"),
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
