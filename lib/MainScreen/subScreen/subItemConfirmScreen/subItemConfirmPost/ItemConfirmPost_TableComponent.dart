import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemConfirmPost_TableComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
    /*  decoration: BoxDecoration(
        border: Border.all(color: Colors.red[100], 
        width : 5.0, style: BorderStyle.solid),), */
      
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
                child: Text("ชื่อ",
            style: TextStyle(color: Color(0xFFFA897B),fontFamily: "SukhumvitSet-Medium", fontSize: 17),),
              )),
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: Text("จำนวน",
            style: TextStyle(color: Color(0xFFFA897B),fontFamily: "SukhumvitSet-Medium", fontSize: 17),),
          )),
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: Text("จองแล้ว",
            style: TextStyle(color: Color(0xFFFA897B),fontFamily: "SukhumvitSet-Medium", fontSize: 17),),
          )),
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: Text("ราคา",
            style: TextStyle(color: Color(0xFFFA897B),fontFamily: "SukhumvitSet-Medium", fontSize: 17 ),),
          )),
        ],
      ),
      
    );
  }
}
