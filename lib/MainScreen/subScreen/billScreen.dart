import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/billscreen/PostBill.dart';
import 'package:shopder/function/dataManagement/dataOrderPost.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetOrderAndUser.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostBill.dart';
import 'package:shopder/function/http/httpGetPostBill.dart';
import 'package:shopder/function/http/httpGetOrderAndUser.dart';

class BillScreen extends StatefulWidget {
  @override
  _BillScreenState createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  List<Post> bufferPost = [];
  Map<String, MenuOrder> menuList = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    httpGetPostBill();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[100],
      child: ListView.builder(
          itemCount: bufferPost.length,
          itemBuilder: (BuildContext context, int index) {
            String post_id = bufferPost[index].post_id;

            return PostBill(
              post: bufferPost[index],
              menuList: menuList[post_id],
            );
          }),
    );
  }

  void httpGetPostBill() async {
    String shop_id = ShopInfoMamagement().GetShop_id();
    GetPostBillRequest bufferGetPostBillRequest =
        GetPostBillRequest(shop_id: shop_id);
    GetPostBillResponse bufferGetPostBillResponse = await HttpGetPostBill(
        bufferGetPostBillRequest: bufferGetPostBillRequest);

    setState(() {
      bufferPost = bufferGetPostBillResponse.bufferPostOrder;
      menuList = bufferGetPostBillResponse.menuList;
    });
  }
}
