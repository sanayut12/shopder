import 'package:meta/meta.dart';
import 'package:shopder/function/dataManagement/dataOrderPost.dart';

class GetPostBillRequest {
  final String shop_id;
  GetPostBillRequest({@required this.shop_id});

  Map<String, dynamic> value() {
    return {"shop_id": this.shop_id};
  }
}

class GetPostBillResponse {
  final List<Post> bufferPostOrder;
  final Map<String, MenuOrder> menuList;
  final String code;
  GetPostBillResponse(
      {@required this.bufferPostOrder,
      @required this.menuList,
      @required this.code});
}


// class Post