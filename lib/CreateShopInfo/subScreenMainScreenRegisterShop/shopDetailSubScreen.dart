import 'dart:convert';

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:shopder/CreateShopInfo/component/ButtomBarComponent.dart';
import 'package:shopder/CreateShopInfo/subScreenMainScreenRegisterShop/shopDetail/typeShopComponent.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectCreateShopInfo.dart';
import 'package:shopder/module/uploadImage.dart';

class ShopDetailSubScreen extends StatefulWidget {
  final DataShopDetail dataShopDetail;
  final Function setdataShopDetail;
  // final Function setdataShopDetail;
  ShopDetailSubScreen(
      {@required this.dataShopDetail, @required this.setdataShopDetail});
  @override
  _ShopDetailSubScreenState createState() => _ShopDetailSubScreenState();
}

class _ShopDetailSubScreenState extends State<ShopDetailSubScreen> {
  //ใช้เก็บข้อมูล
  String name = "";
  Uint8List image = null;
  String type = null;
  //ใช้ทำงานเกี่ยวกับ ui
  int active = 0;
  TextEditingController _name;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print(this.widget.dataShopDetail);

    if (this.widget.dataShopDetail != null) {
      setState(() {
        name = this.widget.dataShopDetail.name;
        image = base64Decode(this.widget.dataShopDetail.image);
        type = this.widget.dataShopDetail.type;
      });
    }
    _name = TextEditingController(text: name);
    CheckActive();
  }

  @override
  Widget build(BuildContext context) {
    Widget InputImage = GestureDetector(
        onTap: () async {
          Uint8List _image = await UploadImageFormGallery();
          setState(() {
            image = _image;
          });
          CheckActive();
        },
        child: image == null
            ? Container(
                height: MediaQuery.of(context).size.width * 0.45,
                width: MediaQuery.of(context).size.width * 0.45,
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Colors.red[100],
                      width: 5.0,
                      style: BorderStyle.solid),
                  color: Colors.grey[100],
                ),
              )
            : Container(
                height: MediaQuery.of(context).size.width * 0.45,
                width: MediaQuery.of(context).size.width * 0.45,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Colors.red[100],
                        width: 5.0,
                        style: BorderStyle.solid),
                    color: Colors.grey[100],
                    image: DecorationImage(
                        fit: BoxFit.cover, image: MemoryImage(image))),
              ));
    Widget InputName = TextFormField(
      controller: _name,
      decoration: InputDecoration(hintText: "ใส่ชื่อร้าน"),
      onChanged: (e) {
        setState(() {
          name = e;
        });
        CheckActive();
      },
    );
    Widget label_name = Text(
      "ชื่อร้าน",
      style: TextStyle(fontSize: 25, fontFamily: "SukhumvitSet-SemiBold"),
    );
    child:
    Container(
      margin: EdgeInsets.only(right: 10),
    );

    Widget label_Type = Text(
      "เลือกประเภทของร้าน",
      style: TextStyle(fontSize: 20, fontFamily: "SukhumvitSet-SemiBold"),
    );
    child:
    Container(
      margin: EdgeInsets.only(right: 20),
    );

    //   return Container(
    //     color: Colors.transparent,
    //     margin: EdgeInsets.only(top: 5, left: 5, right: 0),
    //     child: ListView(
    //       children: [
    //         InputImage,
    //         label_name,
    //         InputName,
    //         label_Type,
    //         typeShopComponent(type: type, setType: setType),
    //         ButtomBarComponent(
    //             textbuttom1: "ยกเลิก",
    //             func1: cancelButton,
    //             active1: 1,
    //             textbuttom2: "ต่อไป",
    //             func2: setdataShopDetail,
    //             active2: active)
    //       ],
    //     ),
    //   );
    // }
    Widget appBar = Container(
      // height: 30,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
                width: 80,
                margin: EdgeInsets.only(top: 5),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 20),
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
    );

    return Container(
      // color: Colors.blue,
      // margin: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 30),
      child: Column(
        children: [
          Expanded(child: appBar),
          Expanded(
            flex: 8,
            child: ListView(
              children: [
                Stack(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 120, left: 25, right: 25),
                            // margin:
                            //     EdgeInsets.only(left: 10, right: 10, top: 10),
                            height: 400,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                label_name,
                                InputName,
                                SizedBox(
                                  height: 20,
                                ),
                                label_Type,
                                typeShopComponent(type: type, setType: setType),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: InputImage),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
            height: double.infinity,
            width: double.infinity,
            // color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtomBarComponent(
                    textbuttom1: "ยกเลิก",
                    func1: cancelButton,
                    active1: 1,
                    textbuttom2: "ถัดไป",
                    func2: setdataShopDetail,
                    active2: active)
              ],
            ),
          )),
        ],
      ),
    );
  }

  Future<void> setType(String data) {
    setState(() {
      type = data;
    });
    CheckActive();
  }

  Future<void> setdataShopDetail() {
    DataShopDetail dataShopDetail =
        DataShopDetail(name: name, type: type, image: base64Encode(image));
    this.widget.setdataShopDetail(dataShopDetail);
  }

  Future<void> cancelButton() {
    Navigator.of(context).pop(0);
  }

  Future<void> CheckActive() {
    if (name != "" && image != null && type != null) {
      setState(() {
        active = 1;
      });
    } else {
      setState(() {
        active = 0;
      });
    }
  }
}
