import 'package:shopder/function/http/ClassObjects/httpGetPostShopItemData.dart';
import 'package:shopder/function/http/httpGetPostShopItemData.dart';

Future<GetPostShopItemDataResposne> Page1GotoFullItemConfirmScreen(
    String post_id) async {
  GetPostShopItemDataRequest bufferGetPostShopItemDataRequest =
      GetPostShopItemDataRequest(post_id: post_id);
  GetPostShopItemDataResposne data = await HttpGetPostShopItemData(
      bufferGetPostShopItemDataRequest: bufferGetPostShopItemDataRequest);
  return data;
}
