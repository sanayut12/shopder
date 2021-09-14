import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BillSend_TopBarComponent extends StatefulWidget {
  @override
  _BillSend_TopBarComponentState createState() =>
      _BillSend_TopBarComponentState();
}

class _BillSend_TopBarComponentState extends State<BillSend_TopBarComponent> {
  @override
  Widget build(BuildContext context) {
    Widget BackButton = IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.arrow_back_ios_new));

    Widget TitleBar = Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Text("สินค้าที่ต้องจัดส่ง"),
    );
    return Container(
      height: MediaQuery.of(context).size.width * 0.15,
      width: double.infinity,
      color: Colors.red,
      child: Row(
        children: [BackButton, Expanded(child: TitleBar)],
      ),
    );
  }
}
