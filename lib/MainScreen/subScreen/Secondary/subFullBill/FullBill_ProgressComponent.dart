import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectConfirmDone.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectConfirmSended.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectConfirmSending.dart';
import 'package:shopder/function/http/httpConfirmDone.dart';
import 'package:shopder/function/http/httpConfirmSended.dart';
import 'package:shopder/function/http/httpConfirmSending.dart';

class FullBill_ProgressComponent extends StatefulWidget {
  String bill_id;
  String step; //"1" , "2" ,"3" , "4"
  Function SetStatus;
  FullBill_ProgressComponent(
      {@required this.bill_id, @required this.step, @required this.SetStatus});
  @override
  _FullBill_ProgressComponentState createState() =>
      _FullBill_ProgressComponentState();
}

class _FullBill_ProgressComponentState
    extends State<FullBill_ProgressComponent> {
  @override
  Widget build(BuildContext context) {
    Widget TitleLine = Container(
      // color: Colors.red,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text("ทำเสร็จแล้ว"),
          Text("กำลังจัดส่ง"),
          Text("ส่งสำเร็จ"),
        ],
      ),
    );
    Widget LineProgress = Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
              child: Container(
            // color: Colors.red,
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFFA897B)),
                color: this.widget.step == "3" || this.widget.step == "4"
                    ? Color(0xFFFA897B)
                    : Colors.white),

            height: 5,
            width: double.infinity,
          )),
          Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      color: this.widget.step == "4"
                          ? Color(0xFFFA897B)
                          : Colors.white,
                      border: Border.all(color: Color(0xFFFA897B))),
                  height: 5,
                  width: double.infinity)),
        ],
      ),
    );
    Widget Button = Container(
      // alignment: Alignmen,
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.,
        children: [
          GestureDetector(
            onTap: () {
              if (this.widget.step == "1") {
                Done();
                print("ทำเสร็จ1");
              }
              print("ทำเสร็จ2");
            },
            child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: this.widget.step == "2" ||
                            this.widget.step == "3" ||
                            this.widget.step == "4"
                        ? Color(0xFFFA897B)
                        : Colors.white,
                    border: Border.all(color: Color(0xFFFA897B), width: 2)),
                padding: EdgeInsets.all(5),
                alignment: Alignment.center,
                child: this.widget.step == "2" ||
                        this.widget.step == "3" ||
                        this.widget.step == "4"
                    ? Icon(
                        Icons.description_outlined,
                        color: Colors.white,
                      )
                    : Icon(
                        Icons.description_rounded,
                        color: Color(0xFFFA897B),
                      )),
          ),
          GestureDetector(
            onTap: () {
              if (this.widget.step == "2") {
                Sending();
                print("กำลังส่ง1");
              }
              print("กำลังส่ง2");
            },
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: this.widget.step == "3" || this.widget.step == "4"
                      ? Color(0xFFFA897B)
                      : Colors.white,
                  border: Border.all(color: Color(0xFFFA897B), width: 2)),
              padding: EdgeInsets.all(5),
              alignment: Alignment.center,
              child: this.widget.step == "3" || this.widget.step == "4"
                  ? Icon(
                      Icons.local_shipping_outlined,
                      color: Colors.white,
                    )
                  : Icon(
                      Icons.local_shipping_rounded,
                      color: Color(0xFFFA897B),
                    ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (this.widget.step == "3") {
                Sended();
                print("ส่งสำเร็จ1");
              }
              print("ส่งสำเร็จ");
            },
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: this.widget.step == "4"
                      ? Color(0xFFFA897B)
                      : Colors.white,
                  border: Border.all(color: Color(0xFFFA897B), width: 2)),
              padding: EdgeInsets.all(5),
              alignment: Alignment.center,
              child: this.widget.step == "4"
                  ? Icon(
                      Icons.done_outline,
                      color: Colors.white,
                    )
                  : Icon(
                      Icons.done_rounded,
                      color: Color(0xFFFA897B),
                    ),
            ),
          ),
        ],
      ),
    );

    return Container(
      height: MediaQuery.of(context).size.width * 0.2,
      width: MediaQuery.of(context).size.width * 0.6,
      // color: Colors.red,
      // alignment: Alignment.center,
      child: Stack(
        children: [LineProgress, Button, TitleLine],
      ),
    );
  }

  Future<void> Done() async {
    ConfirmDoneRequest bufferConfirmDoneRequest =
        ConfirmDoneRequest(bill_id: this.widget.bill_id);
    ConfirmDoneResponse bufferConfirmDoneResponse = await HttpConfirmDone(
        bufferConfirmDoneRequest: bufferConfirmDoneRequest);
    if (bufferConfirmDoneResponse.code == "20200") {
      this.widget.SetStatus("2");
    }
  }

  Future<void> Sending() async {
    ConfirmSendingRequest bufferConfirmSendingRequest =
        ConfirmSendingRequest(bill_id: this.widget.bill_id);
    ConfirmSendingResponse bufferConfirmSendingResponse =
        await HttpConfirmSending(
            bufferConfirmSendingRequest: bufferConfirmSendingRequest);
    if (bufferConfirmSendingResponse.code == "20200") {
      this.widget.SetStatus("3");
    }
  }

  Future<void> Sended() async {
    ConfirmSendedRequest bufferConfirmSendedRequest =
        ConfirmSendedRequest(bill_id: this.widget.bill_id);
    ConfirmSendedResponse bufferConfirmSendedResponse = await HttpConfirmSended(
        bufferConfirmSendedRequest: bufferConfirmSendedRequest);
    if (bufferConfirmSendedResponse.code == "20200") {
      this.widget.SetStatus("4");
    }
  }
}

//  Icon(Icons.description_outlined),
//                 Icon(Icons.local_shipping_outlined),
//                 Icon(Icons.done_outline),
//                 Icon(Icons.description_rounded),
//                 Icon(Icons.local_shipping_rounded),
//                 Icon(Icons.done_rounded)
