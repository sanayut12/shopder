import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/function/dataManagement/Readhostname.dart';

class FullItemConfirmPost_MenuComponent extends StatefulWidget {
  String image, name;
  int quantity, hole, cost;
  FullItemConfirmPost_MenuComponent(
      {@required this.name,
      @required this.image,
      @required this.quantity,
      @required this.hole,
      @required this.cost});
  @override
  _FullItemConfirmPost_MenuComponentState createState() =>
      _FullItemConfirmPost_MenuComponentState();
}

class _FullItemConfirmPost_MenuComponentState
    extends State<FullItemConfirmPost_MenuComponent> {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    Widget ShowImage(String _image) => Container(
          height: weight_screen * 0.1,
          width: weight_screen * 0.1,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(weight_screen * 0.02),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image:
                      NetworkImage("${HostName()}/image/menuImage/${_image}"))),
        );
    TextStyle style = TextStyle(fontSize: weight_screen * 0.03);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
          left: weight_screen * 0.025, right: weight_screen * 0.025),
      // color: Colors.amber,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShowImage(this.widget.image),
          Container(
            width: weight_screen * 0.4,
            padding: EdgeInsets.only(left: 5, right: 2),
            child: Text(
              "${this.widget.name}",
              style: style,
            ),
          ),
          Container(
            width: weight_screen * 0.15,
            alignment: Alignment.center,
            child: Text(
              "${this.widget.quantity}",
              style: style,
            ),
          ),
          Container(
            width: weight_screen * 0.15,
            alignment: Alignment.center,
            child: Text(
              "${this.widget.hole}",
              style: style,
            ),
          ),
          Container(
            width: weight_screen * 0.15,
            alignment: Alignment.center,
            child: Text(
              "${this.widget.cost}",
              style: style,
            ),
          ),
        ],
      ),
    );
  }
}
