import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectCancelItem.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectConfirmItem.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetOrderInventory.dart';
import 'package:shopder/function/http/httpCancelItem.dart';
import 'package:shopder/function/http/httpConfirmItem.dart';

class MenuWaitUserComponent extends StatefulWidget {
  final InventoryWait inventoryWait;
  final UserInventory userInventory;
  final int index;
  final Function waitToConfirm;
  final Function waitToCancel;
  MenuWaitUserComponent(
      {@required this.inventoryWait,
      @required this.userInventory,
      @required this.index,
      @required this.waitToConfirm,
      @required this.waitToCancel});
  @override
  _MenuWaitUserComponentState createState() => _MenuWaitUserComponentState();
}

class _MenuWaitUserComponentState extends State<MenuWaitUserComponent> {
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
          Text("${this.widget.inventoryWait.date_time.ToString()}",
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
        "${this.widget.inventoryWait.quantity}",
        style: TextStyle(fontSize: 20),
      ),
    );

    Widget ButtonOption = Container(
      // color: Colors.amber,
      padding: EdgeInsets.all(2),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                // print("wait to cancel");
                // this.widget.waitToCancel(this.widget.index);
                ClickCancelItem();
              },
              child: Container(
                // color: Colors.blue,
                margin: EdgeInsets.only(right: 2),
                alignment: Alignment.center,
                child: Text("ยกเลิก"),
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                ClickConfirmItem();

                // print("${}");q
              },
              child: Container(
                margin: EdgeInsets.only(left: 3),
                alignment: Alignment.center,
                child: Text("ยืนยัน"),
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(5)),
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
      color: Colors.yellow,
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

  void ClickConfirmItem() async {
    String item_id = this.widget.inventoryWait.item_id;
    ConfirmItemRequest bufferConfirmItemRequest =
        ConfirmItemRequest(item_id: item_id);
    ConfirmItemResponse bufferConfirmItemResponse = await HttpConfirmItem(
        bufferConfirmItemRequest: bufferConfirmItemRequest);
    if (bufferConfirmItemResponse.code == "20200") {
      this.widget.waitToConfirm(this.widget.index);
    } else if (bufferConfirmItemResponse.code == "20201") {
      //pass
    }
    // print("clickConfirmItem : ${bufferConfirmItemResponse.code}");
  }

  void ClickCancelItem() async {
    String item_id = this.widget.inventoryWait.item_id;
    CancelItemRequest bufferCancelItemRequest =
        CancelItemRequest(item_id: item_id);
    CancelItemResponse bufferCancelItemResponse =
        await HttpCancelItem(bufferCancelItemRequest: bufferCancelItemRequest);
    if (bufferCancelItemResponse.code == "20200") {
      this.widget.waitToCancel(this.widget.index);
    } else if (bufferCancelItemResponse.code == "20201") {
      //pass
    }
  }
}
