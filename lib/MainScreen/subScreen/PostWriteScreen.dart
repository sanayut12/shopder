import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/post/addMenuItemScreen.dart';
import 'package:shopder/MainScreen/post/component/postscreen/MenuListDisplayComponent.dart';
import 'package:shopder/MainScreen/subScreen/subPostWrite/PostWrite_AppBarComponent.dart';
import 'package:shopder/MainScreen/subScreen/subPostWrite/PostWrite_DetailComponent.dart';
import 'package:shopder/MainScreen/subScreen/subPostWrite/PostWrite_ListMenuComponent.dart';
import 'package:shopder/MainScreen/subScreen/subPostWrite/PostWrite_OptionComponent.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';
import 'package:shopder/function/dataManagement/dataWriteFoodPost.dart';
import 'package:shopder/function/dataManagement/dateBox.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectPostWrite.dart';
import 'package:shopder/function/http/httpPostWrite.dart';

class PostWriteScreen extends StatefulWidget {
  @override
  _PostWriteScreenState createState() => _PostWriteScreenState();
}

class _PostWriteScreenState extends State<PostWriteScreen> {
  String detail = "";
  int sendCost = 0;
  DateBox dateClose;
  DateBox dateSend;
  // FoodPostInfo bufferFoodPostInfo;
  // var  = <ItemFoodInfo>[];
  List<ItemFoodInfo> bufferItemFoodInfo = [];

  // Map<String, String> listsendtype = {"1": "ส่งถึงที่", "2": "รับที่ร้าน"};
  String how_send =
      "1"; //วิธีการรับสินค้า 1 = ส่งถึงที่ , 2 = รับที่ร้าน , 3 ทั้งสอง   , 0 ต้องเลือกอย่างใดอย่างหนึ่ง
  String over_order =
      "1"; // 1 ไม่สั่งเกินที่ระบุ  2 สั่งเกินได้   ระบุค่า / ไม่ระบุ สั่งได้ไม่จำกัด
  String confirm_order =
      "1"; //วิธีการยืนยันออเดอร์   1 อัตโนมัติ , 2 ยืนยันเอง ,3 ยันเฉพาะที่เกิน
  void initDateTime() async {
    String dtNow = DateTime.now().toString();

    dateClose = await DateStringTransformInt(dateString: dtNow);
    dateSend = await DateStringTransformInt(dateString: dtNow);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initDateTime();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> buffer = [
      TextButton(
          onPressed: () {
            print("${detail}");
          },
          child: Text("data")),
      SizedBox(
        height: 1500,
      ),
      TextButton(
          onPressed: () {
            print("${detail}");
          },
          child: Text("data"))
    ];
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color(0xfffa897b),
        child: SafeArea(
            child: Column(
          children: [
            PostWrite_AppBarComponent(
              fun: OnPost,
            ),
            Expanded(
              child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment
                          .bottomCenter, // 10% of the width, so there are ten blinds.
                      colors: <Color>[Color(0xffFA897B), Colors.white],
                    ),
                  ),
                  child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        if (index == 0) {
                          // print(index);
                          // print(this.detail);
                          // print(index);
                          return PostWrite_DetailComponent(
                              text: this.detail, fun1: setDetail);
                        } else if (index == 1) {
                          return PostWrite_ListMenuComponent(
                            bufferItemFoodInfo: bufferItemFoodInfo,
                            AddMenu: AddMenu,
                          );
                        } else if (index == 2) {
                          return PostWrite_OptionComponent(
                              sendCost: sendCost,
                              dateClose: dateClose,
                              dateSend: dateSend,
                              how_send: how_send,
                              over_order: over_order,
                              confirm_order: confirm_order,
                              fun: SetOption);
                        } else {
                          return Container();
                          // return Container(
                          //   height: 1000,
                          //   width: double.infinity,
                          //   child: Column(
                          //     children: [
                          //       GestureDetector(
                          //         onTap: () {
                          //           print("${dateClose.ToString()}");
                          //           print(
                          //               "${how_send} ${over_order} ${confirm_order}");
                          //         },
                          //         child: Container(
                          //           height: 100,
                          //           width: 100,
                          //           color: Colors.red,
                          //         ),
                          //       )
                          //     ],
                          //   ),
                          // );
                        }
                      })),
            ),
          ],
        )),
      ),
    );
  }

  Future<void> setDetail(String text) {
    print(text);
    detail = text;
  }

  Future<void> AddMenu() async {
    ItemFoodInfo item = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => AddMenuItemScreen()));

    if (item != null) {
      setState(() {
        bufferItemFoodInfo.add(item);
      });
    }
  }

  Future<void> SetOption(int _sendCost, DateBox _dateClose, DateBox _dateSend,
      String _how_send, String _over_order, String _confirm_order) async {
    if (_sendCost != null) {
      sendCost = _sendCost;
    }

    if (_dateClose != null) {
      setState(() {
        dateClose = _dateClose;
      });
    }
    if (_dateSend != null) {
      setState(() {
        dateSend = _dateSend;
      });
    }

    if (_how_send != null) {
      setState(() {
        how_send = _how_send;
      });
    }

    if (_over_order != null) {
      setState(() {
        over_order = _over_order;
      });
    }
    if (_confirm_order != null) {
      setState(() {
        confirm_order = _confirm_order;
      });
    }
  }

  Future<void> OnPost() async {
    PostWriteInfo bufferPostWriteInfo = PostWriteInfo(
        detail: detail,
        items: bufferItemFoodInfo,
        sendcost: sendCost,
        dateClose: dateClose,
        dateSend: dateSend,
        how_send: how_send,
        over_order: over_order,
        confirm_order: confirm_order);

    PostWriteRequest bufferPostWriteRequest = PostWriteRequest(
        postWriteInfo: bufferPostWriteInfo,
        shop_id: ShopInfoMamagement().GetShop_id());

    PostWriteResponse bufferPostWriteResponse =
        await HttpPostWrite(bufferPostWriteRequest);
    if (bufferPostWriteResponse.code == "20200") {
      int code = await AlertCardPostSuccesses();
      Navigator.of(context).pop(1);
    }
  }

  Future<int> AlertCardPostSuccesses() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("โพสต์สำเร็จ"),
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop(1);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFFA897B),
                      borderRadius: BorderRadius.circular(20)),
                  height: 30,
                  width: 80,
                  alignment: Alignment.center,
                  child: Text("ตกลง"),
                ),
              ),
            ],
          );
        });
  }
}
