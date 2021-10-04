import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/component/createpost.dart';
import 'package:shopder/MainScreen/post/postbox.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
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
      child: ListView(
        // padding: EdgeInsets.only(left: 10, right: 10),
        children: [
          CreatePost(),
          // PostBox(),
          // PostBox(),
          // PostBox(),
          // PostBox(),
          // PostBox(),
          // PostBox(),
          // PostBox(),
          // PostBox(),
          // PostBox(),
          // PostBox(),
          // PostBox(),
        ],
      ),
    );
  }
}
