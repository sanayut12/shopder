import 'package:flutter/cupertino.dart';
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShopBillData.dart';

class BillSendListBill_ListMenuComponent extends StatefulWidget {
  String bill_id;
  GetPostShopBillDataResposne data;
  BillSendListBill_ListMenuComponent(
      {@required this.bill_id, @required this.data});
  @override
  _BillSendListBill_ListMenuComponentState createState() =>
      _BillSendListBill_ListMenuComponentState();
}

class _BillSendListBill_ListMenuComponentState
    extends State<BillSendListBill_ListMenuComponent> {
  @override
  Widget build(BuildContext context) {
    Widget ShowImage(String _image) => Container(
          height: MediaQuery.of(context).size.width * 0.1,
          width: MediaQuery.of(context).size.width * 0.1,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image:
                      NetworkImage("${HostName()}/image/menuImage/${_image}"))),
        );
    Widget ShowCardMenu(String name, String image, quantity) => Container(
          width: double.infinity,
          child: Row(
            children: [
              ShowImage(image),
              Expanded(
                  flex: 3,
                  child: Container(
                      padding: EdgeInsets.only(left: 20),
                      alignment: Alignment.centerLeft,
                      child: Text("${name}"))),
              Expanded(
                  child: Container(
                      alignment: Alignment.center, child: Text("${quantity}"))),
            ],
          ),
        );

    List<Widget> buffer = [];

    this.widget.data.bufferItem.forEach((key, value) {
      if (value.bill_id == this.widget.bill_id) {
        int quantity = value.quantity;
        String menu_id =
            this.widget.data.bufferInventory[value.inventory_id].menu_id;
        String name = this.widget.data.bufferMenu[menu_id].name;
        String image = this.widget.data.bufferMenu[menu_id].path;
        buffer.add(ShowCardMenu(name, image, quantity));
      }
    });
    return Container(
      child: Column(
        children: buffer,
      ),
    );
  }
}
