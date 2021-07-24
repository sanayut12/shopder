import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/orderscreen/userList/MenuConfirmUserComponent.dart';
import 'package:shopder/MainScreen/subScreen/orderscreen/userList/MenuWaitUserComponent.dart';
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/dataManagement/dataOrderPost.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetOrderInventory.dart';

class MenuConfirmScreen extends StatefulWidget {
  final Menu menu;
  final Map<int, InventoryWait> bufferInventoryWait;
  final Map<int, InventoryConfirm> bufferInventoryConfirm;
  final Map<String, UserInventory> bufferUserInventory;
  MenuConfirmScreen(
      {@required this.menu,
      @required this.bufferInventoryWait,
      @required this.bufferInventoryConfirm,
      @required this.bufferUserInventory});
  @override
  _MenuConfirmScreenState createState() => _MenuConfirmScreenState();
}

class _MenuConfirmScreenState extends State<MenuConfirmScreen> {
  int quantity_remain = 0;
  int quantity_wait = 0;
  int quantity_hold = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    quantity_wait = this.widget.bufferInventoryWait.length;
    quantity_hold = this.widget.bufferInventoryConfirm.length;
    quantity_remain = this.widget.menu.quantity - quantity_hold;
  }

  @override
  Widget build(BuildContext context) {
    Widget TopBar = Container(
      height: 50,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  child: Icon(Icons.backspace),
                ),
              )),
          Expanded(
              flex: 5,
              child: Container(
                height: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  "รายการลูกค้าที่ซื้อ",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ))
        ],
      ),
    );
    Widget NameMenu = Container(
      // height: 40,
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(30)),
      child: Text(
        "${this.widget.menu.name}",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );

    Widget ImageMenu = Container(
      margin: EdgeInsets.only(left: 5, right: 5, bottom: 2, top: 2),
      height: 150,
      width: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "${HostName()}/image/menuImage/${this.widget.menu.path}"))),
    );

    Widget Detail = Container(
      // color: Colors.amber,
      // alignment: Alignment.center,
      padding: EdgeInsets.only(left: 10, top: 10),
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "จำนวน ${this.widget.menu.quantity} \nจองแล้ว ${quantity_hold} \nรอยืนยัน ${quantity_wait} \nคงเหลือ ${quantity_remain}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );

    Widget ListUser = Container(
      color: Colors.red,
      child: ListView.builder(
          itemCount: this.widget.bufferInventoryWait.length +
              this.widget.bufferInventoryConfirm.length,
          itemBuilder: (BuildContext context, int index) {
            if (index < this.widget.bufferInventoryWait.length) {
              //ยังไม่ยืนยัน ออเดอะ
              return MenuWaitUserComponent(
                inventoryWait: this.widget.bufferInventoryWait[index],
                userInventory: this.widget.bufferUserInventory[
                    this.widget.bufferInventoryWait[index].user_id],
              );
            } else {
              //ยืนยันออเดอะแล้ว
              return MenuConfirmUserComponent(
                inventoryConfirm: this.widget.bufferInventoryConfirm[
                    index - this.widget.bufferInventoryWait.length],
                userInventory: this.widget.bufferUserInventory[this
                    .widget
                    .bufferInventoryConfirm[
                        index - this.widget.bufferInventoryWait.length]
                    .user_id],
              );
            }
          }),
    );

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            TopBar,
            NameMenu,
            Row(
              children: [
                ImageMenu,
                Expanded(child: Detail),
              ],
            ),
            Expanded(child: ListUser)
          ],
        ),
      ),
    );
  }
}
