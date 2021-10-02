import 'dart:convert';
import 'dart:io';

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
    //TextStyle styleText = TextStyle(
      //  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white);
      TextStyle style = TextStyle(fontWeight: FontWeight.bold);

    Widget ImageMenu = Container(
      height: double.infinity,
      width: double.infinity,
      margin: EdgeInsets.only(left: 10),
     // Text("5555555555"),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25), 
        color: Colors.pink, //ข้างในรูป
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
            style : TextStyle( fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white,
            shadows: [Shadow(offset: Offset(2.0,2.0),
              blurRadius: 5.0,
              color: Colors.black.withOpacity(0.6)),])),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
         
              Text("จำนวน ${this.widget.postShopData_inventory.quantity}",
                  style : TextStyle( fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white,
                  shadows: [Shadow(offset: Offset(2.0,2.0),
              blurRadius: 5.0,
              color: Colors.black.withOpacity(0.6)),])),
              Text("ราคา ${this.widget.postShopData_inventory.cost} บาท",
              style : TextStyle( fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white,
              shadows: [Shadow(offset: Offset(2.0,2.0),
              blurRadius: 5.0,
              color: Colors.black.withOpacity(0.6)),]))
            ],
          ) /* border: Border.all(
              color: Colors.grey[300], width: 1.0, style: BorderStyle.solid),*/
        ],
      ),
    );
    return Container(
      color: Colors.green, 
    //  height: 90,
    //  width: 240,
      height: MediaQuery.of(context).size.width * 0.8,
      width: MediaQuery.of(context).size.width * 0.8,
      margin: EdgeInsets.only(right: 5,bottom: 10),
      
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
