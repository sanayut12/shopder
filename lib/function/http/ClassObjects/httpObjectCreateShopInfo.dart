import 'package:meta/meta.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';

class ShopInfoCreateRequest {
  final String user_id;
  final DataShopDetail dataShopDetail;
  final DataShopAddress dataShopAddress;
  final DataShopPosition dataShopPosition;

  ShopInfoCreateRequest(
      {@required this.user_id,
      @required this.dataShopDetail,
      @required this.dataShopAddress,
      @required this.dataShopPosition});

  Map<String, dynamic> value() {
    return {
      'user_id': this.user_id,

      /// รายละเอียดร้านค้า
      'name': this.dataShopDetail.name,
      'image': this.dataShopDetail.image,
      'type': this.dataShopDetail.type,

      ///ที่อยู่ร้านค้า
      'address': this.dataShopAddress.address,
      'no': this.dataShopAddress.no,
      'moo': this.dataShopAddress.moo,
      'baan': this.dataShopAddress.baan,
      'road': this.dataShopAddress.road,
      'soy': this.dataShopAddress.soy,
      'sub_district': this.dataShopAddress.sub_district,
      'district': this.dataShopAddress.district,
      'province': this.dataShopAddress.province,

      ///ตำแหน่งร้านค้า
      'latitude': this.dataShopPosition.latitude,
      'longtitude': this.dataShopPosition.longtitude
    };
  }
}

class ShopInfoCreateResponse {
  final ShopInfoCreateDataResponse shopInfoCreateDataResponse;
  final int code;

  ShopInfoCreateResponse({this.shopInfoCreateDataResponse, this.code});
}

class ShopInfoCreateDataResponse {
  final String shop_id;

  ShopInfoCreateDataResponse({this.shop_id});
}
