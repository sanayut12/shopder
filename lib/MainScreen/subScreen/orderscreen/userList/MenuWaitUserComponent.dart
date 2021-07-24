import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetOrderInventory.dart';

class MenuWaitUserComponent extends StatefulWidget {
  final InventoryWait inventoryWait;
  final UserInventory userInventory;
  MenuWaitUserComponent(
      {@required this.inventoryWait, @required this.userInventory});
  @override
  _MenuWaitUserComponentState createState() => _MenuWaitUserComponentState();
}

class _MenuWaitUserComponentState extends State<MenuWaitUserComponent> {
  @override
  Widget build(BuildContext context) {
    Widget UserName = Container(
      child: Text("${this.widget.userInventory.name}"),
    );
    Widget UserImage = Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: this.widget.userInventory.image == null
                  ? NetworkImage(
                      "https://cdn.pixabay.com/photo/2019/10/16/09/09/doraemon-4553920_1280.png")
                  : NetworkImage("${HostName()}/"))),
    );
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.all(5),
      color: Colors.yellow,
      child: Row(
        children: [UserImage, UserName],
      ),
    );
  }
}
