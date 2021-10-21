import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostWriteOption_HowSendComponent extends StatefulWidget {
  String how_send;
  final Function callback;
  PostWriteOption_HowSendComponent(
      {@required this.how_send, @required this.callback});
  @override
  _PostWriteOption_HowSendComponentState createState() =>
      _PostWriteOption_HowSendComponentState();
}

class _PostWriteOption_HowSendComponentState
    extends State<PostWriteOption_HowSendComponent> {
  bool address = true;
  bool shop = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget CheckListHowSendAddress = Container(
        height: double.infinity,
        width: double.infinity,
        child: Row(
          children: [
            Text("ส่งถึงที่"),
            Checkbox(
                value: address,
                onChanged: (e) {
                  setState(() {
                    address = e;
                  });
                  ReturnCallBack();
                }),
          ],
        ));
    Widget CheckListHowSendShop = Container(
        height: double.infinity,
        width: double.infinity,
        child: Row(
          children: [
            Text("สามารถรับที่ร้าน"),
            Checkbox(
                value: shop,
                onChanged: (e) {
                  setState(() {
                    shop = e;
                  });
                  ReturnCallBack();
                }),
          ],
        ));
    return Container(
      // color: Colors.red,
      height: 50,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text("การจัดส่งสินค้า"),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(child: CheckListHowSendAddress),
              Expanded(child: CheckListHowSendShop)
            ],
          ))
        ],
      ),
    );
  }

  Future<void> ReturnCallBack() {
    if ((address == true) && (shop == true)) {
      this.widget.callback("3");
    } else if ((address == false) && (shop == true)) {
      this.widget.callback("2");
    } else if ((address == true) && (shop == false)) {
      this.widget.callback("1");
    } else if ((address == false) && (shop == false)) {
      this.widget.callback("0");
    }
  }
}
