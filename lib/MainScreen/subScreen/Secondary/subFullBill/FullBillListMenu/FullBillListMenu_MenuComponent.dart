import 'package:flutter/cupertino.dart';
import 'package:shopder/function/dataManagement/Readhostname.dart';

class FullBillListMenu_MenuComponent extends StatefulWidget {
  String name, image;

  int quantity, cost;
  FullBillListMenu_MenuComponent(
      {@required this.name,
      @required this.image,
      @required this.quantity,
      @required this.cost});
  @override
  _FullBillListMenu_MenuComponentState createState() =>
      _FullBillListMenu_MenuComponentState();
}

class _FullBillListMenu_MenuComponentState
    extends State<FullBillListMenu_MenuComponent> {
  @override
  Widget build(BuildContext context) {
    Widget ShowImage = Container(
      height: MediaQuery.of(context).size.width * 0.1,
      width: MediaQuery.of(context).size.width * 0.1,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "${HostName()}/image/menuImage/${this.widget.image}"))),
    );
    Widget ShowName = Container(
      padding: EdgeInsets.only(left: 20),
      width: MediaQuery.of(context).size.width * 0.3,
      child: Text("${this.widget.name}"),
    );
    Widget ShowQuantity = Container(
      alignment: Alignment.center,
      child: Text("${this.widget.quantity}"),
    );

    Widget ShowCost = Container(
      alignment: Alignment.center,
      child: Text("${this.widget.cost}"),
    );

    Widget ShowTotal = Container(
      alignment: Alignment.center,
      child: Text("${this.widget.quantity * this.widget.cost}"),
    );
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Row(
            children: [ShowImage, ShowName],
          ),
          Expanded(child: ShowQuantity),
          Expanded(child: ShowCost),
          Expanded(child: ShowTotal)
        ],
      ),
    );
  }
}
