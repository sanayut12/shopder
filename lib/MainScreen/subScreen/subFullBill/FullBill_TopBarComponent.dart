import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FullBill_TopBarComponent extends StatefulWidget {
  @override
  _FullBill_TopBarComponentState createState() =>
      _FullBill_TopBarComponentState();
}

class _FullBill_TopBarComponentState extends State<FullBill_TopBarComponent> {
  @override
  Widget build(BuildContext context) {
    Widget BackButton = IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.arrow_back_ios_new));

    Widget TitleBar = Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(right: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), ),
      child: Text("รายละเอียดการสั่งซื้อ" , style: TextStyle(fontFamily: "SukhumvitSet-SemiBold",fontSize:20 ),),
    );
    return Container(
      height: MediaQuery.of(context).size.width * 0.15,
      width: double.infinity,
      // color: Colors.red,
      child: Row(
        children: [BackButton, Expanded(child: TitleBar)],
      ),
    );
  }
}
