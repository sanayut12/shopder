import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class typeShopComponent extends StatefulWidget {
  final String type;
  final Function setType;

  typeShopComponent({@required this.type, @required this.setType});
  @override
  _typeShopComponentState createState() => _typeShopComponentState();
}

class _typeShopComponentState extends State<typeShopComponent> {
  Map<String, String> list_type = {
    "1": "ร้านอาหารคาว Fishy restaurant",
    "2": "ร้านอาหารหวาน Dessert restauran",
    "3": "ร้านขายเครื่องดื่ม refreshment shop",
    "4": "ร้านเบเกอรี่ bakery shop",
  };
  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> dropdown_type = <String>[
      "1",
      "2",
      "3",
      "4",
    ].map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(list_type[value]),
      );
    }).toList();
    Widget InputType = DropdownButton<String>(
      value: this.widget.type,
      onChanged: (e) {
        this.widget.setType(e);
      },
      //elevation: 5,
      style: TextStyle(color: Colors.black),
      items: dropdown_type,
      hint: Text(
        "เลือกประเภทของร้าน",
        style: TextStyle(
          color: Colors.grey[350],
          fontSize: 16,
        ),
      ),
    );
    return Container(
      child: InputType,
    );
  }
}
