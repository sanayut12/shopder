import 'package:flutter/cupertino.dart';
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShopBillData.dart';

class BillSendMiniPost_ListMenuComponent extends StatefulWidget {
  GetPostShopBillDataResposne data;
  BillSendMiniPost_ListMenuComponent({@required this.data});
  @override
  _BillSendMiniPost_ListMenuComponentState createState() =>
      _BillSendMiniPost_ListMenuComponentState();
}

class _BillSendMiniPost_ListMenuComponentState
    extends State<BillSendMiniPost_ListMenuComponent> {
  @override
  Widget build(BuildContext context) {
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
          height: MediaQuery.of(context).size.width * 0.1,
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Row(
                      children: [ShowImage(image), Text("${name}")],
                    ),
                  )),
              Expanded(
                  child: Container(
                alignment: Alignment.center,
                child: Text("${quantity}"),
              ))
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
