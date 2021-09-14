import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/BillSendScreen.dart';
import 'package:shopder/MainScreen/subScreen/subItemBillScreen/ItemBillPostShopBill/ItemBillPostShopBill_ListMenuComponent.dart';
import 'package:shopder/MainScreen/subScreen/subItemBillScreen/ItemBillPostShopBill/ItemBillPostShopBill_StatusComponent.dart';
import 'package:shopder/MainScreen/subScreen/subItemBillScreen/ItemBillPostShopBill/ItemBillPostShopBill_TableComponent.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShopBillData.dart';

class ItemBill_PostShopBillComponent extends StatefulWidget {
  GetPostShopBillDataResposne data;
  ItemBill_PostShopBillComponent({@required this.data});
  @override
  _ItemBill_PostShopBillComponentState createState() =>
      _ItemBill_PostShopBillComponentState();
}

class _ItemBill_PostShopBillComponentState
    extends State<ItemBill_PostShopBillComponent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        OpenBillSendScreen();
      },
      child: Container(
        margin: EdgeInsets.only(top: 2, bottom: 3),
        decoration: BoxDecoration(color: Colors.white),
        padding: EdgeInsets.only(left: 20),
        child: Column(
          children: [
            ItemBillPostShopBill_StatusComponent(
                post_shop: this.widget.data.post_info),
            ItemBillPostShopBill_TableComponent(),
            ItemBillPostShopBill_ListMenuComponent(data: this.widget.data),
          ],
        ),
      ),
    );
  }

  Future<void> OpenBillSendScreen() async {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) =>
            BillSendScreen(data: this.widget.data)));
  }
}
