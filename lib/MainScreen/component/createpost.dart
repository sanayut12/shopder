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
    Widget ImageShop = Container(
      height: double.infinity,
      width: double.infinity,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
          image: DecorationImage(
              image: image_shop_profile_byte != null
                  ? MemoryImage(
                      image_shop_profile_byte,
                    )
                  : NetworkImage(
                      "https://static.wikia.nocookie.net/doraemon/images/c/c7/2005Doraemon.png/revision/latest?cb=20201017162935&path-prefix=en"),
              fit: BoxFit.cover)),
    );

    Widget TextGuild = Container(
      // width: double.infinity,
      // height: double.infinity,
      // color: Colors.blue,
      // margin: EdgeInsets.only(top:1, bottom:10 ),
      alignment: Alignment(-1, 0),
      // decoration: BoxDecoration(
      //     color: Colors.blue,
      //     borderRadius: BorderRadius.circular(20)),
      child: Text(
        "วันนี้ขายอะไรดี?",
        style: TextStyle(fontSize: 20),
      ),
    );

    Widget CreatePost = Container(
      // width: double.infinity,
      // height: double.infinity,
      color: Colors.white,
      // padding: EdgeInsets.only(right:10 , bottom: 0.5),
      alignment: Alignment.centerRight,
      child: TextButton(
        child: Text(
          "เพิ่มเมนูอาหาร",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => PostWrite()));
        },
      ),
    );
    return Container(
      // margin: EdgeInsets.only(top: 100),
      width: double.infinity,
      height: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              flex: 2,
              child: Row(
                children: [
// <<<<<<< HEAD
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
//                   Expanded(
//                       flex: 3,
//                       child: Container(
//                         width: double.infinity,
//                         height: double.infinity,
//                         margin: EdgeInsets.all(10),
//                         alignment: Alignment(-1, 0),
//                         decoration: BoxDecoration(
//                             // color: Colors.blue,
//                             borderRadius: BorderRadius.circular(20)),
//                         child: Text(
//                           "วันนี้ขายอะไรดี?",
//                           style: TextStyle(
//                             fontFamily: 'Sukhumvit-Bold',
//                             fontSize: 30),
//                         ),
//                       ))
// =======
                  Expanded(child: ImageShop),
                  Expanded(flex: 3, child: TextGuild)
// >>>>>>> 9dce3e4643556c3037ec753e2738d2f30571b6df
                ],
              )),
          Expanded(child: CreatePost)
        ],
      ),
    );
  }
}
