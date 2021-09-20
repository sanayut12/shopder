import 'package:flutter/cupertino.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShopBillData.dart';

class ItemBillPostShopBill_StatusComponent extends StatefulWidget {
  PostShopBill_PostShop post_shop;
  ItemBillPostShopBill_StatusComponent({@required this.post_shop});
  @override
  _ItemBillPostShopBill_StatusComponentState createState() =>
      _ItemBillPostShopBill_StatusComponentState();
}

class _ItemBillPostShopBill_StatusComponentState
    extends State<ItemBillPostShopBill_StatusComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // padding: EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${this.widget.post_shop.send.ToString()}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width *0.06),
          ),
          this.widget.post_shop.detail == ""
              ? Container()
              : Text("${this.widget.post_shop.detail}")
        ],
      ),
    );
  }
}
