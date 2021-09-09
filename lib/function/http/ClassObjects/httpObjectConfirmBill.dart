import 'package:flutter/material.dart';

class ConfirmBillRequest {
  final String bill_id;
  ConfirmBillRequest({@required this.bill_id});
  Map<String, dynamic> value() {
    return {"bill_id": this.bill_id};
  }
}

class ConfirmBillResponse {
  final String code;
  ConfirmBillResponse({@required this.code});
}
