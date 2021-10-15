import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/subFeed/subPostUsers/PostUsers_DetailComponent.dart';
import 'package:shopder/MainScreen/subScreen/subFeed/subPostUsers/PostUsers_ListImageComponent.dart';
import 'package:shopder/MainScreen/subScreen/subFeed/subPostUsers/PostUsers_MiniProfileComponent.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostUsers_Data.dart';

class PostUsersComponent extends StatefulWidget {
  GetPostUsersDataResponse data;
  PostUsersComponent({@required this.data});
  @override
  _PostUsersComponentState createState() => _PostUsersComponentState();
}

class _PostUsersComponentState extends State<PostUsersComponent> {
  @override
  Widget build(BuildContext context) {
    GetPostUsersDataResponse data = this.widget.data;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
      margin: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          PostUsers_MiniProfileComponent(data: data),
          PostUsers_DetailComponent(data: data),
          PostUsers_ShowImageComponent(data: data)
        ],
      ),
    );
  }
}
