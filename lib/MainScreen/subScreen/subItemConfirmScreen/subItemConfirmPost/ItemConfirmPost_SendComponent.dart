import 'package:flutter/cupertino.dart';
import 'package:shopder/function/http/ClassObjects/httpGetPostShopItemData.dart';

class ItemConfirmPost_SendComponent extends StatefulWidget {
  final PostShopItem_PostShop post_info;
  ItemConfirmPost_SendComponent({@required this.post_info});
  @override
  _ItemConfirmPost_SendComponentState createState() =>
      _ItemConfirmPost_SendComponentState();
}

class _ItemConfirmPost_SendComponentState
    extends State<ItemConfirmPost_SendComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("วันที่จัดส่งสืนค้า"),
          Text("${this.widget.post_info.send.ToString()}"),
        ],
      ),
    );
  }
}
