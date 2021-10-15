import 'package:flutter/material.dart';
import 'package:shopder/FirstScreen/login.dart';
import 'package:shopder/FirstScreen/register.dart';

class MainFirstScreen extends StatelessWidget {
  static String routeName = "/first";
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.red,
          child: SafeArea(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Color(0xFFE8E8E8),
              child: Stack(
                children: [
                  ///////////////////////////////stack1/////////////////////
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: weight_screen,
                          height: weight_screen,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: AssetImage(
                                "assets/image/background/FirstTopImage.png"),
                          )),
                        ),
                        Container(
                          width: weight_screen,
                          height: weight_screen * 0.5,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: AssetImage(
                                "assets/image/background/vegetables-basket.png"),
                          )),
                        ),
                      ],
                    ),
                  ),
                  //////////////////////////stack2/////////////////////////////////////
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: weight_screen * 1.3,
                            width: weight_screen * 0.9,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(weight_screen * 0.1),
                              color: Colors.white,
                              border: Border(),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: SubFirst()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
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
    // LoadDataFormLocal();
  }

  Function changeFromRegistered() {
    setState(() {
      this.page = 0;
    });
    // print("hello world");
  }

  // void LoadDataFormLocal() async {
  //   await initLoadHostName();
  //   await AddressThailand().init();
  // }

  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: weight_screen * 0.035,
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
                margin: EdgeInsets.only(top: 15),
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
