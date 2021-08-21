import 'package:flutter/cupertino.dart';

class CancelItemRequest {
  final String item_id;
  CancelItemRequest({@required this.item_id});
  Map<String, dynamic> value() {
    return {'item_id': this.item_id};
  }
}

class CancelItemResponse {
  final String code;
  CancelItemResponse({@required this.code});
}
