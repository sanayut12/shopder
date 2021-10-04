import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/subFullBill/FullBillListMenu/FullBillListMenu_MenuComponent.dart';
import 'package:shopder/MainScreen/subScreen/subFullBill/FullBillListMenu/FullBillListMenu_TableComponent.dart';
import 'package:shopder/MainScreen/subScreen/subFullBill/FullBillListMenu/FullBillListMenu_statusComponent.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShopBillData.dart';

class FullBill_ListMenuComponent extends StatefulWidget {
  String bill_id;
  GetPostShopBillDataResposne data;
  FullBill_ListMenuComponent({@required this.bill_id, @required this.data});
  @override
  _FullBill_ListMenuComponentState createState() =>
      _FullBill_ListMenuComponentState();
}

class _FullBill_ListMenuComponentState
    extends State<FullBill_ListMenuComponent> {
  @override
  Widget build(BuildContext context) {
    List<Widget> buffer = [];
    int total = 3;
    int sendCost = this.widget.data.post_info.sendCost;
    this.widget.data.bufferItem.forEach((key, value) {
      if (this.widget.bill_id == value.bill_id) {
        String inventory_id = value.inventory_id;
        int quantity = value.quantity;
        String menu_id = this.widget.data.bufferInventory[inventory_id].menu_id;
        int cost = this.widget.data.bufferInventory[inventory_id].cost;
        total += quantity * cost;
        String name = this.widget.data.bufferMenu[menu_id].name;
        String image = this.widget.data.bufferMenu[menu_id].path;
        buffer.add(FullBillListMenu_MenuComponent(
            name: name, image: image, quantity: quantity, cost: cost));
      }
    });
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[200], width: 2)),
      child: Column(
        children: [
          FullBillListMenu_TableComponent(),
          Container(
            child: Column(
              children: buffer,
            ),
          ),
          FullBillListMenu_statusComponent(sendCost: sendCost, total: total)
        ],
      ),
    );
  }
}
