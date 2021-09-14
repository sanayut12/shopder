import 'package:flutter/material.dart';

class ConfirmDoneRequest {
  final String bill_id;
  ConfirmDoneRequest({@required this.bill_id});
  Map<String, dynamic> value() {
    return {"bill_id": this.bill_id};
  }
}

class ConfirmDoneResponse {
  final String code;
  ConfirmDoneResponse({@required this.code});
}
