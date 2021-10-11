import 'package:flutter/cupertino.dart';
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/dataManagement/dataChatBox.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetUserProfileMini.dart';
import 'package:shopder/function/http/httpGetUserProfileMini.dart';

Future<UsersProfileMini> GetUserProfileMini({@required String user_id}) async {
  String host = HostName();
  GetUserProfileMiniRequest bufferGetUserProfileMiniRequest =
      GetUserProfileMiniRequest(user_id: user_id);
  GetUserProfileMiniResponse bufferGetUserProfileMiniResponse =
      await HttpGetUserProfileMini(
          bufferGetUserProfileMiniRequest: bufferGetUserProfileMiniRequest,
          host: host);
  UsersProfileMini user_info = bufferGetUserProfileMiniResponse.user_info;
  return user_info;
}
