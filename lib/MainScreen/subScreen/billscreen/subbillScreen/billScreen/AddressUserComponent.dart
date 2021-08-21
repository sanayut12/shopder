import 'package:flutter/cupertino.dart';
import 'package:shopder/function/dataManagement/readJsonAddress.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetAddressUser.dart';

class AddressUserComponent extends StatefulWidget {
  final GetAddressUserResponse getAddressUserResponse;
  AddressUserComponent({@required this.getAddressUserResponse});
  @override
  _AddressUserComponentState createState() => _AddressUserComponentState();
}

class _AddressUserComponentState extends State<AddressUserComponent> {
  String phone = "";
  String address = "";
  String sub_district = "";
  String district = "";
  String province = "";
  int post_code = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setAddress();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
        "${address} ตำบล ${sub_district} อำเภอ ${district} จังหวัด ${province}  ${post_code} เบอร์โทรศัพท์ ${phone}");
  }

  void setAddress() async {
    GetAddressUserResponse data = this.widget.getAddressUserResponse;
    AddressThailand addressThailand = AddressThailand();
    //ข้อมูลที่อยู่ที่ยังไม่ได้แปลง
    String code_sub_district = data.sub_district;
    String code_district = data.district;
    String code_province = data.province;

    //ข้อมูลที่อยู่เมื่อแปลงแล้ว
    String _address = data.address;
    String _sub_district = addressThailand.Sub_DistrictValue(
        provinceKey: code_province,
        districtKey: code_district,
        sub_districtKey: code_sub_district,
        language: "th");
    String _district = addressThailand.DistrictValue(
        provinceKey: code_province, districtKey: code_district, language: "th");
    String _province = addressThailand.ProvinceValue(
        provinceKey: code_province, language: "th");
    int _post_code = addressThailand.Post_CodeValue(
        provinceKey: code_province,
        districtKey: code_district,
        sub_districtKey: code_sub_district);
    String _phone = data.phone;

    setState(() {
      phone = _phone;
      address = _address;
      sub_district = _sub_district;
      district = _district;
      province = _province;
      post_code = _post_code;
    });
  }
}
