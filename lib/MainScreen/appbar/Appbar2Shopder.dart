import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/Secondary/CalendarScreen.dart';
import 'package:shopder/MainScreen/subScreen/Secondary/ChatListScreen.dart';

class AppBar2Shopder extends StatefulWidget {
  int page;
  AppBar2Shopder({@required this.page});
  @override
  _AppBar2ShopderState createState() => _AppBar2ShopderState();
}

class _AppBar2ShopderState extends State<AppBar2Shopder> {
  List<String> buffer = [
    "",
    "ยอดจองสินค้า",
    "สินค้าที่ต้องจัดส่ง",
    "แจ้งเตือน",
    "โปรไฟล์",
  ];
  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(
        fontSize: 20, color: Colors.white, fontFamily: "SukhumvitSet-SemiBold");
    return Container(
      height: 65,
      width: double.infinity,
      color: Color(0xfffa897b),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "${buffer[this.widget.page]}",
              style: style,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ButtonModel(icon: Icons.calendar_today, fun: OpenCalendarScreen),
              ButtonModel(icon: Icons.question_answer, fun: OpenChatListScreen)
            ],
          ),
        ],
      ),
    );
  }

  Future<void> OpenChatListScreen() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => ChatListScreen()));
  }

  Future<void> OpenCalendarScreen() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => CalendarScreen()));
  }
}

class ButtonModel extends StatefulWidget {
  IconData icon;
  final Function fun;
  ButtonModel({@required this.icon, @required this.fun});
  @override
  _ButtonModelState createState() => _ButtonModelState();
}

class _ButtonModelState extends State<ButtonModel> {
  Color color = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          color = Colors.grey[200].withOpacity(0.5);
        });
        await Future.delayed(Duration(milliseconds: 50));
        setState(() {
          color = Colors.transparent;
        });
        this.widget.fun();
      },
      child: Container(
        margin: EdgeInsets.only(right: 5),
        height: 50,
        width: 50,
        alignment: Alignment.center,
        decoration:
            BoxDecoration(color: Colors.white70, shape: BoxShape.circle),
        child: Icon(this.widget.icon),
      ),
    );
  }
}
