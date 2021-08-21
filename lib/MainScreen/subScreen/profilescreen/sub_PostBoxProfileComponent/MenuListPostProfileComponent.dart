import 'package:flutter/cupertino.dart';
import 'package:shopder/MainScreen/subScreen/profilescreen/sub_PostBoxProfileComponent/MenuPostProfileComponent.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShopData.dart';

class MenuListPostProfileComponent extends StatefulWidget {
  final List<PostShopData_inventory> bufferPostShopData_inventory;
  final Map<String, PostShopData_menu> bufferPostShopData_menu;
  MenuListPostProfileComponent(
      {@required this.bufferPostShopData_inventory,
      @required this.bufferPostShopData_menu});
  @override
  _MenuListPostProfileComponentState createState() =>
      _MenuListPostProfileComponentState();
}

class _MenuListPostProfileComponentState
    extends State<MenuListPostProfileComponent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.widget.bufferPostShopData_inventory.length == 0
          ? 0
          : MediaQuery.of(context).size.width * 0.80,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: this.widget.bufferPostShopData_inventory.length,
          itemBuilder: (BuildContext context, int index) {
            PostShopData_inventory postShopData_inventory =
                this.widget.bufferPostShopData_inventory[index];
            PostShopData_menu postShopData_menu = this
                .widget
                .bufferPostShopData_menu[postShopData_inventory.menu_id];
            return MenuPostProfileComponent(
              postShopData_inventory: postShopData_inventory,
              postShopData_menu: postShopData_menu,
            );
          }),
    );
  }
}
