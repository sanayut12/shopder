import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FullItemConfirmPost_TableComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;

    TextStyle style = TextStyle(fontSize: weight_screen * 0.03);
    return Container(
      // color: Colors.red,
      width: double.infinity,
      padding: EdgeInsets.only(
          left: weight_screen * 0.025, right: weight_screen * 0.025),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.1,
          ),
          Container(
            width: weight_screen * 0.4,
            alignment: Alignment.centerLeft,
            child: Text("รายการสินค้า", style: style),
          ),
          Container(
            width: weight_screen * 0.15,
            alignment: Alignment.center,
            child: Text("จำนวน", style: style),
          ),
          Container(
            width: weight_screen * 0.15,
            alignment: Alignment.center,
            child: Text("จองแล้ว", style: style),
          ),
          Container(
            alignment: Alignment.center,
            width: weight_screen * 0.15,
            child: Text("ราคา", style: style),
          ),
        ],
      ),
    );
  }
}
