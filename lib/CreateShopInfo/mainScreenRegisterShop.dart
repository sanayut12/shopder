import 'package:flutter/material.dart';
import 'package:shopder/ClassObjects/httpObjectCreateShopInfo.dart';
import 'package:shopder/CreateShopInfo/subScreen/shopAddress.dart';
import 'package:shopder/CreateShopInfo/subScreen/shopDetail.dart';
import 'package:shopder/CreateShopInfo/subScreen/shopPostion.dart';
import 'package:shopder/CreateShopInfo/subScreen/successes.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';
import 'package:shopder/function/dataManagement/dataUserInfo.dart';
import 'package:shopder/function/http/httpCreateShopInfo.dart';

class MainScreenRegisterShop extends StatefulWidget {
  @override
  _MainScreenRegisterShopState createState() => _MainScreenRegisterShopState();
}

String user_id, name, image, type, address, sub_district, district, province;
double latitude, longtitude;

class _MainScreenRegisterShopState extends State<MainScreenRegisterShop> {
  int pageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initHttpCreatShopInfo();
    user_id = UserInfoManagement().User_id();
  }

  Function NextPage() {
    setState(() {
      pageIndex += 1;
    });
  }

  Function BackPage() {
    setState(() {
      pageIndex -= 1;
    });
  }

  Function Finsh() {
    OnShopRegister();
  }

  Function UpdateShopDetail({DataShopDetail bufferDataShopDetail}) {
    setState(() {
      name = bufferDataShopDetail.name;
      type = bufferDataShopDetail.type;
      image = bufferDataShopDetail.image;
    });
  }

  Function UpdateShopAddress({DataShopAddress bufferDataShopAddress}) {
    setState(() {
      address = bufferDataShopAddress.address;
      province = bufferDataShopAddress.province;
      district = bufferDataShopAddress.district;
      sub_district = bufferDataShopAddress.sub_district;
    });
    // print("$address $province $district ");
  }

  Function UpdateShopPosition({DataShopPosition bufferDataShopPosition}) {
    setState(() {
      latitude = bufferDataShopPosition.latitude;
      longtitude = bufferDataShopPosition.longtitude;
    });
  }

  Future<void> OnShopRegister() async {
    ShopInfoCreateRequest bufferShopInfoCreateRequest = ShopInfoCreateRequest(
        user_id: user_id,
        name: name,
        type: type,
        image: image,
        address: address,
        sub_district: sub_district,
        district: district,
        province: province,
        latitude: latitude,
        longtitude: longtitude);
    ShopInfoCreateResponse bufferShopInfoCreateResponse =
        await HttpCreateShopInfo(bufferShopInfoCreateRequest);
    // print(bufferShopInfoCreateResponse.code);
    if (bufferShopInfoCreateResponse.code == 20200) {
      ShopInfo bufferShopInfo = await ShopInfo(
        shop_id:
            bufferShopInfoCreateResponse.shopInfoCreateDataResponse.shop_id,
        name: name,
        type: type,
        image: image,
        address: address,
        sub_district: sub_district,
        district: district,
        province: province,
        latitude: latitude,
        longtitude: longtitude,
      );
      ShopInfoMamagement shopInfoMamagement = ShopInfoMamagement();
      await shopInfoMamagement.InsertShopInfoToStorage(
          bufferShopInfo: bufferShopInfo);
      await setState(() {
        pageIndex += 1;
      });
    } else {
      AlertLoginFail();
    }
  }

  // Future<>

  @override
  Widget build(BuildContext context) {
    List<Widget> pageBuffer = [
      ShopDetail(nextPage: NextPage, updateShopDetail: UpdateShopDetail),
      ShopAddress(
        nextPage: NextPage,
        backPage: BackPage,
        updateShopAddress: UpdateShopAddress,
      ),
      ShopPosition(
        finishPage: Finsh,
        backPage: BackPage,
        updateShopPosition: UpdateShopPosition,
      ),
      RegisterSuccesses(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("ลงทะเบียนร้านค้า"),
      ),
      resizeToAvoidBottomInset: false,
      body: pageBuffer[pageIndex],
    );
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
