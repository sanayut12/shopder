import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Drawer_OptionComponent extends StatefulWidget {
  @override
  _Drawer_OptionComponentState createState() => _Drawer_OptionComponentState();
}

class _Drawer_OptionComponentState extends State<Drawer_OptionComponent> {
  @override
  Widget build(BuildContext context) {
    Widget ButtonModel(String message, Function fun) => GestureDetector(
          child: Container(
            margin: EdgeInsets.only(top: 2, bottom: 3),
            height: MediaQuery.of(context).size.width * 0.1,
            width: MediaQuery.of(context).size.width * 0.5,
            alignment: Alignment.center,
            child: Text("${message}"),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.05)),
          ),
        );

    Widget optionButton(IconData icon, String message, Function fun) =>
        Container(
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: Icon(
                  icon,
                  size: MediaQuery.of(context).size.width * 0.1,
                ),
              ),
              ButtonModel(message, fun)
            ],
          ),
        );
    return Container(
      child: Column(
        children: [
          optionButton(Icons.menu_book, "สินค้าของฉัน", null),
          optionButton(Icons.graphic_eq, "ยอดขายของร้าน", null),
          optionButton(Icons.settings, "การตั้งค่า", null),
        ],
      ),
    );
  }
}
