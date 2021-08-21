import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/billscreen/subbillScreen/UserBillComponent.dart';

import 'package:shopder/function/dataManagement/dataOrderPost.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetBill.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetOrderAndUser.dart';

class ListUserBillScreen extends StatefulWidget {
  final Post post;
  final MenuOrder menuList;
  final List<Bill> bufferBill; //รลิสต์ รายการบิล
  final Map<String, UserBill> bufferUserBill; //<user_id , .....>
  final Map<String, InventoryBill> bufferInventoryBill; //<item_id , ......>

  ListUserBillScreen(
      {@required this.post,
      @required this.menuList,
      @required this.bufferUserBill,
      @required this.bufferBill,
      @required this.bufferInventoryBill});
  @override
  _ListUserBillScreenState createState() => _ListUserBillScreenState();
}

class _ListUserBillScreenState extends State<ListUserBillScreen> {
  @override
  Widget build(BuildContext context) {
    Widget ListBill = ListView.builder(
        itemCount: this.widget.bufferBill.length,
        itemBuilder: (BuildContext context, int index) {
          Bill bill = this.widget.bufferBill[index];
          String user_id = bill.user_id;
          String bill_id = bill.bill_id;
          //แยกขอมูลการสั่งซื้อ ของบิลนี้ ออกจาก ข้อมูลการสั่งซื้อรวม
          Map<String, InventoryBill> _bufferInventoryBill = {};
          //วนลูปเพื่อแยก
          this.widget.bufferInventoryBill.forEach((key, value) {
            if (value.bill_id == bill_id) {
              //
              _bufferInventoryBill[key] = value;
            }
          });

          return UserBillComponent(
            post: this.widget.post,
            bill: bill,
            menuList: this.widget.menuList,
            bufferInventoryBill: _bufferInventoryBill,
            user_id: user_id,
            user: this.widget.bufferUserBill[user_id],
          );
        });
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.amber,
        child: ListBill,
      ),
    );
  }
}
