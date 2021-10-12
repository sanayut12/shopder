import 'package:flutter/material.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';
import 'package:shopder/function/dataManagement/dataUserInfo.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectCreateShopInfo.dart';
import 'package:shopder/function/http/httpCreateShopInfo.dart';

class RegisterSuccessSubScreen extends StatefulWidget {
  DataShopDetail dataShopDetail;
  DataShopAddress dataShopAddress;
  DataShopPosition dataShopPosition;
  RegisterSuccessSubScreen(
      {@required this.dataShopDetail,
      @required this.dataShopAddress,
      @required this.dataShopPosition});
  @override
  _RegisterSuccessSubScreenState createState() =>
      _RegisterSuccessSubScreenState();
}

class _RegisterSuccessSubScreenState extends State<RegisterSuccessSubScreen> {
  int active = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UploadData();
  }

  @override
  Widget build(BuildContext context) {
    Widget ButtonSuccesses = GestureDetector(
      onTap: () {
        Navigator.of(context).pop(1);
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: Color(0xFFFA897B), borderRadius: BorderRadius.circular(20)),
        alignment: Alignment.center,
        child: Text("ตกลง"),
      ),
    );
    // return ;
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(50),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              print(
                  "${this.widget.dataShopPosition.latitude} ${this.widget.dataShopPosition.longtitude}");
              // PPrint();
            },
            child: Container(
              height: 100,
              width: 200,
              margin: EdgeInsets.only(top: 245),
              color: active == 0 ? Colors.grey[200] : Color(0xFFFA897B),
              alignment: Alignment.center,
              child: Text(
                "ลงทะเบียนสำเร็จ",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          ButtonSuccesses
        ],
      ),
    );
  }

  Future<void> PPrint() {
    print("${this.widget.dataShopAddress.road}");
    print("${this.widget.dataShopDetail.name}");
    print("${this.widget.dataShopPosition.latitude}");
  }

  Future<void> UploadData() async {
    String user_id = UserInfoManagement().User_id();
    ShopInfoCreateRequest bufferShopInfoCreateRequest = ShopInfoCreateRequest(
        user_id: user_id,
        dataShopDetail: this.widget.dataShopDetail,
        dataShopAddress: this.widget.dataShopAddress,
        dataShopPosition: this.widget.dataShopPosition);
    await HttpCreateShopInfo(bufferShopInfoCreateRequest);
    setState(() {
      active = 1;
    });
  }
}
