import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/CalendarScreen.dart';
import 'package:shopder/MainScreen/subScreen/ChatListScreen.dart';

class AppBar2Shopder extends StatefulWidget {
  @override
  _AppBar2ShopderState createState() => _AppBar2ShopderState();
}

class _AppBar2ShopderState extends State<AppBar2Shopder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: double.infinity,
      color: Color(0xfffa897b),
      child: Row(
        children: [
          ButtonModel(icon: Icons.chat, fun: OpenChatListScreen),
          ButtonModel(icon: Icons.calendar_today, fun: OpenCalendarScreen)
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
        height: 65,
        width: 65,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: Icon(this.widget.icon),
      ),
    );
  }
}
