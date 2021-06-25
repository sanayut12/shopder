import 'package:flutter/cupertino.dart';
import 'package:shopder/function/dataManagement/dateBox.dart';

class PostList {
  final String post_id;
  final String detail;
  final int sendCost;
  final DateBox start;
  final DateBox stop;
  final DateBox send;
  final Map<int, MenuList> bufferMenuList;
  PostList(
      {@required this.post_id,
      @required this.detail,
      @required this.sendCost,
      @required this.start,
      @required this.stop,
      @required this.send,
      this.bufferMenuList});
}

class MenuList {
  final String menu_id;
  final String inventory_id;
  final String name;
  final String type;
  final String path;
  final String status;
  final int quantity;
  final int cost;

  MenuList(
      {@required this.menu_id,
      @required this.inventory_id,
      @required this.name,
      @required this.type,
      @required this.path,
      @required this.status,
      @required this.quantity,
      @required this.cost});
}
