import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FullItemConfirmPost_TableComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
   //   color: Colors.green,
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.1,
          ),
          Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(top: 10),
                alignment: Alignment.center,
                child: Text(
                  "รายการสินค้า",
                  style: TextStyle(color:Color(0xFFFF6957),fontWeight: FontWeight.bold,fontSize: 15.0)),
                ),
              ),
          Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 10),
            alignment: Alignment.center,
            child: Text("จำนวน",
                style: TextStyle(color:Color(0xFFFF6957),fontWeight: FontWeight.bold,fontSize: 15.0)),
          )),
          Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 10),
            alignment: Alignment.center,
            child: Text("จองแล้ว",
            style: TextStyle(color:Color(0xFFFF6957),fontWeight: FontWeight.bold,fontSize: 15.0)),
                
          )),
          Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 10),
            alignment: Alignment.center,
            child: Text("ราคา",
               style: TextStyle(color:Color(0xFFFF6957),fontWeight: FontWeight.bold,fontSize: 15.0)),
          )),
        ],
      ),
    );
  }
}
