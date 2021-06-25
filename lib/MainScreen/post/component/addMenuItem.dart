import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:shopder/function/dataManagement/dataWriteFoodPost.dart';

class AddMenuItemScreen extends StatefulWidget {
  @override
  _AddMenuItemScreenState createState() => _AddMenuItemScreenState();
}

class _AddMenuItemScreenState extends State<AddMenuItemScreen> {
  //ข้อมมูลของ รายการอาหาร
  String name;
  String type;
  int cost, quantity;
  Uint8List image;

  final picker = ImagePicker();

  Map<String, String> foodtype = {
    "1": "อาหารอีสาน",
    "2": "อาหารหวาน",
    "3": "เครื่องดื่ม",
    "4": "ของทอด"
  };
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget ConfirmButton = GestureDetector(
      onTap: () async {
        await PushItemFoodInfo();
      },
      child: Container(
        height: double.infinity,
        width: 100,
        color: Colors.red,
        alignment: Alignment.center,
        child: Text("ยืนยัน"),
      ),
    );

    Widget CancelButton = GestureDetector(
      onTap: () {
        Navigator.of(context).pop(null);
      },
      child: Container(
        height: double.infinity,
        width: 100,
        color: Colors.red,
        alignment: Alignment.center,
        child: Text("ยกเลิก"),
      ),
    );

    Widget ChoiceBar = Container(
      margin: EdgeInsets.only(top: 10),
      height: 30,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [CancelButton, ConfirmButton],
      ),
    );
    List<DropdownMenuItem<String>> ItemFoodType = <String>["1", "2", "3", "4"]
        .map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem(value: value, child: Text(foodtype[value]));
    }).toList();

    Widget InputName = TextFormField(
      onChanged: (e) {
        setState(() {
          name = e;
        });
      },
    );
    Widget InputType = DropdownButton(
      value: type,
      items: ItemFoodType,
      hint: Text("เลือกประเภทของอาหาร"),
      onChanged: (String value) {
        setState(() {
          type = value;
        });
      },
    );
    Widget InputCost = TextFormField(
      onChanged: (e) {
        setState(() {
          cost = int.parse(e);
        });
      },
    );
    Widget InputQuantity = TextFormField(
      onChanged: (e) {
        setState(() {
          quantity = int.parse(e);
        });
      },
    );

    Widget ImageFood = GestureDetector(
      onTap: () {
        UploadImage();
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        height: 150,
        width: double.infinity,
        child: image != null
            ? Image.memory(
                image,
                fit: BoxFit.cover,
              )
            : Container(
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
                color: Colors.amber,
                child: Text("เพิ่มรูปภาพอาหาร"),
              ),
      ),
    );

    Widget AddFoodForm = Container(
      height: double.infinity,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10, top: 10, left: 10, right: 10),
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      color: Colors.white,
      child: Form(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageFood,
          Text("ใส่ชื่อสินค้า"),
          InputName,
          InputType,
          Text("ใส่จำนวนสินค้า"),
          InputQuantity,
          Text("ใส่ราคาสินค้า"),
          InputCost,
          ChoiceBar
        ],
      )),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("ใส่รายละเอียดสินค้า"),
      ),
      body: AddFoodForm,
      backgroundColor: Colors.grey[100],
      resizeToAvoidBottomInset: false,
    );
  }

  Future<void> UploadImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    final bytes = File(pickedFile.path).readAsBytes();
    String base64 = base64Encode(await bytes);
    Uint8List _binary = base64Decode(base64);

    setState(() {
      if (pickedFile != null) {
        setState(() {
          // image_profile = base64;
          image = _binary;
        });
      } else {
        print('No image selected.');
      }
    });
  }

  Future PushItemFoodInfo() async {
    ItemFoodInfo item = ItemFoodInfo(
        name: name, type: type, image: image, quantity: quantity, cost: cost);

    Navigator.of(context).pop(item);
  }
}
