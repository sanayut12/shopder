import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtomBarComponent extends StatefulWidget {
  final String textbuttom1, textbuttom2;
  final int active1, active2;
  final Function func1, func2;
  ButtomBarComponent(
      {@required this.textbuttom1,
      @required this.func1,
      @required this.active1,
      @required this.textbuttom2,
      @required this.func2,
      @required this.active2});
  @override
  _ButtomBarComponentState createState() => _ButtomBarComponentState();
}

class _ButtomBarComponentState extends State<ButtomBarComponent> {
  @override
  Widget build(BuildContext context) {
    Widget ButtonA(String text, int active) => Container(
          height: double.infinity,
          width: double.infinity,
          // color: Colors.red,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.grey[300]),
          alignment: Alignment.center,
          child: Text("${text}"),
        );
    Widget ButtonB(String text, int active) => Container(
          height: double.infinity,
          width: double.infinity,
          // color: Colors.red,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xFFFA897B).withOpacity(0.7)),
          alignment: Alignment.center,
          child: Text("${text}"),
        );
    Widget Buttom1 = GestureDetector(
      onTap: () {
        if (this.widget.active1 != 0) {
          this.widget.func1();
          print("${this.widget.textbuttom1}");
        }
      },
      child: ButtonA("${this.widget.textbuttom1}", this.widget.active1),
    );
    Widget Buttom2 = GestureDetector(
      onTap: () {
        if (this.widget.active2 != 0) {
          this.widget.func2();
          print("${this.widget.textbuttom2}");
        }
      },
      child: ButtonB("${this.widget.textbuttom2}", this.widget.active2),
    );

    return Container(
      height: MediaQuery.of(context).size.height * 0.09,
      width: 400,
      child: Row(
        children: [
          Expanded(child: Buttom1), //
          Expanded(
              child: SizedBox(
            width: 5,
          )),
          Expanded(child: Buttom2)
        ],
      ),
    );
  }
}
