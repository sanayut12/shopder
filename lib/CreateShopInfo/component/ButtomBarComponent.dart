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
    Widget Button(String text, int active) => Container(
          height: double.infinity,
          width: double.infinity,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: active == 0 ? Colors.white : Colors.red),
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
      child: Button("${this.widget.textbuttom1}", this.widget.active1),
    );
    Widget Buttom2 = GestureDetector(
      onTap: () {
        if (this.widget.active2 != 0) {
          this.widget.func2();
          print("${this.widget.textbuttom2}");
        }
      },
      child: Button("${this.widget.textbuttom2}", this.widget.active2),
    );

    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: double.infinity,
      child: Row(
        children: [Expanded(child: Buttom1), Expanded(child: Buttom2)],
      ),
    );
  }
}
