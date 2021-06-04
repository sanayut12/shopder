import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/post/postwrite.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  Uint8List image_shop_profile_byte;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Uint8List image_shop_profile_base64 = ShopInfoMamagement().GetImageShop();
    // print(image_shop_profile_base64);
    setState(() {
      image_shop_profile_byte = image_shop_profile_base64;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 2, bottom: 8),
      width: double.infinity,
      height: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Column(
        children: [
          Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: image_shop_profile_byte != null
                                    ? MemoryImage(
                                        image_shop_profile_byte,
                                      )
                                    : NetworkImage(
                                        "https://static.wikia.nocookie.net/doraemon/images/c/c7/2005Doraemon.png/revision/latest?cb=20201017162935&path-prefix=en"),
                                fit: BoxFit.cover)),
                      )),
                  Expanded(
                      flex: 3,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        margin: EdgeInsets.all(10),
                        alignment: Alignment(-1, 0),
                        decoration: BoxDecoration(
                            // color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "วันนี้ขายอะไรดี?",
                          style: TextStyle(fontSize: 30),
                        ),
                      ))
                ],
              )),
          Expanded(
              flex: 1,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                padding: EdgeInsets.only(right: 10),
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: Text("เพิ่มเมนูอาหาร"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => PostWrite()));
                  },
                ),
              ))
        ],
      ),
    );
  }
}
