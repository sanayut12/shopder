import 'package:flutter/material.dart';
import 'package:shopder/function/dataManagement/dataUserInfo.dart';

class RegisterSuccesses extends StatefulWidget {
  @override
  _RegisterSuccessesState createState() => _RegisterSuccessesState();
}

class _RegisterSuccessesState extends State<RegisterSuccesses> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.green,
      child: Column(
        children: [
          Text("ลงทะเบียนร้านค้าสำเร็จ"),
          TextButton(
              onPressed: () {
                // setState(() {

                // });
                Navigator.pop(context);
              },
              child: Text("ตกลง")),
        ],
      ),
    );
  }
}
