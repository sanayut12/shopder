import 'package:flutter/cupertino.dart';
import 'package:shopder/function/dataManagement/dataChatBox.dart';

class GetListChatManagerRequest {
  String shop_id;
  GetListChatManagerRequest({@required this.shop_id});
  Map<String, String> value() {
    return {"shop_id": this.shop_id};
  }
}

class GetListChatManagerResponse {
  List<String> bufferChatManager_id;
  Map<String, ChatManager> bufferChatManager;
  Map<String, UsersProfileMini> bufferUserProfileMini;
  String code;
  GetListChatManagerResponse(
      {@required this.bufferChatManager_id,
      @required this.bufferChatManager,
      @required this.bufferUserProfileMini,
      @required this.code});
}
