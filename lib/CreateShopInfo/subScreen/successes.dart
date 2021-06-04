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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "successes!",
            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w900,
                fontSize: 30.0),
          ),
          SizedBox(
            height: 100,
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(1);
              },
              child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    "OK",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ))),
        ],
      ),
    );
  }
}
