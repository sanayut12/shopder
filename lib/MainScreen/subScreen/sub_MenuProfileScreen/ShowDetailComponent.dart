import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShopData.dart';

class ShowDetailComponent extends StatefulWidget {
  final PostShopData_inventory postShopData_inventory;
  final PostShopData_menu postShopData_menu;
  ShowDetailComponent(
      {@required this.postShopData_inventory,
      @required this.postShopData_menu});
  @override
  _ShowDetailComponentState createState() => _ShowDetailComponentState();
}

class _ShowDetailComponentState extends State<ShowDetailComponent> {
  Map<String, String> foodtype = {
    "1": "อาหารอีสาน",
    "2": "อาหารหวาน",
    "3": "เครื่องดื่ม",
    "4": "ของทอด"
  };
  @override
  Widget build(BuildContext context) {
    Widget NameMenuComponent = Container(
      height: MediaQuery.of(context).size.height * 0.08,
      width: double.infinity,
      color: Colors.green,
      alignment: Alignment.center,
      child: Text(
        "${this.widget.postShopData_menu.name}",
        style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.04),
      ),
    );

    Widget CostMenuComponent = Container(
      height: MediaQuery.of(context).size.height * 0.05,
      width: double.infinity,
      color: Colors.green,
      alignment: Alignment.center,
      child: Text(
        "ราคา ${this.widget.postShopData_inventory.cost} บาท",
        style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.025),
      ),
    );
    Widget QuantityMenuComponent = Container(
      height: MediaQuery.of(context).size.height * 0.05,
      width: double.infinity,
      color: Colors.green,
      alignment: Alignment.center,
      child: Text(
        "จำนวน ${this.widget.postShopData_inventory.quantity}",
        style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.025),
      ),
    );

    Widget TypeMenuComponent = Container(
      height: MediaQuery.of(context).size.height * 0.05,
      width: double.infinity,
      color: Colors.green,
      alignment: Alignment.center,
      child: Text(
        "ชนิดสินค้า ${foodtype[this.widget.postShopData_menu.type]}",
        style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.025),
      ),
    );
    Widget DetailMenuComponent = Container(
        height: MediaQuery.of(context).size.height * 0.5,
        width: double.infinity,
        color: Colors.green,
        alignment: Alignment.center,
        child: Column(
          children: [
            Text("รายละเอียดสินค้า"),
            this.widget.postShopData_menu.detail == "null"
                ? Text("")
                : Text(
                    "${this.widget.postShopData_menu.detail}",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.025),
                  ),
          ],
        ));

    return Container(
      child: Column(
        children: [
          NameMenuComponent,
          Row(
            children: [
              Expanded(child: QuantityMenuComponent),
              Expanded(child: CostMenuComponent),
            ],
          ),
          TypeMenuComponent,
          DetailMenuComponent
        ],
      ),
    );
  }
}
