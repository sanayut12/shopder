import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopder/function/dataManagement/dataChatBox.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetListChatManager.dart';
import 'package:shopder/function/httpbackground/object/httpObjectNotificationPostShopBuy.dart';

var client = http.Client();
Map<String, String> Header = {
  'Content-Type': 'application/json; charset=UTF-8',
};

Future<GetListChatManagerResponse> HttpGetListChatManager(
    {@required GetListChatManagerRequest bufferGetListChatManagerRequest,
    @required String host}) async {
  var body = bufferGetListChatManagerRequest.value();

  var url = Uri.parse("${host}/chat/chatGetListChatManager");
  var uriResponse = await client.post(
    url,
    body: jsonEncode(body),
    headers: Header,
  );

  var res = jsonDecode(uriResponse.body);
  print(res);
  Map<String, UsersProfileMini> bufferUsersProfileMini = {};
  List<String> ChatSort = [];
  Map<String, ChatManager> bufferChatmanager = {}; //< chatmanager_id, data>
  String code = res['code'];
  List list_chatmanager_id = res['data']['list_chatmanager_id'];
  Map chatmanager = res['data']['chatmanager'];
  Map users = res['data']['users'];

  list_chatmanager_id.forEach((element) {
    ChatSort.add(element);
  });

  chatmanager.forEach((key, value) {
    bufferChatmanager[key] =
        ChatManager(shop_id: value['shop_id'], user_id: value['user_id']);
  });
  users.forEach((key, value) {
    bufferUsersProfileMini[key] =
        UsersProfileMini(name: value['name'], image: value['image']);
  });
  return GetListChatManagerResponse(
      bufferChatManager_id: ChatSort,
      bufferChatManager: bufferChatmanager,
      bufferUserProfileMini: bufferUsersProfileMini,
      code: code);
}
