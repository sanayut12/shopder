import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/post/menubox.dart';
import 'package:shopder/function/dataManagement/dataPostShop.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';

class PostBoxShop extends StatefulWidget {
  final PostList bufferPostList;
  final ShopInfo bufferShopInfo;
  final Uint8List imageProfile;
  PostBoxShop(
      {@required this.bufferPostList,
      @required this.bufferShopInfo,
      @required this.imageProfile});
  @override
  _PostBoxShopState createState() => _PostBoxShopState();
}

class _PostBoxShopState extends State<PostBoxShop> {
  List<Widget> MenuListWidget = new List<Widget>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("object");
    gggg();
  }

  // @override
  Function gggg() {
    MenuListWidget = [];
    this.widget.bufferPostList.bufferMenuList.forEach((key, value) {
      // print("${value.name} ${value.menu_id}");
      setState(() {
        MenuListWidget.add(MenuBox(
          bufferMenuList: value,
        ));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //ส่วนของ tap show user ใน Post
    Widget UserWidget = Container(
      height: double.infinity,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: MemoryImage(this.widget.imageProfile))),
              )),
          Expanded(
              flex: 5,
              child: Container(
                child: Text("${this.widget.bufferShopInfo.name}"),
              ))
        ],
      ),
    );

    // Text("${this.widget.bufferPostList.detail}"),
    // Text("${this.widget.bufferPostList.bufferMenuList.length}"),
    // Container(),
    // Row()

    Widget PostWidget = Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "${this.widget.bufferPostList.start.hour}:${this.widget.bufferPostList.start.min} ${this.widget.bufferPostList.start.day}-${this.widget.bufferPostList.start.month}-${this.widget.bufferPostList.start.year}"),
                      Text("ค่าจัดส่ง ${this.widget.bufferPostList.sendCost}")
                    ],
                  ))),
          Expanded(
              flex: 6,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                // color: Colors.red,
                child: Text(this.widget.bufferPostList.detail),
              )), // ส่วนนี้ไว้แสดง ร้ายละเอียดของ post
          Expanded(
              flex: 8,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                // color: Colors.blue,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: MenuListWidget,
                ),
              )), // ส่วนนี้ไว้แสดงรายการแาหาร
          Expanded(
              flex: 1,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                // color: Colors.amber,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "วันที่ปิดการขาย ${this.widget.bufferPostList.stop.hour}:${this.widget.bufferPostList.stop.min} ${this.widget.bufferPostList.stop.day}-${this.widget.bufferPostList.stop.month}-${this.widget.bufferPostList.stop.year}",
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      "วันที่จะทำการส่ง ${this.widget.bufferPostList.send.hour}:${this.widget.bufferPostList.send.min} ${this.widget.bufferPostList.send.day}-${this.widget.bufferPostList.send.month}-${this.widget.bufferPostList.send.year}",
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              )),
          Expanded(
              flex: 1,
              child: Container(
                height: double.infinity,
                width: double.infinity,
              )),
        ],
      ),
    );

    return Container(
      margin: EdgeInsets.only(top: 2, bottom: 3),
      padding: EdgeInsets.only(bottom: 2, top: 2, left: 4, right: 4),
      width: double.infinity,
      height: 400,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey),
      child: Column(
        children: [
          Expanded(flex: 1, child: UserWidget),
          Expanded(flex: 8, child: PostWidget),
          Expanded(
              flex: 1,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.yellow,
              ))
        ],
      ),
    );
  }
}
