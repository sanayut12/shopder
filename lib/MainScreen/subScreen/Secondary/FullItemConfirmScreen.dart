import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/Secondary/sebFullItemConfirmScreen/FullItemConfirmPostListBill_BillComponent.dart';
import 'package:shopder/MainScreen/subScreen/Secondary/sebFullItemConfirmScreen/FullItemConfirmPost_AppBarComponent.dart';
import 'package:shopder/MainScreen/subScreen/Secondary/sebFullItemConfirmScreen/FullItemConfirmPost_ListMenuComponent2.dart';
import 'package:shopder/MainScreen/subScreen/Secondary/sebFullItemConfirmScreen/FullItemConfirmPost_TableComponent.dart';
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

    Widget ShowDetail = Container(
      width: double.infinity,
      child: Column(
        children: [
          FullItemConfirmPost_TableComponent(),
          FullItemConfirmPost_ListMenuComponent2(data: this.widget.data)
        ],
      ),
    );
    buffer.insert(0, ShowDetail);
    buffer.add(SizedBox(
      height: 150,
    ));
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color(0xFFFFC9C3),
        child: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFFC9C3), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [
                  0.0,
                  0.3,
                ],
              ),
            ),
            child: Column(
              children: [
                FullItemConfirmPost_AppBarComponent(),
                Expanded(
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: ListView(
                      children: buffer,
                    ),
                  ),
                )
              ],
            ),
          ),
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
