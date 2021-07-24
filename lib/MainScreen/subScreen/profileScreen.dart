import 'dart:typed_data';
import 'dart:math' as math;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/post/postboxshop.dart';
import 'package:shopder/MainScreen/subScreen/profilescreen/profileComponent.dart';
import 'package:shopder/function/dataManagement/dataPostShop.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShop.dart';
import 'package:shopder/function/http/httpGetPostShop.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int min_post = 0;
  ShopInfo bufferShopInfo; //= ShopInfoMamagement().GetShopInfo();
  Uint8List imageProfile; //= ShopInfoMamagement().GetImageShop();
  @override
  void initState() {
    // var BufferListPost = <PostList>[];
    // TODO: implement initState
    super.initState();
    print("init state");
    setState(() {
      // BufferListPost.add(value);
      bufferShopInfo = ShopInfoMamagement().GetShopInfo();
      imageProfile = ShopInfoMamagement().GetImageShop();
    });

    httpGetPostShop();
  }

  var BufferListPost = <PostList>[];
  @override
  Widget build(BuildContext context) {
    Widget LoadPostButton = GestureDetector(
      onTap: () {
        loadhttpGetPostShop();
      },
      child: Container(
        height: 50,
        width: double.infinity,
        color: Colors.green,
        alignment: Alignment.center,
        child: Text("load"),
      ),
    );
    return Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
            itemCount: BufferListPost.length + 2,
            itemBuilder: (context, int index) {
              print("$index");
              if (index == 0) {
                return ProfileComponent();
              } else if (index == BufferListPost.length + 1) {
                if (min_post == 0) {
                  return Container();
                } else {
                  return LoadPostButton;
                }
              } else {
                return PostBoxShop(
                  bufferPostList: BufferListPost[index - 1],
                  bufferShopInfo: bufferShopInfo,
                  imageProfile: imageProfile,
                );
              }
            }));
  }

  Future<Null> httpGetPostShop() async {
    String user_id = await ShopInfoMamagement().GetShop_id();
    GetPostShopRequest bufferGetPostShopRequest =
        GetPostShopRequest(user_id: user_id);
    GetpostShopResponse bufferGetpostShopResponse = await HttpGetPostShop(
        bufferGetPostShopRequest: bufferGetPostShopRequest);

    int length_post = bufferGetpostShopResponse.bufferPostList.length;
    var key_list = <int>[];
    bufferGetpostShopResponse.bufferPostList.forEach((key, value) async {
      key_list.add(key);
    });
    int _min_post =
        key_list.reduce((value, element) => value < element ? value : element);
    print("${key_list}");
    setState(() {
      min_post = _min_post - 1;
      for (int i in key_list.reversed) {
        BufferListPost.add(bufferGetpostShopResponse.bufferPostList[i]);
      }
    });
  }

  Future<Null> loadhttpGetPostShop() async {
    String user_id = await ShopInfoMamagement().GetShop_id();
    GetPostShopRequest bufferGetPostShopRequest =
        GetPostShopRequest(user_id: user_id, level: min_post);
    GetpostShopResponse bufferGetpostShopResponse = await HttpGetPostShop(
        bufferGetPostShopRequest: bufferGetPostShopRequest);

    int length_post = bufferGetpostShopResponse.bufferPostList.length;
    var key_list = <int>[];
    bufferGetpostShopResponse.bufferPostList.forEach((key, value) async {
      key_list.add(key);
    });
    print("${key_list}");
    int _min_post =
        key_list.reduce((value, element) => value < element ? value : element);
    setState(() {
      min_post = _min_post - 1;
      for (int i in key_list.reversed) {
        BufferListPost.add(bufferGetpostShopResponse.bufferPostList[i]);
      }
    });
  }

  Future<void> PrintMinPost() {
    print("${min_post}");
  }
}
