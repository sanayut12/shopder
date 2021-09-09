import 'dart:typed_data';
import 'dart:math' as math;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/post/postboxshop.dart';
import 'package:shopder/MainScreen/subScreen/profilescreen/PostBoxProfileComponent.dart';
import 'package:shopder/MainScreen/subScreen/profilescreen/profileComponent.dart';
import 'package:shopder/function/dataManagement/dataPostShop.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShop.dart';
import 'package:shopder/function/http/httpGetPostShopInit.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<String> listPost = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // httpGetPostShop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [Text("${ShopInfoMamagement().GetName()}")],
      ),
    );
    // return Container(
    //   height: double.infinity,
    //   width: double.infinity,
    //   child: ListView.builder(
    //       itemCount: listPost.length,
    //       itemBuilder: (BuildContext context, int index) {
    //         return PostBoxProfileComponent(post_id: listPost[index]);
    //       }),
    // );
  }

  // Future<void> httpGetPostShop() async {
  //   String user_id = await ShopInfoMamagement().GetShop_id();
  //   GetPostShopInitRequest bufferGetPostShopRequest =
  //       GetPostShopInitRequest(user_id: user_id);
  //   GetpostShopInitResponse bufferGetpostShopResponse =
  //       await httpGetPostShopInit(
  //           bufferGetPostShopInitRequest: bufferGetPostShopRequest);
  //   setState(() {
  //     listPost = bufferGetpostShopResponse.bufferListPost;
  //   });
  //   // print(listPost);
  //   // bufferGetpostShopResponse.bufferListPost;
  // }
}
