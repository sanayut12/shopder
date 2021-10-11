import 'package:flutter/cupertino.dart';
import 'package:shopder/function/dataManagement/dataChatBox.dart';

class GetUserProfileMiniRequest {
  String user_id;
  GetUserProfileMiniRequest({@required this.user_id});

  Map<String, String> value() {
    return {"user_id": this.user_id};
  }
}

class GetUserProfileMiniResponse {
  UsersProfileMini user_info;
  String code;
  GetUserProfileMiniResponse({@required this.user_info, @required this.code});
}
