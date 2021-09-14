import 'package:flutter/material.dart';

class ConfirmSendedRequest {
  final String bill_id;
  ConfirmSendedRequest({@required this.bill_id});
  Map<String, dynamic> value() {
    return {"bill_id": this.bill_id};
  }
}

class ConfirmSendedResponse {
  final String code;
  ConfirmSendedResponse({@required this.code});
}
