import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/dataManagement/dataPostShop.dart';

class PostBox extends StatefulWidget {
  // PostBox({@required PostList bufferPostList});
  @override
  _PostBoxState createState() => _PostBoxState();
}

class _PostBoxState extends State<PostBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 8, top: 2),
        decoration: BoxDecoration(
            color: Colors.grey[500],
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Image.network(
          '${HostName()}/image/menuImage/0AD3246B86B391E52B9FA3DF0163E8CB.jpg',
          fit: BoxFit.cover,
        ));
  }
}
