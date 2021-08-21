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
  final List<InventoryWait> bufferInventoryWait;
  final List<InventoryConfirm> bufferInventoryConfirm;
  final List<InventoryCancel> bufferInventoryCancel;
  final Map<String, UserInventory> bufferUserInventory;

  final String code;
  GetOrderInventoryResponse(
      {@required this.bufferInventoryWait,
      @required this.bufferInventoryConfirm,
      @required this.bufferInventoryCancel,
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
  InventoryConfirm changeToInventoryConfirm() {
    InventoryConfirm inventoryConfirm = InventoryConfirm(
        item_id: this.item_id,
        bill_id: this.bill_id,
        inventor_id: this.inventor_id,
        user_id: this.user_id,
        quantity: this.quantity,
        comment: this.comment,
        date_time: this.date_time,
        status: this.status);
    return inventoryConfirm;
  }

  InventoryCancel changeToInventoryCancel() {
    InventoryCancel inventoryCancel = InventoryCancel(
        item_id: this.item_id,
        bill_id: this.bill_id,
        inventor_id: this.inventor_id,
        user_id: this.user_id,
        quantity: this.quantity,
        comment: this.comment,
        date_time: this.date_time,
        status: this.status);

    return inventoryCancel;
  }
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

class InventoryCancel {
  final String item_id, bill_id, inventor_id, user_id, comment, status;
  final int quantity;
  final DateBox date_time;
  InventoryCancel(
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
