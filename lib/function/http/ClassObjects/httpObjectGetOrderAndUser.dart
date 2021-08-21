import 'package:meta/meta.dart';
import 'package:shopder/function/dataManagement/dateBox.dart';

class GetOrderAndUserRequest {
  final String inventory_id;
  GetOrderAndUserRequest({@required this.inventory_id});

  Map<String, dynamic> value() {
    return {"inventory_id": this.inventory_id};
  }
}

class GetOrderAndUserResponse {
  final Map<String, InventoryBill> bufferInventoryBill;
  final String code;

  GetOrderAndUserResponse(
      {@required this.bufferInventoryBill, @required this.code});
}

class InventoryBill {
  final String item_id, bill_id, inventory_id, user_id, comment;
  final int quantity;
  final DateBox date_time, date_shop;

  InventoryBill(
      {@required this.item_id,
      @required this.bill_id,
      @required this.inventory_id,
      @required this.user_id,
      @required this.comment,
      @required this.quantity,
      @required this.date_shop,
      @required this.date_time});
}
