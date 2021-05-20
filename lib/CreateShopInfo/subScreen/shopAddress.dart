import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopder/ClassObjects/httpObjectCreateShopInfo.dart';
import 'package:shopder/function/dataManagement/readJsonAddress.dart';

String address, province, district, sub_district;

class ShopAddress extends StatefulWidget {
  final Function nextPage;
  final Function backPage;
  final Function updateShopAddress;
  ShopAddress({this.nextPage, this.backPage, this.updateShopAddress});
  @override
  _ShopAddressState createState() => _ShopAddressState();
}

class _ShopAddressState extends State<ShopAddress> {
  String _province, _district, _sub_district;
  int _post_code = 0;
  TextEditingController _address;
  AddressThailand addressThailand;
  List<String> ListProvince = [];
  List<String> ListDistrict = [];
  List<String> ListSub_District = [];

  Color color_next = Colors.white;
  bool check_next = false;

  void init() async {
    addressThailand = AddressThailand();
    await addressThailand.init();
    List<String> listProvince = await addressThailand.ProvinceKey();
    print(listProvince);
    setState(() {
      ListProvince = listProvince;
    });

    if (province != null) {
      ListDistrict = [];
      List<String> listDistrict =
          await addressThailand.DistrictKey(provinceKey: _province);
      setState(() {
        ListDistrict = listDistrict;
        _district = district;
      });

      if (district != null) {
        ListSub_District = [];
        List<String> listSub_District = await addressThailand.Sub_DistrictKey(
            provinceKey: _province, districtKey: _district);
        setState(() {
          ListSub_District = listSub_District;
          _sub_district = sub_district;

          _post_code = addressThailand.Post_CodeValue(
              provinceKey: _province,
              districtKey: _district,
              sub_districtKey: _sub_district);
        });
      }
    }
    checkNext();
  }

  Future<void> updateDistrictAfterSelectProvince() async {
    district = null;
    _district = null;
    sub_district = null;
    _sub_district = null;
    ListDistrict = [];
    ListSub_District = [];
    List<String> listDistrict =
        await addressThailand.DistrictKey(provinceKey: _province);
    print(listDistrict);
    setState(() {
      ListDistrict = listDistrict;
    });
    _post_code = 0;
    checkNext();
  }

  Future<void> updateSub_DistrictAfterSelectProvince() async {
    sub_district = null;
    _sub_district = null;
    ListSub_District = [];
    List<String> listSub_District = await addressThailand.Sub_DistrictKey(
        provinceKey: _province, districtKey: _district);
    print(listSub_District);
    setState(() {
      ListSub_District = listSub_District;
    });
    _post_code = 0;
    checkNext();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
    _province = province;
    _district = district;
    _sub_district = sub_district;
    _address = TextEditingController(text: address);
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> ItemProvince =
        ListProvince.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem(
        value: value,
        child: Text(
            '${addressThailand.ProvinceValue(provinceKey: value, language: 'th')}'),
      );
    }).toList();

    List<DropdownMenuItem<String>> ItemDistrict =
        ListDistrict.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem(
        value: value,
        child: Text(
            '${addressThailand.DistrictValue(provinceKey: _province, districtKey: value, language: 'th')}'),
      );
    }).toList();

    List<DropdownMenuItem<String>> ItemSub_District =
        ListSub_District.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem(
        value: value,
        child: Text(
            '${addressThailand.Sub_DistrictValue(provinceKey: _province, districtKey: _district, sub_districtKey: value, language: 'th')}'),
      );
    }).toList();

    Widget InputAddress = TextFormField(
      controller: _address,
      onChanged: (e) {
        setState(() {
          address = e;
        });
        if (e == "") {
          setState(() {
            address = null;
          });
        }
        checkNext();
      },
    );

    Widget InputProvince = DropdownButton<String>(
      value: _province,
      items: ItemProvince,
      hint: Text(
        "เลือกจังหวัด",
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      ),
      onChanged: (e) {
        setState(() {
          _province = e;
        });
        province = e;
        updateDistrictAfterSelectProvince();
      },
    );

    Widget InputDistrict = DropdownButton<String>(
      value: _district,
      items: ItemDistrict,
      hint: Text(
        "เลือกอำเภอ",
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      ),
      onChanged: (e) {
        setState(() {
          _district = e;
          district = e;
        });

        updateSub_DistrictAfterSelectProvince();
      },
    );

    Widget InputSub_District = DropdownButton<String>(
      value: _sub_district,
      items: ItemSub_District,
      hint: Text(
        "เลือกตำบล",
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      ),
      onChanged: (e) {
        setState(() {
          _sub_district = e;
          sub_district = e;
          checkNext();
          _post_code = addressThailand.Post_CodeValue(
              provinceKey: _province,
              districtKey: _district,
              sub_districtKey: _sub_district);
        });
      },
    );

    Widget FormAddress = Container(
      height: double.infinity,
      width: double.infinity,
      child: Form(
          child: Column(
        children: [
          InputAddress,
          InputProvince,
          InputDistrict,
          InputSub_District,
          Text("รหัสไปรษณีย์ ${_post_code}")
        ],
      )),
    );

    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          Text("ที่อยู่ร้านค้า"),
          Expanded(
            flex: 8,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: FormAddress,
            ),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      this.widget.backPage();
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      color: Colors.red,
                      alignment: Alignment.center,
                      child: Text('Back'),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (check_next) {
                        UpdateShopAddress();
                        this.widget.nextPage();
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      color: color_next,
                      alignment: Alignment.center,
                      child: Text('Next'),
                    ),
                  )
                ],
              ),
            ),
            flex: 2,
          )
        ],
      ),
    );
  }

  Future UpdateShopAddress() {
    DataShopAddress bufferDataShopAddress = DataShopAddress(
        address: address,
        province: province,
        district: district,
        sub_district: sub_district);
    this.widget.updateShopAddress(bufferDataShopAddress: bufferDataShopAddress);
  }

  Future checkNext() {
    if (address != null &&
        province != null &&
        district != null &&
        sub_district != null) {
      print("next");
      setState(() {
        color_next = Colors.red;
        check_next = true;
      });
    } else {
      print("wait");
      setState(() {
        color_next = Colors.white;
        check_next = false;
      });
    }
  }
}

// addressThailand.DistrictValue(provinceKey: _province, districtKey: value, language: 'th')

// Container(
//       height: double.infinity,
//       width: double.infinity,
//       child: Column(
//         children: [
//           Text("Shop address Page"),
//           RaisedButton(
//             onPressed: () {
//               this.widget.nextPage();
//             },
//             child: Text('next'),
//           ),
//           RaisedButton(
//             onPressed: () {
//               this.widget.backPage();
//             },
//             child: Text('back'),
//           )
//         ],
//       ),
//     );
