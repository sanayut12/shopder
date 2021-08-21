import 'package:flutter/cupertino.dart';

class ConfirmItemRequest {
  final String item_id;
  ConfirmItemRequest({@required this.item_id});

  Map<String, dynamic> value() {
    return {'item_id': this.item_id};
  }
}

class ConfirmItemResponse {
  final String code;
  ConfirmItemResponse({@required this.code});
}
