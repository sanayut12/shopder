import 'package:flutter/material.dart';
import 'package:auth_buttons/auth_buttons.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Form(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Phone or email",
                      hintStyle: TextStyle(color: Colors.black38)),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.black38)),
                ),
              ],
            ),
          ),
          Container(
            height: 250,
            child: Column(
              children: [
                GestureDetector(
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
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GoogleAuthButton(
                      onPressed: () {},
                      style: AuthButtonStyle.icon,
                      iconStyle: AuthIconStyle.secondary,
                    ),
                    FacebookAuthButton(
                      onPressed: () {},
                      style: AuthButtonStyle.icon,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
