import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:shopder/function/http/httpGetImage.dart';

class DataImageManagerProvider with ChangeNotifier {
  Map<String, Uint8List> buffer = {};
  List<String> level = [];
  Future<Uint8List> GetImage(String image_name) async {
    bool have = buffer.containsKey(image_name);
    if (have) {
      return buffer[image_name];
    } else {
      Uint8List image = await HttpGetImage(image_name: image_name);
      level.insert(0, image_name);
      if (level.length >= 101) {
        String _image_name = level.removeAt(101);
        buffer.remove(_image_name);
      }
      notifyListeners();
      return image;
    }
  }
}
