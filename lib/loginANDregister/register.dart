import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shopder/objects/httpObject.dart';
import '../function/httpRegister.dart';

String name, password, confirmpassword, phone, email;

class Register extends StatefulWidget {
  final Function rePage;

  Register({this.rePage});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _name, _password, _confirmpassword, _phone, _email;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _name = TextEditingController(text: name);
    _password = TextEditingController(text: password);
    _confirmpassword = TextEditingController(text: confirmpassword);
    _phone = TextEditingController(text: phone);
    _email = TextEditingController(text: email);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Form(
          child: Column(
        children: [
          TextFormField(
            onChanged: (e) {
              setState(() {
                name = e;
              });
            },
            controller: _name,
            decoration: InputDecoration(
                hintText: "Name", hintStyle: TextStyle(color: Colors.black38)),
          ),
          TextFormField(
            onChanged: (e) {
              setState(() {
                phone = e;
              });
            },
            controller: _phone,
            decoration: InputDecoration(
                hintText: "Phone", hintStyle: TextStyle(color: Colors.black38)),
          ),
          TextFormField(
            onChanged: (e) {
              setState(() {
                email = e;
              });
            },
            controller: _email,
            decoration: InputDecoration(
                hintText: "Email", hintStyle: TextStyle(color: Colors.black38)),
          ),
          TextFormField(
            onChanged: (e) {
              setState(() {
                password = e;
              });
            },
            controller: _password,
            decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.black38)),
          ),
          TextFormField(
            onChanged: (e) {
              setState(() {
                confirmpassword = e;
              });
            },
            controller: _confirmpassword,
            decoration: InputDecoration(
                hintText: "comfirm Password",
                hintStyle: TextStyle(color: Colors.black38)),
          ),
          GestureDetector(
            onTap: () async {
              await getOTPManagement();
            },
            child: Container(
              child: Text(
                "Register",
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              height: 40,
              width: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          )
        ],
      )),
    );
  }

  Future getOTPManagement() async {
    GetOTPRequest bufferGetOTPRequest = GetOTPRequest(phone: phone);
    GetOTPResponse bufferGetOTPResponse = await httpGetOTP(bufferGetOTPRequest);
    if (bufferGetOTPResponse.status == 1) {
      otpDialog(bufferGetOTPResponse);
    } else {
      alertDialog(bufferGetOTPResponse.message);
    }
  }

  Future confirmOTPMangemant(String code) async {
    ConfirmOTPRequest bufferConfirmOTPRequest =
        ConfirmOTPRequest(phone: phone, code: code);
    ConfirmOTPResponse bufferConfirmOTPResponse =
        await httpConfirmOTP(bufferConfirmOTPRequest);
    if (bufferConfirmOTPResponse.code == 1) {
      int res = await confirmOTPAlertdialog(bufferConfirmOTPResponse);
      RegisterRequest data = RegisterRequest(
          name: name, phone: phone, email: email, password: password);
      httpRegister(data);
      return res;
    } else {
      int res = await confirmOTPAlertdialog(bufferConfirmOTPResponse);
      return res;
    }
  }

  Future<int> confirmOTPAlertdialog(
      ConfirmOTPResponse bufferConfirmOTPResponse) {
    return showDialog(
        context: context,
        builder: (BuildContext builder) {
          return AlertDialog(
            title: Text("แจ้งเตือน"),
            content: Text("${bufferConfirmOTPResponse.message}"),
            actions: [
              TextButton(
                  onPressed: () {
                    if (bufferConfirmOTPResponse.code == 1) {
                      Navigator.of(context).pop(1);
                    } else {
                      Navigator.of(context).pop(0);
                    }
                  },
                  child: Text("ยืนยัน"))
            ],
          );
        });
  }

  Future otpDialog(GetOTPResponse response) async {
    TextEditingController code = TextEditingController();

    return showDialog(
      context: context,
      builder: (BuildContext builder) {
        return AlertDialog(
          title: Text("ยืนยันรหัส OTP ของเบอร์ $phone"),
          content: Container(
            height: 100,
            width: 200,
            child: Column(
              children: [
                Text('รหัสอ้างอิงคือ ${response.key}'),
                TextField(
                  controller: code,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () async {
                  int check = await confirmOTPMangemant(code.text);
                  if (check == 0) {
                    Navigator.of(context).pop();
                    getOTPManagement();
                  } else if (check == 1) {
                    Navigator.of(context).pop();
                    this.widget.rePage();
                  }
                },
                child: Text("ยืนยัน"))
          ],
        );
      },
    );
  }

  Future alertDialog(String message) {
    return showDialog(
        context: context,
        builder: (BuildContext builder) {
          return AlertDialog(
            title: Text("แจ้งเตือน"),
            content: Text("$message"),
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
