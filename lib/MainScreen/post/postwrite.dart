import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:shopder/MainScreen/post/component/postscreen/HowSendComponent.dart';
import 'package:shopder/MainScreen/post/component/postscreen/PostSetting.dart';
import 'package:shopder/MainScreen/post/addMenuItemScreen.dart';
import 'package:shopder/MainScreen/post/component/postscreen/MenuListDisplayComponent.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';
import 'package:shopder/function/dataManagement/dataWriteFoodPost.dart';
import 'package:shopder/function/dataManagement/dateBox.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectPostWrite.dart';
import 'package:shopder/function/http/httpPostWrite.dart';

class PostWrite extends StatefulWidget {
  @override
  _PostWriteState createState() => _PostWriteState();
}

class _PostWriteState extends State<PostWrite> {
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
  void initOrder() async {
    String dtNow = DateTime.now().toString();
    dateClose = await DateStringTransformInt(dateString: dtNow);
    dateSend = await DateStringTransformInt(dateString: dtNow);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initOrder();
  }

  @override
  Widget build(BuildContext context) {
    //////////////////////////////////////////cccc//////////////////////////////////

    Widget DescriptionInput = TextField(
      // controller: ,
      onChanged: (e) {
        detail = e;
      },
      decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          labelText: "เพิ่มรายละเอียดของโพสต์"),
      maxLines: 5,
    );

    Widget DatePickerCloseOrder = DateTimePicker(
      type: DateTimePickerType.dateTimeSeparate,
      dateMask: 'd MMM, yyyy',
      initialValue: DateTime.now().toString(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      icon: Icon(Icons.event),
      dateLabelText: 'วันที่',
      timeLabelText: "เวลา",
      onChanged: (val) async {
        print(val);
        DateBox dateBox = await DateStringTransformInt(dateString: val);
        setState(() {
          dateClose = dateBox;
        });
      },
      validator: (val) {
        print(val);
        return null;
      },
      onSaved: (val) => print(val),
    );

    Widget DatePickerSendOrder = DateTimePicker(
      type: DateTimePickerType.dateTimeSeparate,
      dateMask: 'd MMM, yyyy',
      initialValue: DateTime.now().toString(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      icon: Icon(Icons.event),
      dateLabelText: 'วันที่',
      timeLabelText: "เวลา",
      onChanged: (val) async {
        DateBox dateBox = await DateStringTransformInt(dateString: val);

        setState(() {
          dateSend = dateBox;
        });
      },
      validator: (val) {
        print(val);
        return null;
      },
      onSaved: (val) => print(val),
    );

    Widget AddMenuItem = GestureDetector(
      onTap: () async {
        ItemFoodInfo item = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => AddMenuItemScreen()));
        // print("${item.listImage.length} ");

        if (item != null) {
          setState(() {
            bufferItemFoodInfo.add(item);
          });
        }
      },
      child: Container(
        height: 50,
        width: 150,
        margin: EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Color(0xFFFA897B), borderRadius: BorderRadius.circular(50)),
        child: Text(
          "เพิ่มสินค้า",
          style: TextStyle(
              color: Colors.white, fontFamily: "SukhumvitSet-SemiBold"),
        ),
      ),
    );

    Widget CostSend = TextFormField(
      onChanged: (e) {
        setState(() {
          sendCost = int.parse(e);
        });
      },
    );

    //////////////////////////dddd//////////////รวมหน้า///////////////////////////
    Widget PostForm = Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(1, 1)),
          ],
          color: Colors.white),
      margin: EdgeInsets.only(bottom: 0, left: 10, right: 10, top: 10),
      padding: EdgeInsets.all(10),
      child: Form(
          child: ListView(
        children: [
          DescriptionInput,
          // ListFoodCard,  ///แสดงรายการอาการ
          MenuListDisplayComponent(
            bufferItemFoodInfo: bufferItemFoodInfo,
          ),
          AddMenuItem,
          Text(
            "ค่าจัดส่ง",
            style: TextStyle(fontSize: 15),
          ),
          CostSend,
          Text("วันที่ปิดการจองสินค้า", style: TextStyle(fontSize: 15)),
          DatePickerCloseOrder,
          Text("วันที่ส่งสินค้าสินค้า", style: TextStyle(fontSize: 15)),
          DatePickerSendOrder,
          HowSendComponent(
            callback: setHowSend,
          ),
          PostSetting(
            callBack: setPostsetting,
          ),
        ],
      )),
    );

    Widget backButton = GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ));
    Widget PostButton = GestureDetector(
      onTap: () {
        OnPost();
      },
      child: Container(
          height: 40,
          width: 70,
          // margin: EdgeInsets.only(left: 160),
          alignment: Alignment.center,
          child: Text("โพสต์",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Color(0xFFFA897B),
          )),
    );

    Widget appBar = Container(
      padding: EdgeInsets.only(right: 20, left: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          backButton,
          Text("สร้างโพสต์",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
          PostButton
        ],
      ),
    );

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(
                0.0, 0.0), // 10% of the width, so there are ten blinds.
            colors: <Color>[
              Color(0xffFA897B),
              Color(0xfffffff)
            ], // red to yellow
            //tileMode: TileMode.repeated, // repeats the gradient over the canvas
          ),
        ),
        // color: ,
        // decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover,image: AssetImage('assets/image/background/backgroundp.png') )),
        child: Column(
          children: [
            Expanded(child: appBar),
            Expanded(flex: 9, child: PostForm)
          ],
        ),
      ),

      // backgroundColor: Colors.grey[500],
      // resizeToAvoidBottomInset: false,
    );
  }

  ///////////////////////////////////////ffff////////////////////////ส่วนของฟังก์ชั่น/////////////////////////////////////////////////
  Future setHowSend(String message) {
    setState(() {
      how_send = message;
    });
  }

  Future setPostsetting(String _over_order, String confirmOrder) {
    setState(() {
      over_order = _over_order;
      confirm_order = confirmOrder;
    });
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
            title: Text("โพสต์สำเร็จ" ,),
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
