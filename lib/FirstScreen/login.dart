import 'package:flutter/material.dart';
import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:shopder/FirstScreen/subLogin/Login_ButtonLoginComponent.dart';
import 'package:shopder/FirstScreen/subLogin/Login_PasswordUsersInputComponent.dart';
import 'package:shopder/FirstScreen/subLogin/Login_PhoneUsersInputComponent.dart';
import 'package:shopder/Load2/load2Screen.dart';
import 'package:shopder/MainScreen/mainScreen.dart';
import 'package:shopder/CreateShopInfo/mainScreenRegisterShop.dart';
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';
import 'package:shopder/function/dataManagement/dataUserInfo.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetShopInfo.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectLogin.dart';
import 'package:shopder/function/http/httpGetShopInfo.dart';
import 'package:shopder/module/AlertCard.dart';
import '../function/http/httpLogin.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String phone, password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;

    Widget FacebookLogin = FacebookAuthButton(
      onPressed: () {
        print("object");
      },
      style: AuthButtonStyle.icon,
      borderRadius: 100,
    );
    Widget GoogleLogin = GoogleAuthButton(
      onPressed: () {},
      style: AuthButtonStyle.icon,
      iconStyle: AuthIconStyle.secondary,
      borderRadius: 35,
    );

    return Container(
        height: weight_screen,
        width: weight_screen * 0.8,
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Form(
            autovalidate: true,
            child: Column(
              children: [
                Login_PhoneUsersInputComponent(phone: phone, fun: SetPhone),
                Login_PasswordUsersInputComponent(
                    password: password, fun: SetPassword),
                Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        child: Login_ButtonLoginComponent(fun: OnpressLogin)))
              ],
            )));
  }

  Future<void> SetPhone(String _phone) {
    setState(() {
      phone = _phone;
    });
  }

  Future<void> SetPassword(String _password) {
    print(_password);
    setState(() {
      password = _password;
    });
  }

  Future OnpressLogin() {
    print("object");
    LoginHttp();
  }

  Future LoginHttp() async {
    //ทำการ fetch ไปยัง server เพื่อ login
    LoginRequest bufferLoginRequest =
        LoginRequest(phone: phone, password: password);
    LoginResponse bufferLoginResponse = await HttpLogin(bufferLoginRequest);

    //เมื่อมีการ login สำเร็จ
    if (bufferLoginResponse.code == 20200) {
      //ทำการ เอา user_id ที่ได้ไป อัดเข้าเข้า class ข้อมมูล
      GetShopInfoRequest bufferGetShopInfoRequest =
          GetShopInfoRequest(user_id: bufferLoginResponse.userInfo.user_id);
      //ทำการสส่ง user_id ไปเช็คข้อมมูลร้านค้าว่ามีไหมถ้ามีก็ขอข้อมมูลมา
      GetShopInfoResponse bufferGetShopInfoResponse = await HttpGetShopInfo(
          bufferGetShopInfoRequest: bufferGetShopInfoRequest);
      CheckShopCreateANDCreatedGoToMainScreen(
          bufferGetShopInfoResponse: bufferGetShopInfoResponse,
          bufferLoginResponse: bufferLoginResponse);
    } else if (bufferLoginResponse.code == 10004) {
      //เมื่อ login ไม่าำเร็จ
      AlertLoginFail();
    }
  }

  Future<void> AlertLoginFail() {
    return showDialog(
        context: context,
        builder: (BuildContext builder) {
          return AlertDialog(
            title: Text('แจ้งเตือน'),
            content: Text("เบอร์โทรศัพท์ หรือ รหัสผ่านไม่ถูกต้อง"),
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

  // function ใช้เพื่อทำการเช็คการสร้างร้านค้าหรือยังไม่สร้าง ถ้าสร้างแล้วก็ nav ไปยังหน้า Mainscreen ถ้ายังไม่สร้างก็ให้ nav ไปหน้า MainScreenRegister เพื่อทำการลงทะเบียนร้าค้า
  Future<void> CheckShopCreateANDCreatedGoToMainScreen(
      {GetShopInfoResponse bufferGetShopInfoResponse,
      LoginResponse bufferLoginResponse}) async {
    UserInfo bufferUserInfo = bufferLoginResponse.userInfo.TranformUserInfo();

    await UserInfoManagement()
        .InsertUserInfoToStorage(bufferUserInfo: bufferUserInfo); //
    if (bufferGetShopInfoResponse.code == 20200) {
      //ลอกอินสำเร็จ

      await ShopInfoMamagement().InsertShopInfoToStorage(
          bufferShopInfo: bufferGetShopInfoResponse.shopInfo);
      print("กำลังลอกอิน ${bufferGetShopInfoResponse.shopInfo}");
      FlutterBackgroundService().sendData({
        "event": "start_service_push_notification",
        "shop_id": "${bufferGetShopInfoResponse.shopInfo.shop_id}"
      });
      Navigator.of(context).pushNamed(Load2Screen.routeName);
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (BuildContext context) => MainScreen()));
    } else {
      int response = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => MainScreenRegisterShop()));
      if (response == 1) {
        GetShopInfoRequest bufferGetShopInfoRequest =
            GetShopInfoRequest(user_id: bufferLoginResponse.userInfo.user_id);
        //ทำการสส่ง user_id ไปเช็คข้อมมูลร้านค้าว่ามีไหมถ้ามีก็ขอข้อมมูลมา
        GetShopInfoResponse bufferGetShopInfoResponse = await HttpGetShopInfo(
            bufferGetShopInfoRequest: bufferGetShopInfoRequest);
        CheckShopCreateANDCreatedGoToMainScreen(
            bufferGetShopInfoResponse: bufferGetShopInfoResponse,
            bufferLoginResponse: bufferLoginResponse);
        Navigator.of(context).pushNamed(Load2Screen.routeName);
        // Navigator.of(context).pushNamed("/main");
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (BuildContext context) => MainScreen()));
      }
    }
  }
}
