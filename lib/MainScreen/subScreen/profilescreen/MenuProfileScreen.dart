import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/profilescreen/sub_MenuProfileScreen/ShowDetailComponent.dart';
import 'package:shopder/MainScreen/subScreen/profilescreen/sub_MenuProfileScreen/ShowImageProfileConponent.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPathImageMenu.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShopData.dart';
import 'package:shopder/function/http/httpGetPathImageMenu.dart';

class MenuProfileScreen extends StatefulWidget {
  String inventory_id;
  GetPostShopDataResponse data;
  MenuProfileScreen({@required this.inventory_id, @required this.data});

  @override
  _MenuProfileScreenState createState() => _MenuProfileScreenState();
}

class _MenuProfileScreenState extends State<MenuProfileScreen> {
  List<PathImageMenu> listImage = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPathImageMenu();
  }

  @override
  Widget build(BuildContext context) {
    //ส่วนของการประมวลผล
    String inventory_id = this.widget.inventory_id;
    String menu_id =
        this.widget.data.bufferPostShopData_inventory[inventory_id].menu_id;
    String name = this.widget.data.bufferPostShopData_menu[menu_id].name;
    String image = this.widget.data.bufferPostShopData_menu[menu_id].path;
    int quantity =
        this.widget.data.bufferPostShopData_inventory[inventory_id].quantity;
    int cost = this.widget.data.bufferPostShopData_inventory[inventory_id].cost;
    //ส่วนของการแสดงออกบนหน้าจอ
    Widget ShowImage = Container(
      height: MediaQuery.of(context).size.width * 0.6,
      width: double.infinity,
      color: Colors.amber,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 1 + listImage.length,
          itemBuilder: (BuildContext context, int index) {
            if (index < 1) {
              return ShowImageProfileComponent(path: image);
            } else {
              return ShowImageProfileComponent(path: listImage[index - 1].path);
            }
          }),
    );

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.red,
        child: ListView(
          children: [
            ShowImage,
            ShowDetailComponent(
                postShopData_inventory:
                    this.widget.data.bufferPostShopData_inventory[inventory_id],
                postShopData_menu:
                    this.widget.data.bufferPostShopData_menu[menu_id]),
          ],
        ),
      ),
    );
  }

  void getPathImageMenu() async {
    String inventory_id = this.widget.inventory_id;
    GetPathImageMenuRequest bufferGetPathImageMenuRequest =
        GetPathImageMenuRequest(inventory_id: inventory_id);
    GetPathImageMenuResponse bufferGetPathImageMenuResponse =
        await httpGetPathImageMenu(
            bufferGetPathImageMenuRequest: bufferGetPathImageMenuRequest);

    setState(() {
      listImage = bufferGetPathImageMenuResponse.listPathImageMenu;
    });
  }
}
