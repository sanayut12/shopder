import 'package:flutter/material.dart';

class ConfirmSendingRequest {
  final String bill_id;
  ConfirmSendingRequest({@required this.bill_id});
  Map<String, dynamic> value() {
    return {"bill_id": this.bill_id};
  }
}

class ConfirmSendingResponse {
  final String code;
  ConfirmSendingResponse({@required this.code});
}
