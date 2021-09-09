import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FullItemConfirmPostListBill_ButtomWaitComponent extends StatefulWidget {
  final Function fun1, fun2;
  FullItemConfirmPostListBill_ButtomWaitComponent(
      {@required this.fun1, @required this.fun2});
  @override
  _FullItemConfirmPostListBill_ButtomWaitComponentState createState() =>
      _FullItemConfirmPostListBill_ButtomWaitComponentState();
}

class _FullItemConfirmPostListBill_ButtomWaitComponentState
    extends State<FullItemConfirmPostListBill_ButtomWaitComponent> {
  @override
  Widget build(BuildContext context) {
    Widget ButtonConfirm = GestureDetector(
      onTap: () {
        this.widget.fun1();
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.red),
        child: Text("ยืนยัน"),
      ),
    );
    Widget ButtonCancel = GestureDetector(
      onTap: () {
        this.widget.fun2();
      },
      child: Container(
        margin: EdgeInsets.all(2),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.red),
        child: Text("ยกเลิก"),
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
