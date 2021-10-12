import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostWrite_AppBarComponent extends StatefulWidget {
  final Function fun;
  PostWrite_AppBarComponent({@required this.fun});
  @override
  _PostWrite_AppBarComponentState createState() =>
      _PostWrite_AppBarComponentState();
}

class _PostWrite_AppBarComponentState extends State<PostWrite_AppBarComponent> {
  @override
  Widget build(BuildContext context) {
    Widget BackButton = GestureDetector(
      onTap: () {
        Back();
      },
      child: Container(
          height: 65,
          width: 65,
          alignment: Alignment.center,
          child: Icon(
            Icons.arrow_back_ios,
            size: 40,
          )),
    );
    Widget Title = Text("สร้างโพสต์");
    return Container(
      height: 65,
      width: double.infinity,
      color: Color(0xFFFA897B),
      child: Row(
        children: [
          BackButton,
          Title,
          ButtonModel(text: "โพสต์", fun: this.widget.fun),
        ],
      ),
    );
  }

  Future<void> Back() async {
    Navigator.of(context).pop();
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
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[200]),
              color: color,
              borderRadius: BorderRadius.circular(10)),
          child: Text("${this.widget.text}"),
        ));
  }
}
