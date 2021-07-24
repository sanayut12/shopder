import 'package:flutter/cupertino.dart';
import 'package:shopder/function/dataManagement/dateBox.dart';

class Post {
  final String post_id, detail, how_send;
  final int sendCost;
  final DateBox start, stop, send;

  Post(
      {@required this.post_id,
      @required this.detail,
      @required this.how_send,
      @required this.sendCost,
      @required this.start,
      @required this.stop,
      @required this.send});
}

//////////////////////////////////////////////////////////////

class MenuOrder {
  Map<int, Menu> bufferMenu;
  MenuOrder({@required this.bufferMenu});

  int length() {
    return this.bufferMenu.length;
  }
}

class Menu {
  final String inventory_id, menu_id, name, type, path, status;
  final int cost, quantity;

  Menu(
      {@required this.inventory_id,
      @required this.menu_id,
      @required this.name,
      @required this.quantity,
      @required this.cost,
      @required this.type,
      @required this.path,
      @required this.status});
}
