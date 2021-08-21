import 'package:meta/meta.dart';
import 'package:shopder/function/dataManagement/dateBox.dart';

class GetBillRequest {
  final String post_id;
  GetBillRequest({@required this.post_id});

  Map<String, dynamic> value() {
    return {"post_id": this.post_id};
  }
}

class GetBillResponse {
  final List<Bill> bufferBill;
  final Map<String, UserBill> bufferUserBill;
  final String code;
  GetBillResponse(
      {@required this.bufferBill,
      @required this.bufferUserBill,
      @required this.code});
}

class Bill {
  final String bill_id, address_user_id, user_id, send;
  final DateBox date;

  Bill(
      {@required this.bill_id,
      @required this.address_user_id,
      @required this.user_id,
      @required this.date,
      @required this.send});
}

class UserBill {
  final String name, image;
  UserBill({@required this.name, @required this.image});
}
