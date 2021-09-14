import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/subBillSendScreen/BillSend_ListBillComponent.dart';
import 'package:shopder/MainScreen/subScreen/subBillSendScreen/BillSend_MiniPostComponent.dart';
import 'package:shopder/MainScreen/subScreen/subBillSendScreen/BillSend_TopBarComponent.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShopBillData.dart';

class BillSendScreen extends StatefulWidget {
  GetPostShopBillDataResposne data;
  BillSendScreen({@required this.data});
  @override
  _BillSendScreenState createState() => _BillSendScreenState();
}

class _BillSendScreenState extends State<BillSendScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("==========${this.widget.data.bufferBill.length}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            BillSend_TopBarComponent(),
            Expanded(
              child: ListView.builder(
                  itemCount: this.widget.data.bufferBill.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    List<String> buffer_bill_id =
                        this.widget.data.bufferBill.keys.toList();
                    if (index == 0) {
                      return BillSend_PostBoxComponent(data: this.widget.data);
                    } else {
                      return BillSend_ListBillComponent(
                          bill_id: buffer_bill_id[index - 1],
                          data: this.widget.data);
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
