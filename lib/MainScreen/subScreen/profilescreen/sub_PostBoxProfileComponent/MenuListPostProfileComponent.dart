import 'package:flutter/cupertino.dart';
import 'package:shopder/MainScreen/subScreen/profilescreen/sub_PostBoxProfileComponent/MenuPostProfileComponent.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShopData.dart';

class MenuListPostProfileComponent extends StatefulWidget {
  GetPostShopDataResponse data;
  MenuListPostProfileComponent({@required this.data});
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
      // color: Color(0xFF000000), //Colors.amber,
      height: 300,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: this.widget.data.bufferPostShopData_inventory.length,
          itemBuilder: (BuildContext context, int index) {
            String inventory_id = this
                .widget
                .data
                .bufferPostShopData_inventory
                .keys
                .toList()[index];
            return MenuPostProfileComponent(
                inventory_id: inventory_id, data: this.widget.data);
          }),
    );
  }
}
