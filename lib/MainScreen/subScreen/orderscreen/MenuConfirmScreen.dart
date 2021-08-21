import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/orderscreen/userList/MenuCancelUserConponent.dart';
import 'package:shopder/MainScreen/subScreen/orderscreen/userList/MenuConfirmUserComponent.dart';
import 'package:shopder/MainScreen/subScreen/orderscreen/userList/MenuWaitUserComponent.dart';
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/dataManagement/dataOrderPost.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetOrderInventory.dart';

class MenuConfirmScreen extends StatefulWidget {
  final Menu menu;
  final List<InventoryWait> bufferInventoryWait;
  final List<InventoryConfirm> bufferInventoryConfirm;
  final List<InventoryCancel> bufferInventoryCancel;
  final Map<String, UserInventory> bufferUserInventory;
  MenuConfirmScreen(
      {@required this.menu,
      @required this.bufferInventoryWait,
      @required this.bufferInventoryConfirm,
      @required this.bufferInventoryCancel,
      @required this.bufferUserInventory});
  @override
  _MenuConfirmScreenState createState() => _MenuConfirmScreenState();
}

class _MenuConfirmScreenState extends State<MenuConfirmScreen> {
  int quantity_remain = 0; //จำนวนสินค้าคงเหลือ
  int quantity_wait = 0; //จำนวนสินค้าที่รอจอง
  int quantity_hold = 0; //จำนวนสินค้าที่จองแล้ว
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeQuantity();
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
                  Navigator.of(context).pop(1);
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

    //ส่วน ลิสต์รายการ การ์ดของ ยูสเซอร์ที่ทำการสั่งจองสินค้าและได้ยืนยันสินค้าแล้ว
    Widget ListUser = Container(
      color: Colors.red,
      child: ListView.builder(
          //จำนวนการ์ดทั้งหมด  = จำนวนการ์ดจอง  + จำวนวนการ์ดที่ยืนยันแล้ว
          itemCount: this.widget.bufferInventoryWait.length +
              this.widget.bufferInventoryConfirm.length +
              this.widget.bufferInventoryCancel.length,
          //ส่วนการ เรนเดอร์การ์ด
          itemBuilder: (BuildContext context, int index) {
            //ถ้าจำนวน index น้อยกว่า จำนวนการ์ดที่รอจอง ให้เรนเดอะการ์ดจอง
            print("${this.widget.bufferInventoryCancel.length}");
            if (index < this.widget.bufferInventoryWait.length) {
              //ยังไม่ยืนยัน ออเดอะ
              print("inventory wait ${index}");
              String user_id = this.widget.bufferInventoryWait[index].user_id;
              return MenuWaitUserComponent(
                inventoryWait: this.widget.bufferInventoryWait[index],
                userInventory: this.widget.bufferUserInventory[user_id],
                index: index,
                waitToConfirm: ClickWaitToConfirm,
                waitToCancel: ClickWaitToCancel,
              );
            } else if (this.widget.bufferInventoryConfirm.length > 0 &&
                index >= this.widget.bufferInventoryWait.length &&
                index <
                    (this.widget.bufferInventoryConfirm.length +
                        this.widget.bufferInventoryWait.length)) {
              //ถ้า index มากกว่าหรือเท่ากับ การ์ดจองให้เรนเดอร์การ์ดที่ยืนยันแล้ว
              //ยืนยันออเดอะแล้ว

              int index_between =
                  index - this.widget.bufferInventoryWait.length;
              print("inventory confirm ${index_between}");
              String user_id =
                  this.widget.bufferInventoryConfirm[index_between].user_id;
              return MenuConfirmUserComponent(
                inventoryConfirm:
                    this.widget.bufferInventoryConfirm[index_between],
                userInventory: this.widget.bufferUserInventory[user_id],
                index: index_between,
              );
            } else {
              int index_between = index -
                  (this.widget.bufferInventoryWait.length +
                      this.widget.bufferInventoryConfirm.length);
              // print("inventory cancel ${index_between}");
              String user_id =
                  this.widget.bufferInventoryCancel[index_between].user_id;

              return MenuCancelUserComponent(
                  inventoryCancel:
                      this.widget.bufferInventoryCancel[index_between],
                  userInventory: this.widget.bufferUserInventory[user_id],
                  index: index_between);
              // return Container(
              //   height: 50,
              //   width: double.infinity,
              //   color: Colors.black,
              //   margin: EdgeInsets.only(bottom: 5),
              // );
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

  Future<void> ClickWaitToConfirm(int index) async {
    InventoryWait data_wait = this.widget.bufferInventoryWait[index];
    InventoryConfirm data_confirm = data_wait.changeToInventoryConfirm();
    setState(() {
      this.widget.bufferInventoryWait.removeAt(index);
      this.widget.bufferInventoryConfirm.add(data_confirm);
    });
    changeQuantity();
    // changeQuantity()
  }

  Future<void> ClickWaitToCancel(int index) async {
    InventoryWait data_wait = this.widget.bufferInventoryWait[index];
    InventoryCancel data_cancel = data_wait.changeToInventoryCancel();
    setState(() {
      this.widget.bufferInventoryWait.removeAt(index);
      this.widget.bufferInventoryCancel.add(data_cancel);
    });

    // this.widget.bufferInventoryCancel.forEach((element) {
    //   print("ค่าใน สตอกที่ยกเลิก ${element.quantity}");
    // });
    changeQuantity();
    // changeQuantity()
  }

  //ฟังก์ชั่นไว้ตรวจสอบการเปลี่ยนแปลงของค่า quantity
  Future<void> changeQuantity() {
    quantity_remain = 0; //จำนวนสินค้าคงเหลือ
    quantity_wait = 0; //จำนวนสินค้าที่รอจอง
    quantity_hold = 0;
    setState(() {
      //นับจำนวนคนที่รอจอง
      this.widget.bufferInventoryWait.forEach((value) {
        quantity_wait += value.quantity;
      });
      //นับจำนวนคนที่จอง
      this.widget.bufferInventoryConfirm.forEach((value) {
        quantity_hold += value.quantity;
      });
      //จำนวนคงเหลือจากสตอก
      quantity_remain = this.widget.menu.quantity - quantity_hold;
    });
  }
}
