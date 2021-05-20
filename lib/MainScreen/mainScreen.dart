import 'package:flutter/material.dart';
import 'package:shopder/ClassObjects/httpObjectLogin.dart';
import 'package:shopder/function/dataManagement/storageFunction.dart';
import 'package:shopder/function/dataManagement/storageManagement.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String data;

  // void readDataInStorage() async {
  //   DataUserInfo data1 = await ReadDataUserInfoInStorage();
  //   String data2 = await data1.ToString();
  //   setState(() {
  //     data = data2;
  //   });
  //   print(" sssssssssssss ${data2}");
  // }

  // void getDataUserInfo() async {
  //   // DataUserInfo _userInfo = await ReadDataUserInfoInStorage();
  //   setState(() {
  //     userInfo = _userInfo;
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getDataUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("main screen"),
      ),
      body: Text("$data"),
    );
  }
}
