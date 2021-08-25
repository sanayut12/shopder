import 'package:flutter/material.dart';
import 'package:shopder/CreateShopInfo/subScreenMainScreenRegisterShop/registerSuccessSubScreen.dart';
import 'package:shopder/CreateShopInfo/subScreenMainScreenRegisterShop/shopAddressSubScreen.dart';
import 'package:shopder/CreateShopInfo/subScreenMainScreenRegisterShop/shopDetailSubScreen.dart';
import 'package:shopder/CreateShopInfo/subScreenMainScreenRegisterShop/shopPostionSubScreen.dart';

import 'package:shopder/function/dataManagement/dataShopInfo.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectCreateShopInfo.dart';
import 'package:shopder/function/http/httpCreateShopInfo.dart';

class MainScreenRegisterShop extends StatefulWidget {
  @override
  _MainScreenRegisterShopState createState() => _MainScreenRegisterShopState();
}

class _MainScreenRegisterShopState extends State<MainScreenRegisterShop> {
  int pageIndex = 0;
  //##############ตัวแปรที่ใช้เก็บข้อมูลร้านค้า#################
  DataShopDetail dataShopDetail;
  DataShopAddress dataShopAddress;
  DataShopPosition dataShopPosition;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // Future<>

  @override
  Widget build(BuildContext context) {
    List<Widget> pageBuffer = [
      ShopDetailSubScreen(
          dataShopDetail: dataShopDetail, setdataShopDetail: setdataShopDetail),
      ShopAddressSubScreen(
        dataShopAddress: dataShopAddress,
        setdataShopAddress: setdataShopAddress,
      ),
      ShopPositionSubScreen(
          dataShopPosition: dataShopPosition,
          setdataShopPosition: setdataShopPosition),
      RegisterSuccessSubScreen(
          dataShopDetail: dataShopDetail,
          dataShopAddress: dataShopAddress,
          dataShopPosition: dataShopPosition)
      // ShopAddress(
      //   nextPage: NextPage,
      //   backPage: BackPage,
      //   updateShopAddress: UpdateShopAddress,
      // ),
      // ShopPosition(
      //   finishPage: Finsh,
      //   backPage: BackPage,
      //   updateShopPosition: UpdateShopPosition,
      // ),
      // RegisterSuccesses(),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/image/background/backgroundInfor.png"),
            ),
          ),
          child: pageBuffer[pageIndex]),
    );
  }

  Future<void> setdataShopDetail(DataShopDetail _dataShopDetail) {
    setState(() {
      dataShopDetail = _dataShopDetail;
      pageIndex += 1;
    });
  }

  Future<void> setdataShopAddress(
      DataShopAddress _dataShopAddress, int _index) {
    setState(() {
      dataShopAddress = _dataShopAddress;
      pageIndex += _index;
    });
  }

  Future<void> setdataShopPosition(
      DataShopPosition _dataShopPosition, int _index) {
    setState(() {
      dataShopPosition = _dataShopPosition;
      pageIndex += _index;
    });
  }

  Future<void> backPage() {
    setState(() {
      pageIndex -= 1;
    });
  }

  Future<void> AlertLoginFail() {
    return showDialog(
        context: context,
        builder: (BuildContext builder) {
          return AlertDialog(
            title: Text('แจ้งเตือน'),
            content: Text("เกิดข้อผิดพลาด"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("ยืนยัน"))
            ],
          );
        });
  }
}
