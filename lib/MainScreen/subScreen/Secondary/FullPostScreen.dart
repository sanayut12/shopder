import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/profilescreen/PostBoxProfileComponent.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShopData.dart';

class FullPostScreen extends StatefulWidget {
  GetPostShopDataResponse data;
  FullPostScreen({@required this.data});
  @override
  _FullPostScreenState createState() => _FullPostScreenState();
}

class _FullPostScreenState extends State<FullPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SafeArea(
            child: Container(
          height: double.infinity,
          width: double.infinity,
          child: ListView(
            children: [
              PostBoxProfileComponent(
                data: this.widget.data,
              )
            ],
          ),
        )),
      ),
    );
  }
}
