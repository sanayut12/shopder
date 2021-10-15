import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/subFullBill/FullBill_ListMenuComponent.dart';
import 'package:shopder/MainScreen/subScreen/subFullBill/FullBill_ProgressComponent.dart';
import 'package:shopder/MainScreen/subScreen/subFullBill/FullBill_TopBarComponent.dart';
import 'package:shopder/MainScreen/subScreen/subFullBill/FullBill_detailComponent.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShopBillData.dart';

class FullBillScreen extends StatefulWidget {
  String bill_id;
  GetPostShopBillDataResposne data;
  FullBillScreen({@required this.bill_id, @required this.data});
  @override
  _FullBillScreenState createState() => _FullBillScreenState();
}

class _FullBillScreenState extends State<FullBillScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("=============fullbillscreen======");
    print(this.widget.data.bufferBill[this.widget.bill_id].status);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: AssetImage("assets/image/background/bill2.png"),
            ),
            gradient: LinearGradient(
              colors: [Color(0xFFFA897B), Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                0.0,
                1.0,
              ],
            ),
          ),
          child: Column(
            children: [
              FullBill_TopBarComponent(),
              Expanded(
                child: ListView(
                  children: [
                    Column(
                      children: [
                        FullBill_ProgressComponent(
                          bill_id: this.widget.bill_id,
                          step: this
                              .widget
                              .data
                              .bufferBill[this.widget.bill_id]
                              .status,
                          SetStatus: SetStatus,
                        ),
                      ],
                    ),
                    FullBill_detailComponent(
                        bill_id: this.widget.bill_id, data: this.widget.data),
                    FullBill_ListMenuComponent(
                        bill_id: this.widget.bill_id, data: this.widget.data),
                    // Icon(Icons.description_outlined),
                    // Icon(Icons.local_shipping_outlined),
                    // Icon(Icons.done_outline),
                    // Icon(Icons.description_rounded),
                    // Icon(Icons.local_shipping_rounded),
                    // Icon(Icons.done_rounded)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> SetStatus(String status) async {
    setState(() {
      this.widget.data.bufferBill[this.widget.bill_id].status = "${status}";
    });
  }
}
