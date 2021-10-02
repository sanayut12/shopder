import 'package:flutter/cupertino.dart';

class FullBillListMenu_TableComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget title1 = Container(
      child: Text("รายการสินค้า" , style: TextStyle(fontSize: 15,fontFamily: "SukhumvitSet-SemiBold"),),
    );
    Widget title2 = Container(
      alignment: Alignment.center,
      child: Text("จำนวน" , style: TextStyle(fontSize: 15,fontFamily: "SukhumvitSet-SemiBold"),),
    );
    Widget title3 = Container(
      alignment: Alignment.center,
      child: Text("ราคา/หน่วย" , style: TextStyle(fontSize: 14.5,fontFamily: "SukhumvitSet-SemiBold"),),
    );

    Widget title4 = Container(
      alignment: Alignment.center,
      child: Text("รวมทั้งสิ้น" , style: TextStyle(fontSize: 15,fontFamily: "SukhumvitSet-SemiBold"),),
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
