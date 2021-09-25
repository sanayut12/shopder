import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/profilescreen/PostBoxProfileComponent.dart';
import 'package:shopder/MainScreen/subScreen/profilescreen/ShopProfileComponent.dart';

import 'package:shopder/function/dataManagement/dataShopInfo.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShop.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShopData.dart';
import 'package:shopder/function/http/httpGetPostShopData.dart';
import 'package:shopder/function/http/httpGetPostShopInit.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // List<String> listPost = [];

  Map<String, GetPostShopDataResponse> dataPost = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    httpGetPostShop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end:
              Alignment(0.8, 1.0), // 10% of the width, so there are ten blinds.
          colors: <Color>[Color(0xffFA897B), Color(0xfffffff)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShopProfileComponent(),
          Expanded(
            child: Container(
              child: ListView.builder(
                  itemCount: dataPost.length,
                  itemBuilder: (BuildContext context, int index) {
                    String key = dataPost.keys.toList()[index];
                    return PostBoxProfileComponent(
                      data: dataPost[key],
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }

  Future<void> httpGetPostShop() async {
    String user_id = await ShopInfoMamagement().GetShop_id();
    GetPostShopInitRequest bufferGetPostShopRequest =
        GetPostShopInitRequest(user_id: user_id);
    GetpostShopInitResponse bufferGetpostShopResponse =
        await httpGetPostShopInit(
            bufferGetPostShopInitRequest: bufferGetPostShopRequest);

    for (String post_id in bufferGetpostShopResponse.bufferListPost) {
      GetPostShopDataRequest bufferGetPostShopDataRequest =
          GetPostShopDataRequest(post_id: post_id);
      GetPostShopDataResponse bufferGetPostShopDataResponse =
          await httpGetPostShopData(
              bufferGetPostShopDataRequest: bufferGetPostShopDataRequest);
      print("ffff ${post_id} ${bufferGetPostShopDataResponse}");
      setState(() {
        dataPost[post_id] = bufferGetPostShopDataResponse;
      });
    }
    // setState(() {
    //   listPost = bufferGetpostShopResponse.bufferListPost;
    // });
  }
}
