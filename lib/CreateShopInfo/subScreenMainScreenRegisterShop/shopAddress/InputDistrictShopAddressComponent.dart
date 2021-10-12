import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/function/dataManagement/readJsonAddress.dart';

class InputDistrictShopAddressComponent extends StatefulWidget {
  final String province, district;
  final Function setDistrict;
  InputDistrictShopAddressComponent(
      {@required this.province,
      @required this.district,
      @required this.setDistrict});
  @override
  _InputDistrictShopAddressComponentState createState() =>
      _InputDistrictShopAddressComponentState();
}

class _InputDistrictShopAddressComponentState
    extends State<InputDistrictShopAddressComponent> {
  List<String> ListDistrict = [];
  void init() async {
    if (this.widget.province != null) {
      List<String> _district = await AddressThailand()
          .DistrictKey(provinceKey: this.widget.province);
      setState(() {
        ListDistrict = _district;
      });
    } else {
      setState(() {
        ListDistrict = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print("district");
    init();
    List<DropdownMenuItem<String>> ItemDistrict =
        ListDistrict.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem(
        value: value,
        child: Text(
            '${AddressThailand().DistrictValue(provinceKey: this.widget.province, districtKey: value, language: 'th')}'),
      );
    }).toList();
    Widget InputDistrict = DropdownButton<String>(
      value: this.widget.district,
      items: ItemDistrict,
      hint: Text(
        "เลือกอำเภอ",
        style: TextStyle(
            color: Colors.black,fontFamily: "SukhumvitSet-SemiBold", fontSize:17),
      ),
      onChanged: (e) {
        this.widget.setDistrict(e);
      },
    );
    return InputDistrict;
  }
}
