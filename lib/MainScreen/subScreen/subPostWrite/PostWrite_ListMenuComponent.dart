import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/subPostWrite/PostWrite_MenuComponent.dart';
import 'package:shopder/function/dataManagement/dataWriteFoodPost.dart';

class PostWrite_ListMenuComponent extends StatefulWidget {
  List<ItemFoodInfo> bufferItemFoodInfo;
  final Function AddMenu;
  PostWrite_ListMenuComponent(
      {@required this.bufferItemFoodInfo, @required this.AddMenu});
  @override
  _PostWrite_ListMenuComponentState createState() =>
      _PostWrite_ListMenuComponentState();
}

class _PostWrite_ListMenuComponentState
    extends State<PostWrite_ListMenuComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          // color: Colors.grey[100],
          height: this.widget.bufferItemFoodInfo.length == 0 ? 0 : 300,
          width: double.infinity,
          child: ListView.builder(
              itemCount: this.widget.bufferItemFoodInfo.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return PostWrite_MenuComponent(
                    item: this.widget.bufferItemFoodInfo[index]);
              }),
        ),
        ButtonModel(text: "เพิ่มสินค้า", fun: this.widget.AddMenu),
      ],
    );
  }
}

class ButtonModel extends StatefulWidget {
  String text;
  Function fun;
  ButtonModel({@required this.text, @required this.fun});

  @override
  _ButtonModelState createState() => _ButtonModelState();
}

class _ButtonModelState extends State<ButtonModel> {
  Color color = Color(0xFFFA897B);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          setState(() {
            color = Colors.white;
          });
          await Future.delayed(Duration(milliseconds: 50));
          setState(() {
            color = Color(0xFFFA897B);
          });
          this.widget.fun();
        },
        child: Container(
          margin: EdgeInsets.only(right: 15, top: 10),
          padding: EdgeInsets.only(top: 10,bottom: 10,right: 15,left: 15),
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
              border: Border.all(color: Colors.grey[300]),
            // color: color,
              borderRadius: BorderRadius.circular(20)),
          child: Text("${this.widget.text}"),
        ));
  }
}
