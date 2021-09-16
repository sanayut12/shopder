import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopProfile_BackComponent extends StatefulWidget {
  @override
  _ShopProfile_BackComponentState createState() =>
      _ShopProfile_BackComponentState();
}

class _ShopProfile_BackComponentState extends State<ShopProfile_BackComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      width: double.infinity,
      child: IconButton(
          onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new_outlined)),
    );
  }
}
