import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpaceScreen extends StatefulWidget {
  @override
  _SpaceScreenState createState() => _SpaceScreenState();
}

class _SpaceScreenState extends State<SpaceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Text("Hello"),
        ),
      ),
    );
  }
}
