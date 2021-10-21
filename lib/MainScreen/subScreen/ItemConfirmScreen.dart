import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopder/MainScreen/subScreen/subItemConfirmScreen/ItemConfirm_PostComponent.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';
import 'package:shopder/function/http/ClassObjects/httpGetPostShopItemData.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShopItemInit.dart';
import 'package:shopder/function/http/httpGetPostShopItemData.dart';
import 'package:shopder/function/http/httpGetPostShopItemInit.dart';
import 'package:shopder/provider/DataConfirmItemManagerProvider.dart';

class ItemConfirmScreen extends StatefulWidget {
  @override
  _ItemConfirmScreenState createState() => _ItemConfirmScreenState();
}

class _ItemConfirmScreenState extends State<ItemConfirmScreen> {
  Map<String, GetPostShopItemDataResposne> data = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPost();
  }

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   height: double.infinity,
    //   width: double.infinity,
    //   decoration: BoxDecoration(
    //     gradient: LinearGradient(
    //       colors: [Color(0xFFFFC9C3), Colors.white],
    //       begin: Alignment.topCenter,
    //       end: Alignment.bottomCenter,
    //     ),
    //   ),
    //   child: Consumer(builder:
    //       (context, DataConfirmItemManagerProvider provider, Widget child) {
    //     Map<String, GetPostShopItemDataResposne> data = provider.data;
    //     return Container(
    //       height: double.infinity,
    //       width: double.infinity,
    //       child: ListView.builder(
    //           itemCount: data.length,
    //           itemBuilder: (BuildContext context, int index) {
    //             String post_id = data.keys.toList()[index];
    //             return ItemConfirm_PostComponent(data: data[post_id]);
    //           }),
    //     );
    //   }),
    // );

    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFFC9C3), Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              String post_id = data.keys.toList()[index];
              return ItemConfirm_PostComponent(data: data[post_id]);
            }),
      ),
    );
  }

  Future<void> getPost() async {
    String shop_id = ShopInfoMamagement().GetShop_id();
    GetPostShopItemInitRequest bufferGetPostShopItemInitRequest =
        GetPostShopItemInitRequest(shop_id: shop_id);
    GetPostShopItemInitResponse bufferGetPostShopItemInitResponse =
        await HttpGetPostShopItemInit(
            bufferGetPostShopItemInitRequest: bufferGetPostShopItemInitRequest);

    for (String post_id in bufferGetPostShopItemInitResponse.bufferPost_id) {
      // print(post_id);
      GetPostShopItemDataRequest bufferGetPostShopItemDataRequest =
          GetPostShopItemDataRequest(post_id: post_id);
      GetPostShopItemDataResposne bufferGetPostShopItemDataResposne =
          await HttpGetPostShopItemData(
              bufferGetPostShopItemDataRequest:
                  bufferGetPostShopItemDataRequest);

      setState(() {
        data[post_id] = bufferGetPostShopItemDataResposne;
      });
    }
  }

  Future<void> SetStatus(int index, String bill_id, String _status) {
    setState(() {
      data[index].bufferBill[bill_id].status = _status;
    });
  }
}
