import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/dataManagement/dataOrderPost.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetOrderAndUser.dart';

class BillMenuComponent extends StatefulWidget {
  final Menu menu;
  final String item_id;
  final InventoryBill inventory;

  BillMenuComponent(
      {@required this.menu, @required this.item_id, @required this.inventory});

  @override
  _BillMenuComponentState createState() => _BillMenuComponentState();
}

class _BillMenuComponentState extends State<BillMenuComponent> {
  @override
  Widget build(BuildContext context) {
    Widget ImageMenu = Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "${HostName()}/image/menuImage/${this.widget.menu.path}"))),
    );

    Widget NameMenu = Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      child: Text("${this.widget.menu.name}"),
    );
    Widget MenuProComponent = Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.green,
      child: Row(
        children: [Expanded(child: ImageMenu), Expanded(child: NameMenu)],
      ),
    );
    Widget QuantityComponent = Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.grey,
      alignment: Alignment.center,
      child: Text("${this.widget.inventory.quantity}"),
    );
    Widget UnitComponent = Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text("${this.widget.menu.cost}"),
    );
    Widget TotalComponent = Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.brown,
      alignment: Alignment.center,
      child: Text("${this.widget.inventory.quantity * this.widget.menu.cost}"),
    );
    return Container(
      margin: EdgeInsets.only(bottom: 2),
      height: 100,
      width: double.infinity,
      color: Colors.black,
      child: Row(
        children: [
          Expanded(flex: 2, child: MenuProComponent),
          Expanded(child: QuantityComponent),
          Expanded(child: UnitComponent),
          Expanded(child: TotalComponent),
        ],
      ),
    );
  }
}
