import 'dart:ui';

import 'package:flutter/material.dart';

class PostBox extends StatefulWidget {
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
          'https://static.wikia.nocookie.net/doraemon/images/c/c7/2005Doraemon.png/revision/latest?cb=20201017162935&path-prefix=en',
          fit: BoxFit.cover,
        ));
  }
}
