import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FullItemConfirmPost_TableComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.05,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.1,
          ),
          Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                child: Text("ชื่อ"),
              )),
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: Text("จำนวน"),
          )),
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: Text("จองแล้ว"),
          )),
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: Text("ราคา"),
          )),
        ],
      ),
    );
  }
}
