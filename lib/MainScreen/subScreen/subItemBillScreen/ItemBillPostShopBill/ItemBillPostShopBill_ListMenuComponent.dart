import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/dataManagement/readJsonAddress.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShopBillData.dart';

class ItemBillPostShopBill_ListMenuComponent extends StatefulWidget {
  GetPostShopBillDataResposne data;
  ItemBillPostShopBill_ListMenuComponent({@required this.data});
  @override
  _ItemBillPostShopBill_ListMenuComponentState createState() =>
      _ItemBillPostShopBill_ListMenuComponentState();
}

class _ItemBillPostShopBill_ListMenuComponentState
    extends State<ItemBillPostShopBill_ListMenuComponent> {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    TextStyle style = TextStyle(fontSize: 12, fontWeight: FontWeight.w500);
    Widget ShowImage(String image) => Container(
          height: MediaQuery.of(context).size.width * 0.1,
          width: MediaQuery.of(context).size.width * 0.1,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image:
                      NetworkImage("${HostName()}/image/menuImage/${image}"))),
        );
    Widget CardModel(String name, String image, int quantity) => Container(
          // height: MediaQuery.of(context).size.width * 0.1,
          child: Row(
            children: [
              Container(
                width: weight_screen * 0.6,
                child: Row(
                  children: [
                    ShowImage(image),
                    Container(
                        width: weight_screen * 0.5,
                        child: Text(
                          "${name}",
                          style: style,
                        ))
                  ],
                ),
              ),
              Container(
                width: weight_screen * 0.3,
                alignment: Alignment.center,
                child: Text(
                  "${quantity}",
                  style: style,
                ),
              )
            ],
          ),
        );

    List<Widget> buffer = [];

    this.widget.data.bufferInventory.forEach((key1, value1) {
      int quantity = 0;
      this.widget.data.bufferItem.forEach((key2, value2) {
        if (key1 == value2.inventory_id) {
          quantity += value2.quantity;
        }
      });

      String name = this.widget.data.bufferMenu[value1.menu_id].name;
      String image = this.widget.data.bufferMenu[value1.menu_id].path;
      buffer.add(CardModel(name, image, quantity));
    });
    return Container(
      child: Column(children: buffer),
    );
  }
}
