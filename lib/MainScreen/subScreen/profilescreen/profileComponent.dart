import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';
import 'package:shopder/function/dataManagement/readJsonAddress.dart';

class ProfileComponent extends StatefulWidget {
  @override
  _ProfileComponentState createState() => _ProfileComponentState();
}

class _ProfileComponentState extends State<ProfileComponent> {
  Uint8List image;
  String name;
  String address;
  String sub_district;
  String district;
  String province;
  int post_code;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetData();
  }

  @override
  Widget build(BuildContext context) {
    Widget ImageProfile = Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      height: 150,
      width: 150,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: image != null
                ? MemoryImage(image)
                : NetworkImage(
                    "https://static.wikia.nocookie.net/doraemon/images/c/c7/2005Doraemon.png/revision/latest?cb=20201017162935&path-prefix=en"),
          )),
    );

    Widget Name = Container(
      child: Text(
        "$name",
        style: TextStyle(
            color: Colors.indigo, fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );

    return Container(
      height: 300,
      width: double.infinity,
      child: Column(
        children: [
          ImageProfile,
          Name,
          Text("$address $sub_district $district $province")
        ],
      ),
    );
  }

  void GetData() async {
    ShopInfoMamagement bufferShopInfoMamagemen = ShopInfoMamagement();
    String _sub_districtKey = await bufferShopInfoMamagemen.GetSub_district();
    String _districtKey = await bufferShopInfoMamagemen.GetDistrict();
    String _provinceKey = await bufferShopInfoMamagemen.GetProvice();

    String _sub_district = await AddressThailand().Sub_DistrictValue(
        provinceKey: _provinceKey,
        districtKey: _districtKey,
        sub_districtKey: _sub_districtKey,
        language: 'th');
    String _district = await AddressThailand().DistrictValue(
        provinceKey: _provinceKey, districtKey: _districtKey, language: 'th');
    String _province = await AddressThailand()
        .ProvinceValue(provinceKey: _provinceKey, language: 'th');
    int _post_code = await AddressThailand().Post_CodeValue(
        provinceKey: _provinceKey,
        districtKey: _districtKey,
        sub_districtKey: _sub_districtKey);

    // print("$_sub_district $_district $_province $_post_code");
    setState(() {
      image = bufferShopInfoMamagemen.GetImageShop();
      name = bufferShopInfoMamagemen.GetName();
      address = bufferShopInfoMamagemen.GetAddress();

      sub_district = _sub_district;
      district = _district;
      province = _province;
    });
  }
}
