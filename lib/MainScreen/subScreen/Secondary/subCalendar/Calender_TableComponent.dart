import 'package:flutter/cupertino.dart';

class Calender_TableComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    return Container(
      width: weight_screen * 0.8,
      height: weight_screen * 0.1,
      child: Row(
        children: [
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: Text("อา."),
          )),
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: Text("จ."),
          )),
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: Text("อ."),
          )),
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: Text("พ."),
          )),
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: Text("พฤ."),
          )),
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: Text("ศ."),
          )),
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: Text("ส."),
          )),
        ],
      ),
    );
  }
}
