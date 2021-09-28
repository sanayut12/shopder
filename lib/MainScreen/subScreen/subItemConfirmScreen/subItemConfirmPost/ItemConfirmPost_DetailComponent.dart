import 'package:flutter/cupertino.dart';
import 'package:shopder/function/http/ClassObjects/httpGetPostShopItemData.dart';

// class ItemConfirmPost_DetailComponent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       child: Text("${this.post_info.detail}"),
//     );
//   }
// }

class ItemConfirmPost_DetailComponent extends StatefulWidget {
  final PostShopItem_PostShop post_info;
  ItemConfirmPost_DetailComponent({@required this.post_info});

  @override
  _ItemConfirmPost_DetailComponentState createState() =>
      _ItemConfirmPost_DetailComponentState();
}

class _ItemConfirmPost_DetailComponentState
    extends State<ItemConfirmPost_DetailComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Text("${this.widget.post_info.detail}" ,style: TextStyle(fontSize: 15,fontFamily: "SukhumvitSet-Medium")),
    );
  }
}
