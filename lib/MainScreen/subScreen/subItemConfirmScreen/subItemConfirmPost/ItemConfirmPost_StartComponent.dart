import 'package:flutter/cupertino.dart';
import 'package:shopder/function/http/ClassObjects/httpGetPostShopItemData.dart';

class ItemConfirmPost_StartComponent extends StatefulWidget {
  final PostShopItem_PostShop post_info;
  ItemConfirmPost_StartComponent({@required this.post_info});
  @override
  _ItemConfirmPost_StartComponentState createState() =>
      _ItemConfirmPost_StartComponentState();
}

class _ItemConfirmPost_StartComponentState
    extends State<ItemConfirmPost_StartComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("วันที่โพสต์"),
          Text("${this.widget.post_info.start.ToString()}"),
        ],
      ),
    );
  }
}
