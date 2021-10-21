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
    /*22*/
    return Container(
      height: MediaQuery.of(context).size.width * 0.25,
      width: MediaQuery.of(context).size.width * 0.25,
      margin: EdgeInsets.only(
          left: 15, top: MediaQuery.of(context).size.width * 0.05),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: MemoryImage(ShopInfoMamagement().GetImageShop()))),
    );
  }
}
