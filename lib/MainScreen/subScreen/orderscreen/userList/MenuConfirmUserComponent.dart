import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetOrderInventory.dart';

class MenuConfirmUserComponent extends StatefulWidget {
  final InventoryConfirm inventoryConfirm;
  final UserInventory userInventory;
  MenuConfirmUserComponent(
      {@required this.inventoryConfirm, @required this.userInventory});
  @override
  _MenuConfirmUserComponentState createState() =>
      _MenuConfirmUserComponentState();
}

class _MenuConfirmUserComponentState extends State<MenuConfirmUserComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.all(5),
      color: Colors.blue,
    );
  }
}
