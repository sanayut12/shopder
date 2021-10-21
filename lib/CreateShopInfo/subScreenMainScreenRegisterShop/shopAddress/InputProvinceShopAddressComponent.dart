import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/function/dataManagement/readJsonAddress.dart';

class InputProvinceShopAddressComponent extends StatefulWidget {
  final String province;
  final Function setProvince;
  InputProvinceShopAddressComponent(
      {@required this.province, @required this.setProvince});
  @override
  _InputProvinceShopAddressComponentState createState() =>
      _InputProvinceShopAddressComponentState();
}

class _InputProvinceShopAddressComponentState
    extends State<InputProvinceShopAddressComponent> {
  List<String> ListProvince = [];

  void init() async {
    List<String> _province = await AddressThailand().ProvinceKey();
    setState(() {
      ListProvince = _province;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> ItemProvince =
        ListProvince.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem(
        value: value,
        child: Text(
            '${AddressThailand().ProvinceValue(provinceKey: value, language: 'th')}'),
      );
    }).toList();

    Widget InputProvince = DropdownButton<String>(
      value: this.widget.province,
      items: ItemProvince,
      hint: Text(
        "เลือกจังหวัด",
        style: TextStyle(
            color: Colors.black,fontFamily: "SukhumvitSet-SemiBold", fontSize:17),
      ),
      onChanged: (e) {
        this.widget.setProvince(e);
      },
    );
    return InputProvince;
  }
}
