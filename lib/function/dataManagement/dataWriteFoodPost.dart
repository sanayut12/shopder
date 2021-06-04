import 'dart:typed_data';

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

  PostWriteInfo(
      {this.detail, this.items, this.sendcost, this.dateClose, this.dateSend});
}

class ItemFoodInfo {
  final String name;
  final String type;
  final Uint8List image;
  final int quantity;
  final int cost;

  ItemFoodInfo({this.name, this.type, this.image, this.quantity, this.cost});
}
