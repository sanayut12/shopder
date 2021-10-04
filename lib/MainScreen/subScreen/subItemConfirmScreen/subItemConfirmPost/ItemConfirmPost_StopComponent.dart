import 'package:flutter/cupertino.dart';
import 'package:shopder/function/http/ClassObjects/httpGetPostShopItemData.dart';

class ItemConfirmPost_StopComponent extends StatefulWidget {
  final PostShopItem_PostShop post_info;
  ItemConfirmPost_StopComponent({@required this.post_info});
  @override
  _ItemConfirmPost_StopComponentState createState() =>
      _ItemConfirmPost_StopComponentState();
}

class _ItemConfirmPost_StopComponentState
    extends State<ItemConfirmPost_StopComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("วันที่ปิดการจองสินค้า" ,
          style: TextStyle(
            fontSize: 15,
            fontFamily: "SukhumvitSet-Medium"
          ),
          ),
          Text("${this.widget.post_info.stop.ToString()}" ,
          style: TextStyle(fontFamily: "SukhumvitSet-Medium",fontSize: 15),),
        ],
      ),
    );
  }
}
