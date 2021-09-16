import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopder/CreateShopInfo/component/ButtomBarComponent.dart';
import 'package:shopder/CreateShopInfo/subScreenMainScreenRegisterShop/shopAddress/InputDistrictShopAddressComponent.dart';
import 'package:shopder/CreateShopInfo/subScreenMainScreenRegisterShop/shopAddress/InputProvinceShopAddressComponent.dart';
import 'package:shopder/CreateShopInfo/subScreenMainScreenRegisterShop/shopAddress/InputSubDistrictShopAddressComponent.dart';
import 'package:shopder/FirstScreen/register.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';
import 'package:shopder/function/dataManagement/readJsonAddress.dart';
// import 'package:shopder/function/http/ClassObjects/httpObjectCreateShopInfo.dart';

class ShopAddressSubScreen extends StatefulWidget {
  final DataShopAddress dataShopAddress;
  final Function setdataShopAddress;
  ShopAddressSubScreen({
    @required this.dataShopAddress,
    @required this.setdataShopAddress,
  });

  @override
  _ShopAddressSubScreenState createState() => _ShopAddressSubScreenState();
}

class _ShopAddressSubScreenState extends State<ShopAddressSubScreen> {
  //ส่วนของข้อมูล
  String address = "", no = "", moo = "", baan = "", road = "", soy = "";
  String province, district, sub_district = null;

  int post_code = 0;

  int active = 0;
  AddressThailand addressThailand;
  TextEditingController _address, _no, _moo, _baan, _road, _soy;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (this.widget.dataShopAddress != null) {
      setState(() {
        address = this.widget.dataShopAddress.address;
        no = this.widget.dataShopAddress.no;
        moo = this.widget.dataShopAddress.moo;
        baan = this.widget.dataShopAddress.baan;
        road = this.widget.dataShopAddress.road;
        soy = this.widget.dataShopAddress.soy;
        province = this.widget.dataShopAddress.province;
        district = this.widget.dataShopAddress.district;
        sub_district = this.widget.dataShopAddress.sub_district;

        _address = TextEditingController(text: address);
        _no = TextEditingController(text: no);
        _moo = TextEditingController(text: moo);
        _baan = TextEditingController(text: baan);
        _road = TextEditingController(text: road);
        _soy = TextEditingController(text: soy);
      });
      CheckActive();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget InputAddress = TextFormField(
      controller: _address,
      onChanged: (e) {
        address = e;
      },
    );
    Widget InputNo = TextFormField(
      controller: _no,
      onChanged: (e) {
        no = e;
      },
    );
    Widget InputMoo = TextFormField(
      controller: _moo,
      onChanged: (e) {
        moo = e;
      },
    );
    Widget InputBaan = TextFormField(
      controller: _baan,
      onChanged: (e) {
        baan = e;
      },
    );
    Widget InputRoad = TextFormField(
      controller: _road,
      onChanged: (e) {
        road = e;
      },
    );
    Widget InputSoy = TextFormField(
      controller: _soy,
      onChanged: (e) {
        soy = e;
      },
    );

    //   return Container(
    //     height: double.infinity,
    //     width: double.infinity,
    //     child: ListView(
    //       children: [
    //         Text("เพิ่มเติม"),
    //         InputAddress,
    //         Text("บ้านเลขที่"),
    //         InputNo,
    //         Text("หมู่ที่"),
    //         InputMoo,
    //         Text("หมู่บ้าน"),
    //         InputBaan,
    //         Text("ถนน"),
    //         InputRoad,
    //         Text("ซอย"),
    //         InputSoy,
    //         InputProvinceShopAddressComponent(
    //             province: province, setProvince: setProvince),
    //         InputDistrictShopAddressComponent(
    //             province: province, district: district, setDistrict: setDistrict),
    //         InputSubDistrictShopAddressComponent(
    //             province: province,
    //             district: district,
    //             sub_district: sub_district,
    //             setSubDistrict: setSubDistrict),
    //         Text("รหัสไปรษณีย์ ${post_code == 0 ? '' : post_code}"),
    //         ButtomBarComponent(
    //             textbuttom1: "กลับ",
    //             func1: setDataShopAddressBackPage,
    //             active1: 1,
    //             textbuttom2: "ต่อไป",
    //             func2: setDataShopAddress,
    //             active2: active)
    //       ],
    //     ),
    //   );
    // }
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(20),
          height: double.infinity,
          width: double.infinity,
          child: ListView(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                          width: 60,
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 35,
                          )),
                    ),
                    Container(
                      child: Text(
                        "รายละเอียดของร้านค้า",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontFamily: "SukhumvitSet-Bold"),
                      ),
                    ),
                  ],
                ),
                margin: EdgeInsets.only(bottom: 25),
              ),

              Text("เพิ่มเติม"),
              InputAddress,
              Text("เลขที่"),
              InputNo,
              Text("หมู่ที่"),
              InputMoo,
              Text("หมู่บ้าน"),
              InputBaan,
              Text("ถนน"),
              InputRoad,
              // Text("ซอย"),
              // InputSoy,
              InputProvinceShopAddressComponent(
                  province: province, setProvince: setProvince),
              InputDistrictShopAddressComponent(
                  province: province,
                  district: district,
                  setDistrict: setDistrict),
              InputSubDistrictShopAddressComponent(
                  province: province,
                  district: district,
                  sub_district: sub_district,
                  setSubDistrict: setSubDistrict),
              Text("รหัสไปรษณีย์ ${post_code == 0 ? '' : post_code}"),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ButtomBarComponent(
                textbuttom1: "กลับ",
                func1: setDataShopAddressBackPage,
                active1: 1,
                textbuttom2: "ถัดไป",
                func2: setDataShopAddress,
                active2: active),
          ],
        )
      ],
    );
  }

  Future<void> setProvince(String _province) {
    print(_province);
    setState(() {
      province = _province;
      district = null;
      sub_district = null;
      post_code = 0;
    });
    CheckActive();
  }

  Future<void> setDistrict(String _district) {
    setState(() {
      district = _district;
      sub_district = null;
      post_code = 0;
    });
    CheckActive();
  }

  Future<void> setSubDistrict(String _subdistrict) {
    setState(() {
      sub_district = _subdistrict;
    });
    CheckActive();
  }

  Future<void> setDataShopAddress() {
    DataShopAddress dataShopAddress = DataShopAddress(
        address: address,
        no: no,
        moo: moo,
        baan: baan,
        road: road,
        soy: soy,
        sub_district: sub_district,
        district: district,
        province: province);
    this.widget.setdataShopAddress(dataShopAddress, 1);
  }

  Future<void> setDataShopAddressBackPage() {
    DataShopAddress dataShopAddress = DataShopAddress(
        address: address,
        no: no,
        moo: moo,
        baan: baan,
        road: road,
        soy: soy,
        sub_district: sub_district,
        district: district,
        province: province);
    this.widget.setdataShopAddress(dataShopAddress, -1);
  }

  Future<void> CheckActive() {
    if (province != null && district != null && sub_district != null) {
      setPostCode();
      setState(() {
        active = 1;
      });
    } else {
      setState(() {
        active = 0;
      });
    }
  }

  Future<void> setPostCode() {
    int _post_code = AddressThailand().Post_CodeValue(
        provinceKey: province,
        districtKey: district,
        sub_districtKey: sub_district);
    setState(() {
      post_code = _post_code;
    });
  }
}
