import 'package:flutter/cupertino.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';

class BillSendMiniPost_ShopProfileComponent extends StatefulWidget {
  @override
  _BillSendMiniPost_ShopProfileComponentState createState() =>
      _BillSendMiniPost_ShopProfileComponentState();
}

class _BillSendMiniPost_ShopProfileComponentState
    extends State<BillSendMiniPost_ShopProfileComponent> {
  @override
  Widget build(BuildContext context) {
    Widget ShowImage = Container(
      height: MediaQuery.of(context).size.width * 0.1,
      width: MediaQuery.of(context).size.width * 0.1,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: MemoryImage(ShopInfoMamagement().GetImageShop()))),
    );

    Widget ShowName = Container(
      child: Text("${ShopInfoMamagement().GetName()}"),
    );
    return Container(
      child: Row(
        children: [ShowImage, Expanded(child: ShowName)],
      ),
    );
  }
}
