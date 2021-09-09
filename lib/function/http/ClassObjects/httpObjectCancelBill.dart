import 'package:flutter/material.dart';

class CancelBillRequest {
  final String bill_id;
  CancelBillRequest({@required this.bill_id});
  Map<String, dynamic> value() {
    return {"bill_id": this.bill_id};
  }
}

class CancelBillResponse {
  final String code;
  CancelBillResponse({@required this.code});
}
