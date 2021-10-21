import 'package:flutter/cupertino.dart';
import 'package:shopder/MainScreen/subScreen/Secondary/sebFullItemConfirmScreen/subMenu/FullItemConfirmPost_MenuComponent.dart';
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/http/ClassObjects/httpGetPostShopItemData.dart';

class FullItemConfirmPost_ListMenuComponent2 extends StatefulWidget {
  final GetPostShopItemDataResposne data;
  FullItemConfirmPost_ListMenuComponent2({@required this.data});

  @override
  _FullItemConfirmPost_ListMenuComponent2State createState() =>
      _FullItemConfirmPost_ListMenuComponent2State();
}

class _FullItemConfirmPost_ListMenuComponent2State
    extends State<FullItemConfirmPost_ListMenuComponent2> {
  @override
  Widget build(BuildContext context) {
    Widget ShowImage(String _image) => Container(
          height: MediaQuery.of(context).size.width * 0.1,
          width: MediaQuery.of(context).size.width * 0.1,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image:
                      NetworkImage("${HostName()}/image/menuImage/${_image}"))),
        );

    List<Widget> buffer = [];
    this.widget.data.bufferInventory.forEach((key, value) {
      String inventory_id = key;
      String menu_id = this.widget.data.bufferInventory[inventory_id].menu_id;
      String image = this.widget.data.bufferMenu[menu_id].path;
      String name = this.widget.data.bufferMenu[menu_id].name;

      int quantity = this.widget.data.bufferInventory[inventory_id].quantity;
      int cost = this.widget.data.bufferInventory[inventory_id].cost;
      int item = 0;

      this.widget.data.bufferBill.forEach((key1, value) {
        if (value.status == "1" ||
            value.status == "2" ||
            value.status == "3" ||
            value.status == "4") {
          // print("${value.status}");
          this.widget.data.bufferItem.forEach((key2, value) {
            if (value.bill_id == key1 && value.inventory_id == inventory_id) {
              item += value.quantity;
            }
          });
        }
      });
      buffer.add(FullItemConfirmPost_MenuComponent(
          name: name,
          image: image,
          quantity: quantity,
          hole: item,
          cost: cost)); //ShowMenu(_name, _image, _quantity, _cost, _item)
    });

    return Container(
      width: double.infinity,
      child: Column(
        children: buffer,
      ),
    );
  }
}
