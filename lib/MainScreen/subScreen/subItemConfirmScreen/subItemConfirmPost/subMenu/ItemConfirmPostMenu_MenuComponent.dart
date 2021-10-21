import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/function/dataManagement/Readhostname.dart';

class ItemConfirmPostMenu_MenuComponent extends StatefulWidget {
  String image, name;
  int quantity, hole, cost;
  ItemConfirmPostMenu_MenuComponent(
      {@required this.name,
      @required this.image,
      @required this.quantity,
      @required this.hole,
      @required this.cost});
  @override
  _ItemConfirmPostMenu_MenuComponentState createState() =>
      _ItemConfirmPostMenu_MenuComponentState();
}

class _ItemConfirmPostMenu_MenuComponentState
    extends State<ItemConfirmPostMenu_MenuComponent> {
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShowImage(this.widget.image),
          Container(
            width: weight_screen * 0.34,
            padding: EdgeInsets.only(left: 2, right: 2),
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
            // color: Colors.red,
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
