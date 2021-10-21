import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemConfirmPost_TableComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      // color: Colors.amber,
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.1,
          ),
          Container(
            alignment: Alignment.centerLeft,
            width: weight_screen * 0.34,
            // color: Colors.red,
            child: Text(
              "รายการสินค้า",
              style: TextStyle(
                  color: Color(0xFFFA897B),
                  fontFamily: "SukhumvitSet-Medium",
                  fontSize: weight_screen * 0.03),
            ),
          ),
          Container(
            width: weight_screen * 0.15,
            alignment: Alignment.center,
            child: Text(
              "จำนวน",
              style: TextStyle(
                  color: Color(0xFFFA897B),
                  fontFamily: "SukhumvitSet-Medium",
                  fontSize: weight_screen * 0.03),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: weight_screen * 0.15,
            child: Text(
              "จองแล้ว",
              style: TextStyle(
                  color: Color(0xFFFA897B),
                  fontFamily: "SukhumvitSet-Medium",
                  fontSize: weight_screen * 0.03),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: weight_screen * 0.15,
            // color: Colors.red,
            child: Text(
              "ราคา",
              style: TextStyle(
                  color: Color(0xFFFA897B),
                  fontFamily: "SukhumvitSet-Medium",
                  fontSize: weight_screen * 0.03),
            ),
          ),
        ],
      ),
    );
  }
}
