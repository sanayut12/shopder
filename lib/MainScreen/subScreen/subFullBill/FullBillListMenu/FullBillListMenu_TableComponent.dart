import 'package:flutter/cupertino.dart';

class FullBillListMenu_TableComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget title1 = Container(
      child: Text("รายการสินค้า"),
    );
    Widget title2 = Container(
      alignment: Alignment.center,
      child: Text("จำนวน"),
    );
    Widget title3 = Container(
      alignment: Alignment.center,
      child: Text("ราคา/หน่วย"),
    );

    Widget title4 = Container(
      alignment: Alignment.center,
      child: Text("รวม"),
    );
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Expanded(flex: 2, child: title1),
          Expanded(child: title2),
          Expanded(child: title3),
          Expanded(child: title4),
        ],
      ),
    );
  }
}
