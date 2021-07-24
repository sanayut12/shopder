import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/dataManagement/dataPostShop.dart';

class MenuBox extends StatefulWidget {
  final MenuList bufferMenuList;
  MenuBox({@required this.bufferMenuList});

  @override
  _MenuBoxState createState() => _MenuBoxState();
}

class _MenuBoxState extends State<MenuBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      height: double.infinity,
      width: 200,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "${HostName()}/image/menuImage/${this.widget.bufferMenuList.path}"))),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${this.widget.bufferMenuList.name}",
                  style: TextStyle(
                      fontSize: 18.5,
                      // color: Colors.orange,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 25,
                  width: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text("${this.widget.bufferMenuList.cost} บาท"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
