import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/billscreen/subbillScreen/billScreen/AddressUserComponent.dart';
import 'package:shopder/MainScreen/subScreen/billscreen/subbillScreen/billScreen/billMenuComponent.dart';
import 'package:shopder/function/dataManagement/dataOrderPost.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetAddressUser.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetBill.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetOrderAndUser.dart';
import 'package:shopder/function/http/httpGetAddressUser.dart';

class UserBillScreen extends StatefulWidget {
  final Post post;
  final MenuOrder menuList;
  final Bill bill; //รลิสต์ รายการบิล
  final String user_id;
  final UserBill user; //<user_id , .....>
  final Map<String, InventoryBill> bufferInventoryBill; //<item_id , ......>
  UserBillScreen(
      {@required this.post,
      @required this.menuList,
      @required this.bill,
      @required this.user_id,
      @required this.user,
      @required this.bufferInventoryBill});
  @override
  _UserBillScreenState createState() => _UserBillScreenState();
}

class _UserBillScreenState extends State<UserBillScreen> {
  int total = 0;

  GetAddressUserResponse getAddressUserResponse;
  List<Widget> bufferBillMenuComponent = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    httpGetAddressUser(); //ดึงข้อมูลที่อยู่ของลูกค้ส
    print(this.widget.bill.address_user_id);
    // this.widget.bill.address_user_id
    total += this.widget.post.sendCost;
    bufferBillMenuComponent.add(BarTable());
    this.widget.bufferInventoryBill.forEach((key1, value1) {
      this.widget.menuList.bufferMenu.forEach((key2, value2) {
        if (value2.inventory_id == value1.inventory_id) {
          total += value1.quantity * value2.cost;
          bufferBillMenuComponent.add(BillMenuComponent(
            menu: value2,
            item_id: key1,
            inventory: value1,
          ));
        }
      });
    });

    bufferBillMenuComponent
        .add(TotalCost(sendCost: this.widget.post.sendCost, total: total));
  }

  @override
  Widget build(BuildContext context) {
    Widget Detail = Container(
      margin: EdgeInsets.all(10),
      height: 250,
      width: double.infinity,
      color: Colors.blue,
      padding: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("รายละเอียดลูกค้า"),
              Container(
                height: 50,
                width: 90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: Colors.red),
                alignment: Alignment.center,
                child: Text("นำทางการส่ง"),
              ),
              Container(
                height: 50,
                width: 90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: Colors.red),
                alignment: Alignment.center,
                child: Text("แชต"),
              )
            ],
          ),
          Text("ชื่อ ${this.widget.user.name}"),
          // Text("....ใส่ที่อยู่......"),
          getAddressUserResponse == null
              ? Text("sssss")
              : AddressUserComponent(
                  getAddressUserResponse: getAddressUserResponse),
          // Text("${this.widget.bill.address_user_id}"),
          Text("\nที่อยู่ผู้ใ้ห้บริการ"),
          Text("....ใส่ที่อยู่......(เดียวใส่ที่หลัง)")
        ],
      ),
    );

    Widget Order = Container(
      // height: 500,
      width: double.infinity,
      color: Colors.amber,
      child: Column(
        children: bufferBillMenuComponent,
      ),
    );

    Widget DateDetail = Container(
      height: 100,
      width: double.infinity,
      color: Colors.cyan,
      child: Column(
        children: [
          Text("วันที่สั่งซื้อ ${this.widget.post.start.ToString()}"),
          Text("วันที่จัดส่ง ${this.widget.post.send.ToString()}"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("การจัดส่ง "),
              Text(
                "ยังไม่สำเร็จ",
                style: TextStyle(color: Colors.red),
              )
            ],
          )
        ],
      ),
    );
    Widget FromBox = Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.redAccent[100],
        child: ListView(
          children: [
            Detail,
            Center(
              child: Column(
                children: [
                  Text("เลขที่คำสั่งซื่อ "),
                  Text("${this.widget.bill.bill_id}")
                ],
              ),
            ),
            Order,
            DateDetail,
            Container(
              height: 100,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 1),
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue),
              child: Text(
                "จัดส่งแล้ว",
                style: TextStyle(fontSize: 30),
              ),
            )
          ],
        ));
    return Scaffold(
      appBar: AppBar(),
      body: FromBox,
    );
  }

  void httpGetAddressUser() async {
    String address_user_id = this.widget.bill.address_user_id;
    GetAddressUserRequest bufferGetAddressUserRequest =
        GetAddressUserRequest(address_user_id: address_user_id);
    GetAddressUserResponse _getAddressUserResponse = await HttpGetAddressUser(
        bufferGetAddressUserRequest: bufferGetAddressUserRequest);
    setState(() {
      getAddressUserResponse = _getAddressUserResponse;
    });

    print("${_getAddressUserResponse.address}");
    print("${getAddressUserResponse.address}");
  }
}

class BarTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
                child: Text("รายการสินค้า"),
              )),
          Expanded(
              child: Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text("จำนวน"),
          )),
          Expanded(
              child: Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text("ราคา/หน่วย"),
          )),
          Expanded(
              child: Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text("จำนวนเงิน"),
          ))
        ],
      ),
    );
  }
}

class TotalCost extends StatelessWidget {
  final int sendCost;
  final int total;
  TotalCost({@required this.sendCost, @required this.total});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      padding: EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text("ค่าจัดส่ง ${sendCost} บาท"),
          Text("รวมทั้งสิ้น ${total} บาท")
        ],
      ),
    );
  }
}
