import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/Secondary/BillSendScreen.dart';
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
    double weight_screen = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        OpenBillSendScreen();
      },
      child: Container(
        /*11*/
        margin: EdgeInsets.only(
            top: 5,
            bottom: 3,
            right: weight_screen * 0.025,
            left: weight_screen * 0.025),
        padding: EdgeInsets.only(
            left: weight_screen * 0.025,
            right: weight_screen * 0.025,
            top: 10,
            bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
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
