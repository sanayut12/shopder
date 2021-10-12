import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/function/dataManagement/readJsonAddress.dart';

class InputSubDistrictShopAddressComponent extends StatefulWidget {
  final String province, district, sub_district;
  final Function setSubDistrict;
  InputSubDistrictShopAddressComponent(
      {@required this.province,
      @required this.district,
      @required this.sub_district,
      @required this.setSubDistrict});
  @override
  _InputSubDistrictShopAddressComponentState createState() =>
      _InputSubDistrictShopAddressComponentState();
}

class _InputSubDistrictShopAddressComponentState
    extends State<InputSubDistrictShopAddressComponent> {
  List<String> ListSub_District = [];
  void init() async {
    if (this.widget.province != null && this.widget.district != null) {
      List<String> _subdistrict = await AddressThailand().Sub_DistrictKey(
          provinceKey: this.widget.province, districtKey: this.widget.district);

      setState(() {
        ListSub_District = _subdistrict;
      });
    } else {
      setState(() {
        ListSub_District = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print("sub district");
    init();

    List<DropdownMenuItem<String>> ItemSub_District =
        ListSub_District.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem(
        value: value,
        child: Text(
            '${AddressThailand().Sub_DistrictValue(provinceKey: this.widget.province, districtKey: this.widget.district, sub_districtKey: value, language: 'th')}'),
      );
    }).toList();
    Widget InputSub_District = DropdownButton<String>(
      value: this.widget.sub_district,
      items: ItemSub_District,
      hint: Text(
        "เลือกตำบล",
        style: TextStyle(
            color: Colors.black,fontFamily: "SukhumvitSet-SemiBold", fontSize:17),
      ),
      onChanged: (e) {
        this.widget.setSubDistrict(e);
      },
    );
    return InputSub_District;
  }
}
