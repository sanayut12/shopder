import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/profilescreen/MenuProfileScreen.dart';
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShopData.dart';

class MenuPostProfileComponent extends StatefulWidget {
  final PostShopData_inventory postShopData_inventory;
  final PostShopData_menu postShopData_menu;
  MenuPostProfileComponent(
      {@required this.postShopData_inventory,
      @required this.postShopData_menu});
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
    TextStyle styleText = TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white);

    Widget ImageMenu = Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "${HostName()}/image/menuImage/${this.widget.postShopData_menu.path}"))),
      // decoration: ,
    );
    Widget InfoMenu = Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${this.widget.postShopData_menu.name}",
            style: styleText,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("จำนวน ${this.widget.postShopData_inventory.quantity}",
                  style: styleText),
              Text("ราคา ${this.widget.postShopData_inventory.cost} บาท",
                  style: styleText),
            ],
          )
        ],
      ),
    );
    return Container(
      height: MediaQuery.of(context).size.width * 0.60,
      width: MediaQuery.of(context).size.width * 0.8,
      color: Colors.red,
      margin: EdgeInsets.only(right: 10),
      child: Stack(
        children: [
          //ใน children นี้มีปัญหา
          Expanded(
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => MenuProfileScreen(
                              postShopData_inventory:
                                  this.widget.postShopData_inventory,
                              postShopData_menu: this.widget.postShopData_menu,
                            )));
                  },
                  child: ImageMenu)),
          Expanded(child: InfoMenu),
        ],
      ),
      // child: ,
    );
  }
}
