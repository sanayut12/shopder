import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
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
    onTap: (){
      OpenBillSendScreen();
    },
  
      child: Container( /*11*/
        margin: EdgeInsets.only(top: 5, bottom: 3),
        padding: EdgeInsets.only(left: 12,top: 10,bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
      /*    border: Border.all( 
          color: Color(0xFFFFC0B8), width: 1.0, style: BorderStyle.solid), */
          borderRadius: BorderRadius.circular(15), 
          gradient: LinearGradient(
          colors:[Color(0xFFFFB5AC),Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
                0.0,
                0.50,
              ],
        ),
        
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0,3),
          )
        ]),
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
