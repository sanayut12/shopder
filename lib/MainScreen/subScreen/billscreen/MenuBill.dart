import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/dataManagement/dataOrderPost.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetOrderAndUser.dart';
import 'package:shopder/function/http/httpGetOrderAndUser.dart';

class MenuBill extends StatefulWidget {
  final Menu menu;
  final Function setInventoryBill;
  MenuBill({@required this.menu, @required this.setInventoryBill});
  @override
  _MenuBillState createState() => _MenuBillState();
}

class _MenuBillState extends State<MenuBill> {
  int quantity_hold = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getOrderAndUser();
  }

  @override
  Widget build(BuildContext context) {
    Widget image_menu = Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "${HostName()}/image/menuImage/${this.widget.menu.path}"))),
      //"${HostName()}/image/menuImage/${this.widget.menu.path}"
    );

    Widget menuName = Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.pink,
      alignment: Alignment.center,
      child: Text(
        "${this.widget.menu.name}",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );

    Widget QuantityCpmponent = Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.pink[100],
      alignment: Alignment.center,
      child: Text(
        "${quantity_hold} /${this.widget.menu.quantity}",
        style: TextStyle(fontSize: 15),
      ),
    );
    return Container(
      height: 100,
      width: double.infinity,
      color: Colors.deepOrange,
      child: Row(
        children: [
          image_menu,
          Expanded(flex: 2, child: menuName),
          Expanded(child: QuantityCpmponent)
        ],
      ),
    );
  }

  void getOrderAndUser() async {
    GetOrderAndUserRequest bufferGetOrderAndUserRequest =
        GetOrderAndUserRequest(inventory_id: this.widget.menu.inventory_id);
    GetOrderAndUserResponse bufferGetOrderAndUserResponse =
        await HttpGetOrderAndUser(
            bufferGetOrderAndUserRequest: bufferGetOrderAndUserRequest);
    // print(
    //     "${this.widget.menu.inventory_id} ${bufferGetOrderAndUserResponse.bufferInventoryBill}");
    int _quantity_hold = 0;

    bufferGetOrderAndUserResponse.bufferInventoryBill.forEach((key, element) {
      _quantity_hold += element.quantity;
    });
    setState(() {
      quantity_hold = _quantity_hold;
    });

    this
        .widget
        .setInventoryBill(bufferGetOrderAndUserResponse.bufferInventoryBill);
  }
}
