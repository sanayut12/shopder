import 'dart:math';

import 'package:flutter/material.dart';
import '../function/http.dart';

String name, password, confirmpassword, phone, email;

class Register extends StatefulWidget {
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
              otpDialog();
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

  Future otpDialog() async {
    var getotp = await httpGetOTP(phone);
    print(getotp);
    return showDialog(
      context: context,
      builder: (BuildContext builder) {
        return AlertDialog(
          title: Text("ยืนยัน"),
          actions: [
            TextButton(
                onPressed: () async {
                  String re =
                      await httpJsonRegister(name, password, phone, email);
                  print(re);
                },
                child: Text("ยืนยัน"))
          ],
        );
      },
    );
  }
}
