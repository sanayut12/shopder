import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/profilescreen/MenuProfileScreen.dart';
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShopData.dart';

class MenuPostProfileComponent extends StatefulWidget {
  String inventory_id;
  GetPostShopDataResponse data;
  MenuPostProfileComponent({@required this.inventory_id, @required this.data});
  @override
  _MenuPostProfileComponentState createState() =>
      _MenuPostProfileComponentState();
}

class _MenuPostProfileComponentState extends State<MenuPostProfileComponent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //ส่วนของการประมวลผล
    String inventory_id = this.widget.inventory_id;
    String menu_id =
        this.widget.data.bufferPostShopData_inventory[inventory_id].menu_id;
    String name = this.widget.data.bufferPostShopData_menu[menu_id].name;
    String image = this.widget.data.bufferPostShopData_menu[menu_id].path;
    int quantity =
        this.widget.data.bufferPostShopData_inventory[inventory_id].quantity;
    int cost = this.widget.data.bufferPostShopData_inventory[inventory_id].cost;
    //ส่วนของการแสดงออกบนหน้าจอ

    TextStyle style = TextStyle(fontWeight: FontWeight.bold);

    Widget ImageMenu = Container(
      height: 130,
      width: 130,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.pink, //ข้างในรูป
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage("${HostName()}/image/menuImage/${image}"))),
      // decoration: ,
    );

    Widget Name = Text("${name}",
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 5.0,
                  color: Colors.black.withOpacity(0.6)),
            ]));
    Widget Quantity = Text("จำนวน ${quantity}",
        style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 5.0,
                  color: Colors.black.withOpacity(0.6)),
            ]));
    Widget Cost = Text("ราคา ${cost} บาท",
        style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 5.0,
                  color: Colors.black.withOpacity(0.6)),
            ]));

    return Container(
      height: 300,
      width: 150,
      margin: EdgeInsets.only(right: 5, left: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[200])),
      child: Column(
        children: [
          ImageMenu,
          Name,
          Quantity,
          Cost,
          ButtonModel(text: "ดู", fun: OpenMenuScreen)
        ],
      ),
    );
  }

  Future<void> OpenMenuScreen() async {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => MenuProfileScreen(
            inventory_id: this.widget.inventory_id, data: this.widget.data)));
  }
}

class ButtonModel extends StatefulWidget {
  String text;
  Function fun;
  ButtonModel({@required this.text, @required this.fun});
  @override
  _ButtonModelState createState() => _ButtonModelState();
}

class _ButtonModelState extends State<ButtonModel> {
  Color color = Color(0xffFA897B);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          setState(() {
            color = Colors.white;
          });
          await Future.delayed(Duration(milliseconds: 50));
          setState(() {
            color = Color(0xffFA897B);
          });
          this.widget.fun();
        },
        child: Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.all(5),
          alignment: Alignment.center,
          decoration: BoxDecoration(color: color),
          child: Text("${this.widget.text}"),
        ));
  }
}
