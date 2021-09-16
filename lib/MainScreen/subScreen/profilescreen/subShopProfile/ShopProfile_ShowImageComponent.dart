import 'package:flutter/cupertino.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';

class ShopProfile_ShowImageComponent extends StatefulWidget {
  @override
  _ShopProfile_ShowImageComponentState createState() =>
      _ShopProfile_ShowImageComponentState();
}

class _ShopProfile_ShowImageComponentState
    extends State<ShopProfile_ShowImageComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.3,
      width: MediaQuery.of(context).size.width * 0.3,
      margin: EdgeInsets.only(
          left: 10, top: MediaQuery.of(context).size.width * 0.35),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: MemoryImage(ShopInfoMamagement().GetImageShop()))),
    );
  }
}
