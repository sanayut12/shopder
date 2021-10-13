import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostWrite_DetailComponent extends StatefulWidget {
  String text;
  final Function fun1;
  PostWrite_DetailComponent({@required this.text, @required this.fun1});
  @override
  _PostWrite_DetailComponentState createState() =>
      _PostWrite_DetailComponentState();
}

class _PostWrite_DetailComponentState extends State<PostWrite_DetailComponent> {
  @override
  void initState() {
    // TODO: implement initState
    print("============= ${this.widget.text} =============");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(3),
      margin: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[100]),
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[200]),
      child: TextFormField(
        controller: TextEditingController(text: this.widget.text),
        decoration: InputDecoration(
            border: InputBorder.none,
            filled: true,
            labelText: "เพิ่มรายละเอียดของโพสต์"),
            
        maxLines: 5,
        onChanged: (e) {
          this.widget.fun1(e);
        },
      ),
    );
  }
}
