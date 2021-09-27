import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/http/ClassObjects/httpGetPostShopItemData.dart';

class FullItemConfirmPost_ListMenuComponent extends StatefulWidget {
  final GetPostShopItemDataResposne data;
  FullItemConfirmPost_ListMenuComponent({@required this.data});

  @override
  _FullItemConfirmPost_ListMenuComponentState createState() =>
      _FullItemConfirmPost_ListMenuComponentState();
}

class _FullItemConfirmPost_ListMenuComponentState
    extends State<FullItemConfirmPost_ListMenuComponent> {
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
    Widget ShowMenu(
            String _name, String _image, int _quantity, int _cost, int _item) =>
        Container(
          height: MediaQuery.of(context).size.width * 0.1,
          width: double.infinity,
          child: Row(
            children: [
              ShowImage(_image),
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.center,
                  child: Text("${_name}"),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text("${_quantity}"),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text("${_item}"),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text("${_cost}"),
                ),
              ),
            ],
          ),
        );

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.width *
          0.1 *
          this.widget.data.bufferInventory.length,
      child: ListView.builder(
          itemCount: this.widget.data.bufferInventory.length,
          itemBuilder: (BuildContext context, int index) {
            String inventory_id =
                this.widget.data.bufferInventory.keys.toList()[index];
            String menu_id =
                this.widget.data.bufferInventory[inventory_id].menu_id;
            String _image = this.widget.data.bufferMenu[menu_id].path;
            String _name = this.widget.data.bufferMenu[menu_id].name;

            int _quantity =
                this.widget.data.bufferInventory[inventory_id].quantity;
            int _cost = this.widget.data.bufferInventory[inventory_id].cost;
            int _item = 0;
            // this.widget.data.bufferItem.forEach((key, value) {
            //   print("${value.inventory_id}");
            // });
            this.widget.data.bufferBill.forEach((key1, value) {
              if (value.status == "1" ||
                  value.status == "2" ||
                  value.status == "3" ||
                  value.status == "4") {
                // print("${value.status}");
                this.widget.data.bufferItem.forEach((key2, value) {
                  if (value.bill_id == key1 &&
                      value.inventory_id == inventory_id) {
                    _item += value.quantity;
                    // print(value.quantity);
                  }
                });
              }
            });

            print("${index} ${this.widget.data.bufferInventory.length}");
            return ShowMenu(_name, _image, _quantity, _cost, _item);
          }),
    );
  }
}
