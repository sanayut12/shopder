import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/http/ClassObjects/httpGetPostShopItemData.dart';

class FullItemConfirmPostListBill_ShowListMenuComponent extends StatefulWidget {
  final String bill_id;
  final GetPostShopItemDataResposne data;
  FullItemConfirmPostListBill_ShowListMenuComponent(
      {@required this.bill_id, @required this.data});

  @override
  _FullItemConfirmPostListBill_ShowListMenuComponentState createState() =>
      _FullItemConfirmPostListBill_ShowListMenuComponentState();
}

class _FullItemConfirmPostListBill_ShowListMenuComponentState
    extends State<FullItemConfirmPostListBill_ShowListMenuComponent> {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    List<Widget> buffer = [];

    Widget ShowImage(String _image) => Container(
          height: weight_screen * 0.1,
          width: weight_screen * 0.1,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(weight_screen * 0.02),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image:
                      NetworkImage("${HostName()}/image/menuImage/${_image}"))),
        );

    Widget ShowName(String _name) => Container(
          alignment: Alignment.centerLeft,
          child: Text("${_name}"),
        );
    Widget ShowQuantity(int _quantity) => Container(
          alignment: Alignment.centerLeft,
          child: Text("${_quantity} ชิ้น"),
        );
    Widget ShowMenu(String name, String image, int quantity) => Container(
          child: Row(
            children: [
              ShowImage(image),
              // Expanded(
              //   child: Container(),
              // ),
              Expanded(child: ShowName(name)),
              Expanded(child: ShowQuantity(quantity))
            ],
          ),
        );
    this.widget.data.bufferItem.forEach((key, value) {
      if (value.bill_id == this.widget.bill_id) {
        int quantity = value.quantity;

        String menu_id =
            this.widget.data.bufferInventory[value.inventory_id].menu_id;
        String name = this.widget.data.bufferMenu[menu_id].name;
        String image = this.widget.data.bufferMenu[menu_id].path;

        buffer.add(ShowMenu(name, image, quantity));
      }
    });
    return Container(
      child: Column(children: buffer),
    );
  }
}
