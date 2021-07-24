import 'package:flutter/cupertino.dart';
import 'package:shopder/function/dataManagement/dateBox.dart';

class GetOrderInventoryRequest {
  final String inventory_id;
  GetOrderInventoryRequest({@required this.inventory_id});

  Map<String, String> value() {
    return {"inventory_id": this.inventory_id};
  }
}

class GetOrderInventoryResponse {
  Map<int, InventoryWait> bufferInventoryWait;
  Map<int, InventoryConfirm> bufferInventoryConfirm;
  Map<String, UserInventory> bufferUserInventory;
  final String code;
  GetOrderInventoryResponse(
      {@required this.bufferInventoryWait,
      @required this.bufferInventoryConfirm,
      @required this.bufferUserInventory,
      @required this.code});
}

class InventoryWait {
  final String item_id, bill_id, inventor_id, user_id, comment, status;
  final int quantity;
  final DateBox date_time;
  InventoryWait(
      {@required this.item_id,
      @required this.bill_id,
      @required this.inventor_id,
      @required this.user_id,
      @required this.quantity,
      @required this.comment,
      @required this.date_time,
      @required this.status});
}

class InventoryConfirm {
  final String item_id, bill_id, inventor_id, user_id, comment, status;
  final int quantity;
  final DateBox date_time;
  InventoryConfirm(
      {@required this.item_id,
      @required this.bill_id,
      @required this.inventor_id,
      @required this.user_id,
      @required this.quantity,
      @required this.comment,
      @required this.date_time,
      @required this.status});
}

class UserInventory {
  final String name, image;
  UserInventory({@required this.name, @required this.image});
}
