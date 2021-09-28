import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FullItemConfirmPost_TableComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      color: Colors.green,
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.1,
          ),
          Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "ชื่อ",
                  style: TextStyle(
                      fontSize: 15, fontFamily: "SukhumvitSet-Medium"),
                ),
              )),
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: Text("จำนวน",
                style:
                    TextStyle(fontSize: 15, fontFamily: "SukhumvitSet-Medium")),
          )),
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: Text("จองแล้ว",
                style:
                    TextStyle(fontSize: 15, fontFamily: "SukhumvitSet-Medium")),
          )),
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: Text("ราคา",
                style:
                    TextStyle(fontSize: 25, fontFamily: "SukhumvitSet-Medium")),
          )),
        ],
      ),
    );
  }
}
