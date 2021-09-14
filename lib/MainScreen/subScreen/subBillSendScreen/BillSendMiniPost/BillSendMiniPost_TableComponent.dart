import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BillSendMiniPost_TableComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontWeight: FontWeight.bold);
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                  child: Text(
                "รายการสินค้า",
                style: style,
              ))),
          Expanded(
              child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "จำนวน",
                    style: style,
                  ))),
        ],
      ),
    );
  }
}
