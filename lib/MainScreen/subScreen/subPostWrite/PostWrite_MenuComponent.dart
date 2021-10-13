import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/function/dataManagement/dataWriteFoodPost.dart';

class PostWrite_MenuComponent extends StatefulWidget {
  ItemFoodInfo item;
  PostWrite_MenuComponent({@required this.item});
  @override
  _PostWrite_MenuComponentState createState() =>
      _PostWrite_MenuComponentState();
}

class _PostWrite_MenuComponentState extends State<PostWrite_MenuComponent> {
  @override
  Widget build(BuildContext context) {
    ///////ส่วนของการประมวลผล//////////////////

    Uint8List image = this.widget.item.listImage[0];
    String name = this.widget.item.name;
    int quantity = this.widget.item.quantity;
    int cost = this.widget.item.cost;

    /////////////////ส่วนแสดงผลไปยังหน้าจอ//////////////////
    Widget Image = Container(
      margin: EdgeInsets.all(10),
      height: 130,
      width: 130,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[200]),
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(fit: BoxFit.cover, image: MemoryImage(image))),
    );

    Widget NameMenu = Container(
      child: Text("${name}"),
    );
    return Container(
      height: 200,
      width: 150,
      margin: EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[300])),
      child: Column(
        children: [
          Image,
          NameMenu,
          Text("จำนวน ${quantity} ชิ้น" ),
          Text("ราคา ${cost} บาท")
        ],
      ),
    );
  }
}
