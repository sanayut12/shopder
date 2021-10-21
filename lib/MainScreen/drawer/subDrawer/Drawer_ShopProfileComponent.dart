import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';

class Drawer_ShopProfileComponent extends StatefulWidget {
  @override
  _Drawer_ShopProfileComponentState createState() =>
      _Drawer_ShopProfileComponentState();
}

class _Drawer_ShopProfileComponentState
    extends State<Drawer_ShopProfileComponent> {
  @override
  Widget build(BuildContext context) {
    Widget ShowImageProfile = Container(
      height: MediaQuery.of(context).size.width * 0.25,
      width: MediaQuery.of(context).size.width * 0.25,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: MemoryImage(ShopInfoMamagement().GetImageShop()))),
    );

    Widget NameShop = Container(
      margin: EdgeInsets.only(left: 10),
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.5),
      child: Text(
        "${ShopInfoMamagement().GetName()}",
        style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.09,
            fontWeight: FontWeight.bold),
      ),
    );
    return Container(
      padding: EdgeInsets.only(left: 10, top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [ShowImageProfile, NameShop],
      ),
    );
  }
}
