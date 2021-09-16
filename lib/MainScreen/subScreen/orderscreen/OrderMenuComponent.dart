import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/orderscreen/MenuConfirmScreen.dart';
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/dataManagement/dataOrderPost.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetOrderInventory.dart';
import 'package:shopder/function/http/httpGetOrderInventory.dart';

class OrderMenuScreenComponent extends StatefulWidget {
  final Menu menu;
  OrderMenuScreenComponent({@required this.menu});
  @override
  _OrderMenuScreenComponentState createState() =>
      _OrderMenuScreenComponentState();
}

class _OrderMenuScreenComponentState extends State<OrderMenuScreenComponent> {
  int quantity = 0;
  int quantity_hold = 0;
  int quantity_wait = 0;
  int quantity_remain = 0;

  bool clickcheck = false;

  var bufferInventoryWait = <InventoryWait>[];
  var bufferInventoryConfirm = <InventoryConfirm>[];
  var bufferInventoryCancel = <InventoryCancel>[];
  Map<String, UserInventory> bufferUserInventory = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      quantity = this.widget.menu.quantity;
      quantity_remain = quantity - quantity_hold;
    });
    GetOrderInventory_local();
  }

  @override
  Widget build(BuildContext context) {
    Widget imageMenu = Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "${HostName()}/image/menuImage/${this.widget.menu.path}"))),
    );

    Widget Quantity = Container(
      alignment: Alignment.center,
      child: Text("${quantity}"),
    );
    Widget QuantityHold = Container(
      alignment: Alignment.center,
      child: Text("${quantity_hold}"),
    );
    Widget QuantityWait = Container(
      alignment: Alignment.center,
      child: Text("${quantity_wait}"),
    );
    Widget QuantityRemain = Container(
      alignment: Alignment.center,
      child: Text("${quantity_remain}"),
    );

    return GestureDetector(
      onTapDown: (e) {
        setState(() {
          clickcheck = true;
        });
      },
      onTapUp: (e) {
        setState(() {
          clickcheck = false;
        });
      },
      onTap: () {
        print("tap ");
        GotoMenuConfirmScreen();
      },
      child: Container(
        height: 100,
        width: double.infinity,
        color: clickcheck ? Colors.red[100] : Colors.white,
        child: Row(
          children: [
            imageMenu,
            Expanded(child: Quantity),
            Expanded(child: QuantityHold),
            Expanded(child: QuantityWait),
            Expanded(child: QuantityRemain),
          ],
        ),
      ),
    );
  }

  void GotoMenuConfirmScreen() async {
    await Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => MenuConfirmScreen(
              menu: this.widget.menu,
              bufferInventoryWait: bufferInventoryWait,
              bufferInventoryConfirm: bufferInventoryConfirm,
              bufferInventoryCancel: bufferInventoryCancel,
              bufferUserInventory: bufferUserInventory,
            )));

    onChangeQuantity();
  }

  void GetOrderInventory_local() async {
    String inventory_id = this.widget.menu.inventory_id;
    GetOrderInventoryRequest bufferGetOrderInventoryRequest =
        GetOrderInventoryRequest(inventory_id: inventory_id);
    GetOrderInventoryResponse bufferGetOrderInventoryResponse =
        await HttpGetOrderInventory(
            bufferGetOrderInventoryRequest: bufferGetOrderInventoryRequest);

    bufferInventoryCancel =
        bufferGetOrderInventoryResponse.bufferInventoryCancel;
    setState(() {
      bufferInventoryWait = bufferGetOrderInventoryResponse.bufferInventoryWait;
      bufferInventoryConfirm =
          bufferGetOrderInventoryResponse.bufferInventoryConfirm;
      bufferUserInventory = bufferGetOrderInventoryResponse.bufferUserInventory;
    });
    onChangeQuantity();
  }

////////////////////ฟังก์ชันสำหรับ rerender ค่าของ quantity ทั้งหมด   ////////ต้องเรียกใช้เมื่อมีการเพิ่มลงค่าใน bufferinventory ทั้งหมด
  void onChangeQuantity() {
    quantity_hold = 0;
    quantity_wait = 0;
    quantity_remain = 0;
    setState(() {
      bufferInventoryWait.forEach((value) {
        quantity_wait += value.quantity;
      });
      bufferInventoryConfirm.forEach((value) {
        quantity_hold += value.quantity;
      });
      quantity_remain = quantity - quantity_hold;
    });
  }
}
