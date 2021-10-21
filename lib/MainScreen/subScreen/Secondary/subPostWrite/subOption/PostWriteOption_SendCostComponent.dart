import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostWriteOption_SendCostComponent extends StatefulWidget {
  int sendCost;
  Function fun;
  PostWriteOption_SendCostComponent(
      {@required this.sendCost, @required this.fun});
  @override
  _PostWriteOption_SendCostComponentState createState() =>
      _PostWriteOption_SendCostComponentState();
}

class _PostWriteOption_SendCostComponentState
    extends State<PostWriteOption_SendCostComponent> {
  @override
  Widget build(BuildContext context) {
    Widget Input = TextFormField(
      controller: TextEditingController(text: this.widget.sendCost.toString()),
      keyboardType: TextInputType.number,
      onChanged: (e) {
        int sendCost = int.parse(e);
        this.widget.fun(sendCost);
      },
    );
    return Container(
    //  margin: EdgeInsets.only(left: 10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text("ค่าจัดส่งสินค้า"), Input],
      ),
    );
  }
}
