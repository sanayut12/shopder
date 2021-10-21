import 'package:flutter/cupertino.dart';
import 'package:shopder/module/BackButton.dart';

class FullItemConfirmPost_AppBarComponent extends StatefulWidget {
  @override
  _FullItemConfirmPost_AppBarComponentState createState() =>
      _FullItemConfirmPost_AppBarComponentState();
}

class _FullItemConfirmPost_AppBarComponentState
    extends State<FullItemConfirmPost_AppBarComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: double.infinity,
      child: Row(
        children: [
          BackButton21(),
          Text("รับออเดอร์ลูกค้า",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
