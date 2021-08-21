import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/billscreen/MenuBill.dart';
import 'package:shopder/MainScreen/subScreen/billscreen/subbillScreen/ListUserBillScreen.dart';
import 'package:shopder/function/dataManagement/dataOrderPost.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetBill.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetOrderAndUser.dart';
import 'package:shopder/function/http/httpGetBill.dart';

class PostBill extends StatefulWidget {
  final Post post;
  final MenuOrder menuList;
  PostBill({@required this.post, @required this.menuList});
  @override
  _PostBillState createState() => _PostBillState();
}

class _PostBillState extends State<PostBill> {
  //
  List<Bill> bufferBill = []; //รลิสต์ รายการบิล
  Map<String, UserBill> bufferUserBill = {}; //<ีuser_id , .....>
  Map<String, InventoryBill> bufferInventoryBill = {}; //<item_id , ......>

  //เก็บหน้าจอ รายการอาหาร
  var bufferMenuBill = <MenuBill>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("bufferbill ${bufferBill}");
    GetBill(); //เรียกคำสั่งในการขอ bill และ user จาก server

    bufferMenuBill = [];

    this.widget.menuList.bufferMenu.forEach((key, value) {
      bufferMenuBill.add(MenuBill(
        menu: value,
        setInventoryBill: addDataToInventoryBill,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget image_profile = Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: MemoryImage(ShopInfoMamagement().GetImageShop()))),
    );
    Widget name_profile = Container(
      child: Text("${ShopInfoMamagement().GetName()}"),
    );

    Widget ProfileBar = Container(
      padding: EdgeInsets.all(5),
      height: 50,
      width: double.infinity,
      color: Colors.green,
      child: Row(
        children: [image_profile, name_profile],
      ),
    );

    Widget UnderProfileBar = Container(
      height: 20,
      width: double.infinity,
      color: Colors.blue,
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text("${this.widget.post.start.ToString()}"),
          ),
          Container(
            child: Text("${this.widget.post.sendCost}"),
          )
        ],
      ),
    );

    Widget DetailBar = GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => ListUserBillScreen(
                post: this.widget.post,
                menuList: this.widget.menuList,
                bufferUserBill: bufferUserBill,
                bufferBill: bufferBill,
                bufferInventoryBill: bufferInventoryBill)));
      },
      child: Container(
        padding: EdgeInsets.all(3),
        height: 80,
        width: double.infinity,
        color: Colors.red,
        child: Text("${this.widget.post.detail}"),
      ),
    );

    Widget MenuOrderComponent = Container(
      child: Column(
        children: bufferMenuBill,
      ),
    );

    return Container(
      width: double.infinity,
      // height: 100 + (this.widget.menuList.length().toDouble() * 100),
      margin: EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 3),
      color: Colors.red,
      child: Column(
        children: [ProfileBar, UnderProfileBar, DetailBar, MenuOrderComponent],
      ),
    );
  }

  void GetBill() async {
    // print("object ${this.widget.post.post_id}");
    String post_id = this.widget.post.post_id;
    GetBillRequest bufferGetBillRequest = GetBillRequest(post_id: post_id);
    GetBillResponse bufferGetBillResponse =
        await HttpGetBill(bufferGetBillRequest: bufferGetBillRequest);
    bufferBill = bufferGetBillResponse.bufferBill;
    bufferUserBill = bufferGetBillResponse.bufferUserBill;
  }

  Future<void> addDataToInventoryBill(
      Map<String, InventoryBill> _bufferInventoryBill) {
    print("object");
    _bufferInventoryBill.forEach((key, value) {
      bufferInventoryBill[key] = value;
      // print(key);
    });
    // print("${_bufferInventoryBill.length}");
    // print("length ${bufferInventoryBill.length}");
  }
}
