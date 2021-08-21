import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetOrderInventory.dart';

class MenuCancelUserComponent extends StatefulWidget {
  final InventoryCancel inventoryCancel;
  final UserInventory userInventory;
  final int index;
  MenuCancelUserComponent(
      {@required this.inventoryCancel,
      @required this.userInventory,
      @required this.index});
  @override
  _MenuCancelUserComponentState createState() =>
      _MenuCancelUserComponentState();
}

class _MenuCancelUserComponentState extends State<MenuCancelUserComponent> {
  @override
  Widget build(BuildContext context) {
    Widget UserName = Container(
      margin: EdgeInsets.only(left: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${this.widget.userInventory.name}",
            style: TextStyle(fontSize: 20),
          ),
          Text("${this.widget.inventoryCancel.date_time.ToString()}",
              style: TextStyle(fontSize: 8))
        ],
      ),
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

    Widget QuantityHole = Container(
      child: Text(
        "${this.widget.inventoryCancel.quantity}",
        style: TextStyle(fontSize: 20),
      ),
    );

    Widget ButtonOption = Container(
      // color: Colors.amber,
      padding: EdgeInsets.all(2),
      child: Row(
        children: [
          Expanded(
            child: Container(
              // color: Colors.blue,
              margin: EdgeInsets.only(right: 2),
              alignment: Alignment.center,
              child: Text(
                "ยกเลิกแล้ว",
                style: TextStyle(color: Colors.red),
              ),
            ),
          )
        ],
      ),
    );
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.all(5),
      color: Colors.grey[100],
      padding: EdgeInsets.all(2),
      child: Row(
        children: [
          UserImage,
          Expanded(flex: 4, child: UserName),
          Expanded(child: QuantityHole),
          Expanded(flex: 4, child: ButtonOption)
        ],
      ),
    );
  }
}
