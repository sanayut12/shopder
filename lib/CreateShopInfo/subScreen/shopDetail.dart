import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectCreateShopInfo.dart';

String name, type, image_profile;

class ShopDetail extends StatefulWidget {
  final Function nextPage;
  final Function updateShopDetail;
  ShopDetail({this.nextPage, this.updateShopDetail});
  @override
  _ShopDetailState createState() => _ShopDetailState();
}

class _ShopDetailState extends State<ShopDetail> {
  TextEditingController _name;
  String _type, _image_profile;
  final picker = ImagePicker();

  bool check_image = false;
  Uint8List _image_binary;

  Color color_next = Colors.white;
  bool check_next = false;

  Map<String, String> list_type = {
    "1": "ร้านอาหารคาว Fishy restaurant",
    "2": "ร้านอาหารหวาน Dessert restauran",
    "3": "ร้านขายเครื่องดื่ม refreshment shop",
    "4": "ร้านเบเกอรี่ bakery shop",
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkNext();
    _name = TextEditingController(text: name);
    setState(() {
      _type = type;
    });
    if (image_profile != null) {
      setState(() {
        check_image = true;
        _image_binary = base64Decode(image_profile);
      });
    }
  }

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
        // onTap: ,
      );
    }).toList();

    Widget InputName = TextFormField(
      controller: _name,
      decoration: InputDecoration(hintText: "ใส่ชื่อร้าน"),
      onChanged: (e) {
        setState(() {
          name = e;
        });
        if (e == "") {
          name = null;
        }
        checkNext();
      },
    );
    Widget InputType = DropdownButton<String>(
      value: _type,
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

      onChanged: (String value) {
        setState(() {
          _type = value;
          type = value;
        });
        checkNext();
      },
    );

    Widget InputImage = GestureDetector(
      onTap: () {
        UploadImage();
      },
      child: Container(
        height: 170,
        width: 170,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey.withOpacity(0.5),
            //     spreadRadius:5,
            //     blurRadius: 7,
            //     offset: Offset(0, 3), // changes position of shadow
            //   ),
            // ],
            borderRadius: BorderRadius.all(Radius.circular(100)),
            color: Color(0xFFFFFFFF),
            border: Border.all(width: 5.0, color: Color(0xFFFA897B))),
        child: check_image
            ? Image.memory(
                _image_binary,
                height: 200,
                width: 300,
              )
            : Icon(
                Icons.camera_alt_outlined,
                size: 50,
                color: Color(0xFFFA897B),
              ),
      ),
    );

    Widget label_name = Text(
      "ชื่อร้าน",
      style: TextStyle(fontSize: 25),
    );
    child:
    Container(
      margin: EdgeInsets.only(right: 10),
    );

    Widget label_Type = Text(
      "เลือกประเภทของร้าน",
      style: TextStyle(fontSize: 25),
    );
    child:
    Container(
      margin: EdgeInsets.only(right: 10),
    );

    Widget FormShopDetail = Container(
      height: double.infinity,
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Form(
          child: Column(
        children: [
          InputImage,
          label_name,
          InputName,
          SizedBox(
            height: 20,
          ),
          label_Type,
          InputType,
        ],
      )),
    );

    return Container(
      height: double.infinity,
      width: double.infinity,
      margin: EdgeInsets.only(top: 5, left: 5, right: 0),
      child: Column(
        children: [
          Text("รายละเอียดร้านค้า"),
          Expanded(
            child: FormShopDetail,
            flex: 8,
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 100,
                    // color: Colors.amber,
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (check_next) {
                        UpdateShopDetail();
                        this.widget.nextPage();
                      }
                    },
                    child: Container(
                      height: 40,
                      width: 83,
                      margin: EdgeInsets.only(top: 45, left: 70),

                      // color: color_next,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                          color: Color(0xFFFA897B).withOpacity(0.5)),
                      child: Text('ถัดไป'),
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

  Future<void> UploadImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    final bytes = File(pickedFile.path).readAsBytes();
    String base64 = base64Encode(await bytes);
    Uint8List _binary = base64Decode(base64);
    // print(bytes);
    // print(base64);
    // print(_binary);
    setState(() {
      if (pickedFile != null) {
        setState(() {
          image_profile = base64;
          _image_binary = _binary;
          check_image = true;
        });
      } else {
        print('No image selected.');
      }
    });
    checkNext();
  }

  Future checkNext() {
    if (name != null && type != null && image_profile != null) {
      setState(() {
        color_next = Colors.red;
        check_next = true;
      });
    } else {
      setState(() {
        color_next = Color(0xFFFA897B);
        check_next = false;
      });
    }
  }

  Future UpdateShopDetail() async {
    DataShopDetail bufferDataShopDetail =
        DataShopDetail(name: name, type: type, image: image_profile);
    this.widget.updateShopDetail(bufferDataShopDetail: bufferDataShopDetail);
  }
}

// RaisedButton(
//   onPressed: () {
//     this.widget.nextPage();
//   },
//   child: Text('next'),
// ),

// Example
//  File _image;
//   final picker = ImagePicker();
//   Uint8List binary;

//   Future getImage() async {
//     final pickedFile = await picker.getImage(source: ImageSource.gallery);
//     final bytes = File(pickedFile.path).readAsBytes();
//     String base64 = base64Encode(await bytes);
//     print("base64 => $base64");
//     Uint8List _binary = base64Decode(base64);
//     print("binary => ${_binary}");
//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//         setState(() {
//           binary = _binary;
//         });
//         // print("path file ${pickedFile.path}");

//       } else {
//         print('No image selected.');
//       }
//     });
//   }

//   Center(
//             child: _image == null
//                 ? Text('No image selected.')
//                 : Image.memory(binary),
//           ),
//           // Center(
//           //   child: _image == null
//           //       ? Text('No image selected.')
//           //       : Image.file(_image),
//           // ),
//           RaisedButton(
//             onPressed: getImage,
//             child: Icon(Icons.add_a_photo),
//           )