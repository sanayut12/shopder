import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/function/dataManagement/dataWriteFoodPost.dart';

class MenuListDisplayComponent extends StatefulWidget {
  List<ItemFoodInfo> bufferItemFoodInfo;
  MenuListDisplayComponent({@required this.bufferItemFoodInfo});
  @override
  _MenuListDisplayComponentState createState() =>
      _MenuListDisplayComponentState();
}

class _MenuListDisplayComponentState extends State<MenuListDisplayComponent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle font = TextStyle(
        fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white);

    Widget ImageMenu({@required String image}) => Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: MemoryImage(base64Decode(image)))),
        );

    Widget DetailMenu({@required ItemFoodInfo item}) => Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "${item.name}",
                style: font,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "${item.cost} บาท",
                    style: font,
                  ),
                  Text(
                    "${item.quantity} จำนวน",
                    style: font,
                  )
                ],
              )
            ],
          ),
        );
    Widget Card({@required ItemFoodInfo item}) => Container(
          height: (MediaQuery.of(context).size.width - 60) * 0.8,
          width: MediaQuery.of(context).size.width - 60,
          child: Stack(
            children: [
              Expanded(child: ImageMenu(image: item.listImage[0])),
              Expanded(child: DetailMenu(item: item))
            ],
          ),
        );

    return Container(
      color: Colors.grey[100],
      height: (MediaQuery.of(context).size.width - 60) * 0.8,
      width: MediaQuery.of(context).size.width - 60,
      child: ListView.builder(
          itemCount: this.widget.bufferItemFoodInfo.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Card(item: this.widget.bufferItemFoodInfo[index]);
          }),
    );
  }
}
