import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/subItemBillScreen/ItemBill_PostShopBillComponent.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShopBillData.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShopBillInit.dart';
import 'package:shopder/function/http/httpGetPostShopBillData.dart';
import 'package:shopder/function/http/httpGetPostShopBillInit.dart';

class ItemBillScreen extends StatefulWidget {
  @override
  _ItemBillScreenState createState() => _ItemBillScreenState();
}

class _ItemBillScreenState extends State<ItemBillScreen> {
  List<String> bufferPost_id = [];
  Map<String, GetPostShopBillDataResposne> data = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetPostShopBill();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container( /*4*/
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: ListView.builder(
        itemCount: bufferPost_id.length,
        itemBuilder: (BuildContext context, int index) {
          String post_id = bufferPost_id[index];
          return ItemBill_PostShopBillComponent(data: data[post_id]);
          // return Container(
          //   height: 100,
          //   width: double.infinity,
          //   color: Colors.white,
          //   margin: EdgeInsets.all(10),
          // );
        },
      ),
    ));
  }

  Future<void> GetPostShopBill() async {
    String shop_id = ShopInfoMamagement().GetShop_id();
    GetPostShopBillInitRequest bufferGetPostShopBillInitRequest =
        GetPostShopBillInitRequest(shop_id: shop_id);
    GetPostShopBillInitResponse bufferGetPostShopBillInitResponse =
        await HttpGetPostShopBillInit(
            bufferGetPostShopBillInitRequest: bufferGetPostShopBillInitRequest);
    Map<String, GetPostShopBillDataResposne> _data = {};
    for (String post_id in bufferGetPostShopBillInitResponse.bufferPost_id) {
      GetPostShopBillDataRequest bufferGetPostShopBillDataRequest =
          GetPostShopBillDataRequest(post_id: post_id);
      GetPostShopBillDataResposne bufferGetPostShopBillDataResposne =
          await HttpGetPostShopBillData(
              bufferGetPostShopBillDataRequest:
                  bufferGetPostShopBillDataRequest);
      _data[post_id] = bufferGetPostShopBillDataResposne;
    }

    setState(() {
      bufferPost_id = bufferGetPostShopBillInitResponse.bufferPost_id;
      data = _data;
    });
  }
}
