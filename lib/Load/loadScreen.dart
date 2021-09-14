import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';
import 'package:shopder/function/dataManagement/readJsonAddress.dart';

class LoadScreen extends StatefulWidget {
  @override
  _LoadScreenState createState() => _LoadScreenState();
}

class _LoadScreenState extends State<LoadScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        color: Colors.yellow,
        child: Text("Loading"),
      ),
    );
  }

  Future<void> Load() async {
    await initLoadHostName();
    await AddressThailand().init();

    bool check = await ShopInfoMamagement().init();
    print(check);
    if (check == true) {
      Navigator.of(context).pushNamed("/main");
    } else {
      Navigator.of(context).pushNamed("/login");
    }
  }
}
