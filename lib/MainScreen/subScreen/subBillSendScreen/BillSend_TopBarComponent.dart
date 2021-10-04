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
        icon: Icon(Icons.arrow_back_ios_new ,color: Colors.white,));

    Widget TitleBar = Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(top: 20 ,left: 1,right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),),
      child: Text("สินค้าที่ต้องจัดส่ง" , style: TextStyle(fontFamily: "SukhumvitSet-SemiBold", fontSize: 22 , color: Colors.white),),
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
