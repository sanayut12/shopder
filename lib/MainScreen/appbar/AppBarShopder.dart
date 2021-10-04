import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/appbar/subAppBar/CalandarAppBarComponent.dart';
import 'package:shopder/MainScreen/appbar/subAppBar/ChatAppBarComponent.dart';
import 'package:shopder/MainScreen/appbar/subAppBar/searchAppBarComponent.dart';

// class AppBarShopder extends StatefulWidget {
//   int page;
//   AppBarShopder({@required this.page});
//   @override
//   _AppBarShopderState createState() => _AppBarShopderState();
// }

// class _AppBarShopderState extends State<AppBarShopder> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: MediaQuery.of(context).size.width * 0.2,
//       color: Colors.amber,
//       child: Row(
//         children: [
// Expanded(flex: 4, child: SearchAppBarComponent()),
// Expanded(child: CalendarAppBarComponent()),
// Expanded(child: ChatAppBarComponent()),
//         ],
//       ),
//     );
//   }
// }

AppBar AppbarShopder(Function fun1, double heigth) => AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 55,
      backgroundColor: Color(0xFFFA897B),
      leading: IconButton(
          onPressed: () {
            fun1();
          },
          icon: Icon(Icons.menu)),
      actions: [
        Container(
          margin: EdgeInsets.only(left: 1, top: 5, bottom: 5, right: 1),
          padding: EdgeInsets.all(2),
          decoration:
              BoxDecoration(color: Colors.transparent, shape: BoxShape.circle),
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.calendar_today,
                size: heigth * 0.06,
              )),
        ),
        Container(
          margin: EdgeInsets.only(left: 1, right: 2, top: 5, bottom: 5),
          padding: EdgeInsets.all(2),
          decoration:
              BoxDecoration(color: Colors.transparent, shape: BoxShape.circle),
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.chat,
                size: heigth * 0.06,
              )),
        )
      ],
    );
