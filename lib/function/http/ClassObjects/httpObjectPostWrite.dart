import 'package:shopder/function/dataManagement/dataWriteFoodPost.dart';

class PostWriteRequest {
  final PostWriteInfo postWriteInfo;
  final String shop_id;
  PostWriteRequest({this.postWriteInfo, this.shop_id});

  Future<Map<String, dynamic>> formatJSON() async {
    var items = {};
    int index = 0;
    postWriteInfo.items.forEach((element) {
      items["$index"] = {
        "name": element.name,
        "type": element.type,
        "image": element.image,
        "quantity": element.quantity,
        "cost": element.cost
      };

      index += 1;
    });

    Map<String, dynamic> data = {
      "shop_id": shop_id,
      "detail": postWriteInfo.detail,
      "items": items,
      "sendcost": postWriteInfo.sendcost,
      "dateClose": {
        "year": postWriteInfo.dateClose.year,
        "month": postWriteInfo.dateClose.month,
        "date": postWriteInfo.dateClose.day,
        "hour": postWriteInfo.dateClose.hour,
        "min": postWriteInfo.dateClose.min
      },
      "dateSend": {
        "year": postWriteInfo.dateSend.year,
        "month": postWriteInfo.dateSend.month,
        "date": postWriteInfo.dateSend.day,
        "hour": postWriteInfo.dateSend.hour,
        "min": postWriteInfo.dateSend.min
      }
    };
    // print(data);
    return data;
  }
}

class PostWriteResponse {
  final String code;
  PostWriteResponse({this.code});
}
