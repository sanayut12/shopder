import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/function/dataManagement/readJsonAddress.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShopBillData.dart';

class FullBill_detailComponent extends StatefulWidget {
  String bill_id;
  GetPostShopBillDataResposne data;
  FullBill_detailComponent({@required this.bill_id, @required this.data});

  @override
  _FullBill_detailComponentState createState() =>
      _FullBill_detailComponentState();
}

class _FullBill_detailComponentState extends State<FullBill_detailComponent> {
  @override
  Widget build(BuildContext context) {
    String addressText = "";
    if (this.widget.data.bufferBill[this.widget.bill_id].how_send == "2") {
    } else {
      String address_user_id =
          this.widget.data.bufferBill[this.widget.bill_id].address_user_id;

      PostShopBill_Address_user address =
          this.widget.data.bufferAddressUser[address_user_id];
      String name = address.name;
      String phone = address.phone;

      String _address = address.address;
      String no = address.no;
      String moo = address.moo;
      String baan = address.baan;
      String road = address.road;
      String soy = address.soy;

      String _sub_district = address.sub_district;
      String _district = address.district;
      String _province = address.province;

      String sub_district = AddressThailand().Sub_DistrictValue(
          provinceKey: _province,
          districtKey: _district,
          sub_districtKey: _sub_district,
          language: "th");
      String district = AddressThailand().DistrictValue(
          provinceKey: _province, districtKey: _district, language: "th");
      String province = AddressThailand()
          .ProvinceValue(provinceKey: _province, language: "th");
      int post_code = AddressThailand().Post_CodeValue(
          provinceKey: _province,
          districtKey: _district,
          sub_districtKey: _sub_district);
      addressText =
          "${name} \nโทร ${phone} \nที่อยู่\n ${_address == '' ? '' : _address}${no == '' ? '' : ' เลขที่ ' + no}${moo == '' ? '' : ' หมู่ ' + moo}${baan == '' ? '' : ' บ้าน ' + baan}${road == '' ? '' : ' ถนน ' + road}${soy == '' ? '' : ' ซอย ' + soy} ตำบล ${sub_district} อำเภอ ${district} จังหวัด ${province} รหัสไปรษณย์ ${post_code}";
    }

    String comment = this.widget.data.bufferBill[this.widget.bill_id].comment;
    Widget ShowAddress = Container(
      child: Text("${addressText}"),
    );
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(right: 10, left: 10, top: 25),
      // color: Colors.white,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[200], width: 2),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "รายละเอียดลูกค้า",
            style: TextStyle(fontSize: 19, fontFamily: "SukhumvitSet-SemiBold"),
          ),
          ShowAddress,
          Text("หมายเหตุ"),
          Text("${comment}")
        ],
      ),
    );
  }
}
