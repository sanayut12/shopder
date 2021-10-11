import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:shopder/function/dataManagement/dateBox.dart';

PostWriteInfo postWriteInfo;

class FoodPostManagement {
  Future<void> Save({PostWriteInfo bufferpostWriteInfo}) {
    postWriteInfo = bufferpostWriteInfo;
  }

  Future<PostWriteInfo> Get() async {
    return postWriteInfo;
  }
}

class PostWriteInfo {
  final String detail;
  final List<ItemFoodInfo> items;
  final int sendcost;
  final DateBox dateClose;
  final DateBox dateSend;
  final String how_send, over_order, confirm_order;

  PostWriteInfo(
      {@required this.detail,
      @required this.items,
      @required this.sendcost,
      @required this.dateClose,
      @required this.dateSend,
      @required this.how_send,
      @required this.over_order,
      @required this.confirm_order});
}

class ItemFoodInfo {
  final String name;
  final String type;
  final List<Uint8List> listImage;
  final String detail;
  final int quantity;
  final int cost;

  ItemFoodInfo(
      {@required this.name,
      @required this.type,
      @required this.listImage,
      @required this.detail,
      @required this.quantity,
      @required this.cost});
}
