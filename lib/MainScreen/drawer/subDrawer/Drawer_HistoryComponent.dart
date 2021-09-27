import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Drawer_HistoryComponent extends StatefulWidget {
  @override
  _Drawer_HistoryComponentState createState() =>
      _Drawer_HistoryComponentState();
}

class _Drawer_HistoryComponentState extends State<Drawer_HistoryComponent> {
  @override
  Widget build(BuildContext context) {
    Widget Title = Container(
      child: Text("ประวัติการขาย",
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.06,
          )),
    );

    Widget ButtonModel(
            String message, IconData icon, BoxShape shape, Function fun) =>
        Container(
          height: MediaQuery.of(context).size.width * 0.26,
          width: MediaQuery.of(context).size.width * 0.26,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                decoration:
                    BoxDecoration(shape: shape, color: Color(0xfffa897b)),
                child: Icon(icon),
              ),
              Text("${message}")
            ],
          ),
        );
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Title,
          Row(
            children: [
              ButtonModel(
                  "สำเร็จแล้ว", Icons.trending_up, BoxShape.circle, null),
              ButtonModel("ที่ถูกยกเลิก", Icons.flash_auto_outlined,
                  BoxShape.rectangle, null),
            ],
          )
        ],
      ),
    );
  }
}
