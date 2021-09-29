import 'package:flutter/cupertino.dart';

class FullBillListMenu_statusComponent extends StatelessWidget {
  int total, sendCost;
  FullBillListMenu_statusComponent(
      {@required this.sendCost, @required this.total});
  @override
  Widget build(BuildContext context) {
    Widget ShowServiceCost = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text("ค่าบริการ"), Text("3 บาท")],
      ),
    );
    Widget ShowSendCost = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text("ค่าจัดส่ง"), Text("${this.sendCost} บาท" )],
      ),
    );
    Widget ShowFreeCost = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text("ส่วนลด"), Text("0  บาท")],
      ),
    );
    Widget ShowTotal = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text("รวม"), Text("${this.total}  บาท")],
      ),
    );
    return Container(
      child: Column(
        children: [
          ShowServiceCost,
          ShowSendCost,
          ShowFreeCost,
          ShowTotal,
        ],
      ),
    );
  }
}
