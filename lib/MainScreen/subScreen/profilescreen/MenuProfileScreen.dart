import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/profilescreen/sub_MenuProfileScreen/ShowDetailComponent.dart';
import 'package:shopder/MainScreen/subScreen/profilescreen/sub_MenuProfileScreen/ShowImageProfileConponent.dart';
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPathImageMenu.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShopData.dart';
import 'package:shopder/function/http/httpGetPathImageMenu.dart';

class MenuProfileScreen extends StatefulWidget {
  final PostShopData_inventory postShopData_inventory;
  final PostShopData_menu postShopData_menu;
  MenuProfileScreen(
      {@required this.postShopData_inventory,
      @required this.postShopData_menu});

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
    Widget ShowImage = Container(
      height: MediaQuery.of(context).size.width * 0.6,
      width: double.infinity,
      color: Colors.amber,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 1 + listImage.length,
          itemBuilder: (BuildContext context, int index) {
            if (index < 1) {
              return ShowImageProfileComponent(
                  path: this.widget.postShopData_menu.path);
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
                postShopData_inventory: this.widget.postShopData_inventory,
                postShopData_menu: this.widget.postShopData_menu),
          ],
        ),
      ),
    );
  }

  void getPathImageMenu() async {
    String inventory_id = this.widget.postShopData_inventory.inventory_id;
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
