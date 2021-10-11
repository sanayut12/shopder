import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/orderscreen/OrderPostComponent.dart';
import 'package:shopder/function/dataManagement/dataOrderPost.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetOrderPostShopCurrent.dart';
import 'package:shopder/function/http/httpGetOrderPostShopCurrent.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  Map<int, Post> bufferPostOrder = {};
  Map<String, MenuOrder> menuList = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getOrderPost();
  }

  @override
  Widget build(BuildContext context) {
    // print(bufferPostOrder.length);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end:
              Alignment(0.8, 1.0), // 10% of the width, so there are ten blinds.
          colors: <Color>[Color(0xffFA897B), Color(0xfffffff)],
        ),
      ),
      child: ListView.builder(
          itemCount: bufferPostOrder.length,
          itemBuilder: (BuildContext context, int index) {
            return OrderPostComponent(
                post: bufferPostOrder[index],
                bufferMenu: menuList[bufferPostOrder[index].post_id]);
          }),
    );
  }

  void getOrderPost() async {
    String shop_id = ShopInfoMamagement().GetShop_id();
    // print(" shop ID: ${shop_id}");

    GetOrderPostShopCurrentRequest bufferGetOrderPostShopCurrentRequest =
        GetOrderPostShopCurrentRequest(shop_id: shop_id);

    GetOrderPostShopCurrentResponse bufferGetOrderPostShopCurrentResponse = //
        await HttpGetOrderPostShopCurrent(
            bufferGetOrderPostShopCurrentRequest:
                bufferGetOrderPostShopCurrentRequest);
    menuList = bufferGetOrderPostShopCurrentResponse.menuList;
    setState(() {
      bufferPostOrder = bufferGetOrderPostShopCurrentResponse.bufferPostOrder;
    });
  }
}
