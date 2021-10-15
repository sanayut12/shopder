import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/component/createpost.dart';
import 'package:shopder/MainScreen/post/postbox.dart';
import 'package:shopder/MainScreen/subScreen/subFeed/PostUsersComponent.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostUsers_Data.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostUsers_Init.dart';
import 'package:shopder/function/http/httpGetPostUsers_Data.dart';
import 'package:shopder/function/http/httpGetPostUsers_Init.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  Map<String, GetPostUsersDataResponse> data = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetPost();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xfffa897b), Colors.white])),
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            // return CreatePost();
            if (index == 0) {
              return CreatePost();
            } else {
              String post_users_id = data.keys.toList()[index - 1];
              return PostUsersComponent(data: data[post_users_id]);
            }
          }),
    );
  }

  Future<void> GetPost() async {
    String shop_id = ShopInfoMamagement().GetShop_id();
    GetPostUsersInitRequest bufferGetPostUsersInitRequest =
        GetPostUsersInitRequest(shop_id: shop_id);
    GetPostUsersInitResponse bufferGetPostUsersInitResponse =
        await HttpGetPostUsersInit(
            bufferGetPostUsersInitRequest: bufferGetPostUsersInitRequest);
    print(bufferGetPostUsersInitResponse.bufferPostUser_id);
    for (int i = 0;
        i < bufferGetPostUsersInitResponse.bufferPostUser_id.length;
        i++) {
      String post_users_id =
          bufferGetPostUsersInitResponse.bufferPostUser_id[i];
      GetPostUsersDataRequest bufferGetPostUsersDataRequest =
          GetPostUsersDataRequest(post_users_id: post_users_id);
      GetPostUsersDataResponse _data = await HttpGetPostUsersData(
          bufferGetPostUsersDataRequest: bufferGetPostUsersDataRequest);
      setState(() {
        data[post_users_id] = _data;
      });
    }
  }
}
