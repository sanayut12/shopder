import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopProfile_BackgroundImageComponent extends StatefulWidget {
  @override
  _ShopProfile_BackgroundImageComponentState createState() =>
      _ShopProfile_BackgroundImageComponentState();
}

class _ShopProfile_BackgroundImageComponentState
    extends State<ShopProfile_BackgroundImageComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.4,
      width: double.infinity,
      color: Colors.grey,
    /*  decoration: BoxDecoration(
        boxShadow:[
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0,3),
          )
        ]),*/
      child:
          IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt)),
          alignment: Alignment.bottomRight,
    );
  }
}
