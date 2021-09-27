import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/sebFullItemConfirmScreen/FullItemConfirmPost_ListBillComponent.dart';
import 'package:shopder/MainScreen/subScreen/sebFullItemConfirmScreen/FullItemConfirmPost_ListMenuComponent.dart';
import 'package:shopder/MainScreen/subScreen/sebFullItemConfirmScreen/FullItemConfirmPost_TableComponent.dart';
import 'package:shopder/MainScreen/subScreen/sebFullItemConfirmScreen/FullItemConfirmPostListBill_BillComponent.dart';
import 'package:shopder/function/http/ClassObjects/httpGetPostShopItemData.dart';

class FullItemConfirmScreen extends StatefulWidget {
  GetPostShopItemDataResposne data;
  FullItemConfirmScreen({@required this.data});
  @override
  _FullItemConfirmScreenState createState() => _FullItemConfirmScreenState();
}

class _FullItemConfirmScreenState extends State<FullItemConfirmScreen> {
  GetPostShopItemDataResposne data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      data = this.widget.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    ///////////////////////////////แยกข้อมูลบิล//////////////////////////////////////
    List<Widget> buffer = [];
    //บิลที่รอยืนยัน
    this.widget.data.bufferBill.forEach((key, value) {
      if (value.status == "0") {
        buffer.add(FullItemConfirmPostListBill_BillComponent(
          bill_id: key,
          status: 0,
          data: this.widget.data,
          SetStatus: SetStatus,
        ));
      }
    });
    //บิลที่รับแล้ว
    this.widget.data.bufferBill.forEach((key, value) {
      if (value.status == "1" ||
          value.status == "2" ||
          value.status == "3" ||
          value.status == "4") {
        buffer.add(FullItemConfirmPostListBill_BillComponent(
          bill_id: key,
          status: 1,
          data: this.widget.data,
          SetStatus: null,
        ));
        ;
      }
    });
    //บิลที่ยกเลิก
    this.widget.data.bufferBill.forEach((key, value) {
      if (value.status == "9") {
        buffer.add(FullItemConfirmPostListBill_BillComponent(
          bill_id: key,
          status: 2,
          data: this.widget.data,
          SetStatus: null,
        ));
      }
    });

    //////////////////////////////////////////////////
    Widget TitleBar = Container(
      height: MediaQuery.of(context).size.width * 0.2,
      width: double.infinity,
      color: Colors.red,
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back_ios_rounded)),
          Expanded(
              child: Container(
            margin: EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            alignment: Alignment.center,
            child: Text("รับออเดอร์ลูกค้า"),
          ))
        ],
      ),
    );
    Widget ShowDetail = Container(
      color: Colors.red,
      width: double.infinity,
      child: Column(
        children: [
          FullItemConfirmPost_TableComponent(),
          FullItemConfirmPost_ListMenuComponent(data: this.widget.data)
        ],
      ),
    );
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            TitleBar,
            ShowDetail,
            Expanded(
                child: Container(
              color: Colors.pink,
              child: ListView(children: buffer),
            ))
          ],
        ),
      ),
    );
  }

  Future<void> SetStatus(String bill_id, String status) {
    setState(() {
      this.widget.data.bufferBill[bill_id].status = status;
    });

    // this.widget.SetStatus(bill_id, status);
  }
}
