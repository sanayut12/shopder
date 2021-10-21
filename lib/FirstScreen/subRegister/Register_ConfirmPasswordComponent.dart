import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register_ConfirmPasswordComponent extends StatefulWidget {
  String password;
  String confirmpassword;
  final Function fun;
  Register_ConfirmPasswordComponent(
      {@required this.password,
      @required this.confirmpassword,
      @required this.fun});
  @override
  _Register_ConfirmPasswordComponentState createState() =>
      _Register_ConfirmPasswordComponentState();
}

class _Register_ConfirmPasswordComponentState
    extends State<Register_ConfirmPasswordComponent> {
  TextEditingController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController(text: this.widget.confirmpassword);
  }

  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    return Container(
      child: TextFormField(
        controller: controller,
        style:
            TextStyle(fontSize: weight_screen * 0.04, color: Color(0xFFC9BABA)),
        decoration: InputDecoration(
            border: UnderlineInputBorder(
                borderSide: BorderSide(
                    width: 5.0,
                    style: BorderStyle.none,
                    color: Color(0xFFC9BABA))),
            hintText: "ยืนยันรหัสผ่าน"),
        obscureText: true,
        validator: (e) {
          if (e == this.widget.password) {
            return null;
          } else {
            return "รหัสผ่านไม่ตรงกัน";
          }
        },
        onChanged: (e) {
          print(e);
          print(this.widget.password);
          this.widget.fun(e);
        },
      ),
    );
  }
}
