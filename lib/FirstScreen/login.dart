import 'package:flutter/material.dart';
import 'package:auth_buttons/auth_buttons.dart';
import 'package:shopder/ClassObjects/httpObjectGetShopInfo.dart';
import 'package:shopder/ClassObjects/httpObjectLogin.dart';
import 'package:shopder/MainScreen/mainScreen.dart';
import 'package:shopder/CreateShopInfo/mainScreenRegisterShop.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';
import 'package:shopder/function/dataManagement/dataUserInfo.dart';
import 'package:shopder/function/http/httpGetShopInfo.dart';
import '../function/http/httpLogin.dart';

String phone = "0630588299";
String password = "12345";

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _phone, _password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initHttpLogin();
    initHttpGetShopInfo();
    _phone = TextEditingController(text: phone);
    _password = TextEditingController(text: password);
  }

  @override
  Widget build(BuildContext context) {
    Widget PhoneInput = TextFormField(
      controller: _phone,
      onChanged: (e) {
        setState(() {
          phone = e;
        });
      },
      decoration: InputDecoration(
          hintText: "Phone", hintStyle: TextStyle(color: Colors.black38)),
    );

    Widget PasswordInput = TextFormField(
      controller: _password,
      onChanged: (e) {
        setState(() {
          password = e;
        });
      },
      decoration: InputDecoration(
          hintText: "Password", hintStyle: TextStyle(color: Colors.black38)),
    );

    Widget ButtonLogin = GestureDetector(
      onTap: () {
        OnpressLogin();
      },
      child: Container(
        alignment: Alignment.center,
        height: 40,
        width: 100,
        child: Text(
          "Login",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );

    Widget FacebookLogin = FacebookAuthButton(
      onPressed: () {},
      style: AuthButtonStyle.icon,
    );
    Widget GoogleLogin = GoogleAuthButton(
      onPressed: () {},
      style: AuthButtonStyle.icon,
      iconStyle: AuthIconStyle.secondary,
    );
    Widget LoginFrom = Form(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Column(
            children: [PhoneInput, PasswordInput, ButtonLogin],
          ),
        ),
        Container(
          height: 200,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [FacebookLogin, GoogleLogin],
              )
            ],
          ),
        ),
      ],
    ));
    return Container(
        height: 400,
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: LoginFrom);
  }

  Future OnpressLogin() {
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
            content: Text("Phone or password incorrect"),
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
    UserInfo bufferUserInfo = UserInfo(
        user_id: bufferLoginResponse.userInfo.user_id,
        name: bufferLoginResponse.userInfo.name,
        email: bufferLoginResponse.userInfo.email,
        phone: bufferLoginResponse.userInfo.phone,
        image: bufferLoginResponse.userInfo.image);
    await UserInfoManagement()
        .InsertUserInfoToStorage(bufferUserInfo: bufferUserInfo);
    if (bufferGetShopInfoResponse.code == 20200) {
      await ShopInfoMamagement().InsertShopInfoToStorage(
          bufferShopInfo: bufferGetShopInfoResponse.shopInfo);

      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => MainScreen()));
    } else {
      int response = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => MainScreenRegisterShop()));
      if (response == 1) {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => MainScreen()));
      }
    }
  }
}

//###### how to userinfo string to json#####
// var data = await json.decode(await userinfostring);
// print('data user info string to json');
// DataUserInfo userinfo = new DataUserInfo(
//     user_id: data['user_id'],
//     name: data['name'],
//     phone: data['phone'],
//     email: data['email']);
// print(userinfo.user_id);
//############end################
