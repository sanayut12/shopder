import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemBillPostShopBill_TableComponent extends StatelessWidget {
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
                margin: EdgeInsets.only(left: 20),
                  child: Text(
                "รายการสินค้า",
                
                style: TextStyle(color: Color(0xFFFA897B),fontWeight: FontWeight.bold,fontSize: 16.0),
               
                
              )
              )),
          Expanded(
              child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "จำนวน",
                    style: TextStyle(color: Color(0xFFFA897B),fontWeight: FontWeight.bold,fontSize: 16.0)),
                  )),
        ],
      ),
    );
  }
}
