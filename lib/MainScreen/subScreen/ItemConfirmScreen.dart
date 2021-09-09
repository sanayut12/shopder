import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/subItemConfirmScreen/ItemConfirm_PostComponent.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';
import 'package:shopder/function/http/ClassObjects/httpGetPostShopItemData.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShopItemInit.dart';
import 'package:shopder/function/http/httpGetPostShopItemData.dart';
import 'package:shopder/function/http/httpGetPostShopItemInit.dart';

class ItemConfirmScreen extends StatefulWidget {
  @override
  _ItemConfirmScreenState createState() => _ItemConfirmScreenState();
}

class _ItemConfirmScreenState extends State<ItemConfirmScreen> {
  Map<int, GetPostShopItemDataResposne> data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.yellow,
        child: data == null
            ? Container()
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ItemConfirm_PostComponent(
                      data: data[index], index: index, SetStatus: SetStatus);
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
    // bufferGetPostShopItemInitResponse.bufferPost_id.forEach((element) {
    //   print(element);
    // });
    int index = 0;
    Map<int, GetPostShopItemDataResposne> _data = {};
    for (String post_id in bufferGetPostShopItemInitResponse.bufferPost_id) {
      // print(post_id);
      GetPostShopItemDataRequest bufferGetPostShopItemDataRequest =
          GetPostShopItemDataRequest(post_id: post_id);
      GetPostShopItemDataResposne bufferGetPostShopItemDataResposne =
          await HttpGetPostShopItemData(
              bufferGetPostShopItemDataRequest:
                  bufferGetPostShopItemDataRequest);

      _data[index] = bufferGetPostShopItemDataResposne;
      index += 1;
    }
    setState(() {
      data = _data;
    });
  }

  Future<void> SetStatus(int index, String bill_id, String _status) {
    setState(() {
      data[index].bufferBill[bill_id].status = _status;
    });
  }
}
