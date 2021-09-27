import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchAppBarComponent extends StatefulWidget {
  @override
  _SearchAppBarComponentState createState() => _SearchAppBarComponentState();
}

class _SearchAppBarComponentState extends State<SearchAppBarComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
    );
  }
}
