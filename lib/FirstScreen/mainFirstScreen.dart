import 'package:flutter/material.dart';
import 'package:shopder/FirstScreen/login.dart';
import 'package:shopder/FirstScreen/register.dart';
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/dataManagement/readJsonAddress.dart';
import 'package:shopder/function/http/httpGetPostShop.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        // backgroundColor: Colors.grey[200],

        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image:
                    AssetImage("assets/image/background/backgroundFirst1.png"),
              )),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(
                  20,
                  80,
                  20,
                  80,
                ),
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  border: Border(),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: SubFirst()),
          ],
        ));
  }
}

class SubFirst extends StatefulWidget {
  @override
  _SubFirstState createState() => _SubFirstState();
}

class _SubFirstState extends State<SubFirst> {
  int page;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.page = 0;
    LoadDataFormLocal();
  }

  Function changeFromRegistered() {
    setState(() {
      this.page = 0;
    });
    // print("hello world");
  }

  void LoadDataFormLocal() async {
    await initLoadHostName();
    await AddressThailand().init();
  }

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: Container(
                width: 141,
                height: 34,
                margin: EdgeInsets.only(top: 15),
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: this.page == 1 ? Color(0xFFFA897B) : Colors.white,
                  ),
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(35)),
                  color: this.page == 0 ? Color(0xFFFA897B) : Colors.white,
                ),
              ),
              onTap: () {
                setState(() {
                  this.page = 0;
                });
              },
            ),
            GestureDetector(
              child: Container(
                width: 141,
                height: 34,
                child: Text(
                  "Register",
                  style: TextStyle(
                    color: this.page == 0 ? Color(0xFFFA897B) : Colors.white,
                  ),
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(35)),
                  color: this.page == 1 ? Color(0xFFFA897B) : Colors.white,
                ),
              ),
              onTap: () {
                setState(() {
                  this.page = 1;
                });
              },
            ),
          ],
        ),
        this.page == 0
            ? Login()
            : Register(
                rePage: changeFromRegistered,
              ),
      ],
    );
  }
}
