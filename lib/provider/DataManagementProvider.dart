import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shopder/function/dataManagement/dataChatBox.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';
import 'package:shopder/function/dataManagement/storageFunction.dart';
import 'package:shopder/module/socketioManagerForgound.dart';
import 'package:shopder/provider/GetUserProfileMini.dart';
import 'package:shopder/provider/type5.dart';

class DataManagementProvider with ChangeNotifier {
  void initSocket() async {
    String shop_id = ShopInfoMamagement().GetShop_id();
    print("init state provider ${shop_id}");
    SocketioManagerForgound().subscript("shopder:${shop_id}", RecieveSocket);
  }

  //////ส่วนของจัดการภาษา////////
  String language = "th";
  String LanguageValue() {
    return language;
  }

  void ChangeLanguage(String _language) async {
    language = _language;
    InsertDataToStorage(key: "SHOPDERLANGUAGE", buffer: '${_language}');
    notifyListeners();
  }

  //ข้อมูลร้านค้า
  Map<String, UsersProfileMini> bufferUsersProfileMini = {};

  ///ส่วนของแชต
  List<String> ChatRead = [];
  List<String> ChatSort = []; //ลิสส์ที่เก็บรายการ รหัสห้องแชต chatmanager_id
  Map<String, ChatManager> bufferChatmanager = {}; //< chatmanager_id, data>
  Map<String, ChatBox> bufferChatBox = {}; //<chatmessage_id . data>

  void RecieveSocket(String message) async {
    Map dataJson = json.decode(message);
    print(dataJson);
    String type = dataJson['type'];
    if (type == "5") {
      Type5 dataType5 = Type5(dataJson: dataJson);

      ///เช็คว่ามีข้อมูล ของ shop ไหม
      String user_id = dataType5.ToUser_id();
      if (!bufferUsersProfileMini.containsKey(user_id)) {
        UsersProfileMini usersProfileMini =
            await GetUserProfileMini(user_id: user_id);
        bufferUsersProfileMini[user_id] = usersProfileMini;
      }
      String chatmanager_id = dataType5.Tochatmanager_id();
      String chatmessage_id = dataType5.Tochatmessage_id();

      ChatManager chatManager = dataType5.ToChatManager();
      ChatBox chatBox = await dataType5.ToChatBox();
      print(chatBox.message);

      if (!bufferChatmanager.containsKey(chatmanager_id)) {
        bufferChatmanager[chatmanager_id] = chatManager;
      }
      bufferChatBox[chatmessage_id] = chatBox;
      ChatSort.remove(chatmanager_id);
      ChatSort.insert(0, chatmanager_id);
      // ChatSort
      notifyListeners();
    }

    // bufferChatBox.forEach((key, value) {
    //   print(value.message);
    // });
  }

  void AddShopProfileMini(
      String user_id, UsersProfileMini usersProfileMini) async {
    bool check = bufferUsersProfileMini.containsKey(user_id);
    if (!check) {
      bufferUsersProfileMini[user_id] = usersProfileMini;
      notifyListeners();
    }
  }

  void AddChatmanager(String chatmanager_id, ChatManager chatManager) async {
    bool check = bufferChatmanager.containsKey(chatmanager_id);
    if (!check) {
      bufferChatmanager[chatmanager_id] = chatManager;
      notifyListeners();
    }
  }

  void AddChatSort(String chatmanager_id) async {
    bool check = ChatSort.contains(chatmanager_id);
    if (!check) {
      ChatSort.add(chatmanager_id);
      notifyListeners();
    }
  }

  void AddUsers(String user_id, UsersProfileMini usersProfileMiniasync) {
    bufferUsersProfileMini[user_id] = usersProfileMiniasync;
    notifyListeners();
  }

  void AddChatBox(String chatmessage_id, ChatBox chatBox) {
    bufferChatBox[chatmessage_id] = chatBox;
    notifyListeners();
  }
}
