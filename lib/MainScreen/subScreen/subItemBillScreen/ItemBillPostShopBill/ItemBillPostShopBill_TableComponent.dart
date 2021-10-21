import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemBillPostShopBill_TableComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    TextStyle style = TextStyle(
        color: Color(0xFFFA897B), fontWeight: FontWeight.bold, fontSize: 16.0);
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Container(
              width: weight_screen * 0.6,
              child: Text(
                "รายการสินค้า",
                style: style,
              )),
          Container(
            width: weight_screen * 0.3,
            alignment: Alignment.center,
            child: Text("จำนวน", style: style),
          ),
        ],
      ),
    );
  }
}
