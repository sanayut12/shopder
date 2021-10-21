import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register_AlertDialogComponent extends StatefulWidget {
  @override
  _Register_AlertDialogComponentState createState() =>
      _Register_AlertDialogComponentState();
}

class _Register_AlertDialogComponentState
    extends State<Register_AlertDialogComponent> {
  String bit1 = "";
  String bit2 = "";
  String bit3 = "";
  String bit4 = "";
  String bit5 = "";
  String bit6 = "";
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    return AlertDialog(
      title: Container(
        height: weight_screen * 0.8,
        width: weight_screen * 0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: weight_screen * 0.3,
              width: weight_screen * 0.2,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/image/OTP.png"))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BitOTP(bit: bit1, fun: null),
                BitOTP(bit: bit2, fun: null),
                BitOTP(bit: bit3, fun: null),
                BitOTP(bit: bit4, fun: null),
                BitOTP(bit: bit5, fun: null),
                BitOTP(bit: bit6, fun: null),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BitOTP extends StatefulWidget {
  String bit;
  final Function fun;
  BitOTP({@required this.bit, @required this.fun});
  @override
  _BitOTPState createState() => _BitOTPState();
}

class _BitOTPState extends State<BitOTP> {
  TextEditingController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController(text: this.widget.bit);
  }

  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    return Container(
      height: weight_screen * 0.2,
      width: weight_screen * 0.2,
      margin: EdgeInsets.only(left: 1, right: 1),
      // color: Colors.red,
      alignment: Alignment.center,
      child: TextFormField(
        controller: controller,
        maxLength: 1,
        // style: TextStyle(fontSize: weight_screen * 0.04),
        decoration:
            InputDecoration(counterText: "", border: OutlineInputBorder()),
      ),
    );
  }
}
