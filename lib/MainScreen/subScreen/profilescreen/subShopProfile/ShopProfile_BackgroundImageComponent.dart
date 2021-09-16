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
      height: MediaQuery.of(context).size.width * 0.5,
      width: double.infinity,
      color: Colors.grey,
      child:
          IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt)),
          alignment: Alignment.bottomRight,
    );
  }
}
