import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShopData.dart';

class ShowDetailComponent extends StatefulWidget {
  final PostShopData_inventory postShopData_inventory;
  final PostShopData_menu postShopData_menu;
 // final PostShopData_post postShopData_post;
  
  ShowDetailComponent(
      {@required this.postShopData_inventory,
      @required this.postShopData_menu/*,
      @required this.postShopData_post*/});
  @override
  _ShowDetailComponentState createState() => _ShowDetailComponentState();
}

class _ShowDetailComponentState extends State<ShowDetailComponent> {
  Map<String, String> foodtype = {
    "1": "อาหารอีสาน",
    "2": "อาหารหวาน",
    "3": "เครื่องดื่ม",
    "4": "ของทอด"
  };
  @override
  Widget build(BuildContext context) {
    Widget NameMenuComponent = Container(
      padding: EdgeInsets.only(top: 10),
      // decoration: BoxDecoration(
      //   color: Color(0xFFF2A490),
      //   borderRadius: new BorderRadius.only(
      //           topLeft: const Radius.circular(40.0),
      //           topRight: const Radius.circular(40.0),
      //         ),
      // ),
      height: MediaQuery.of(context).size.height * 0.08,
      width: double.infinity,
      
      alignment: Alignment.center,
      
      child: Text(
        "${this.widget.postShopData_menu.name}",
        style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.05,fontWeight: FontWeight.bold),
      ),
    );

   /* Widget DetailMenuComponent = Container(
        height: MediaQuery.of(context).size.height * 0.5,
        width: double.infinity,
        color: Color(0xFFF2A490),
      //  color: Colors.green,
        alignment: Alignment.centerLeft,
        child: Column(
          children: [
            Text("รายละเอียดสินค้",
            style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.025,fontWeight: FontWeight.bold),),
            
            this.widget.postShopData_menu.detail == "null"
                ? Text("")
                : Text(
                    "${this.widget.postShopData_menu.detail}",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.025),
                  ),
          ],
        ));*/

    Widget CostMenuComponent = Container(
      padding: EdgeInsets.only(top: 30),
      height: MediaQuery.of(context).size.height * 0.08,
      width: double.infinity,
    //  color: Color(0xFFF2A490),
     // color: Colors.green,
      alignment: Alignment.center,
      child: Text(
        "ราคา ${this.widget.postShopData_inventory.cost} บาท",
        style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.025,fontWeight: FontWeight.bold),
      ),
    );
    Widget QuantityMenuComponent = Container(
      padding: EdgeInsets.only(top: 30),
      height: MediaQuery.of(context).size.height * 0.08,
      width: double.infinity,
    //  color: Color(0xFFF2A490),
     // color: Colors.green,
      alignment: Alignment.center,
      child: Text(
        "จำนวน ${this.widget.postShopData_inventory.quantity}",
        style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.025,fontWeight: FontWeight.bold),
      ),
    );

    Widget TypeMenuComponent = Container(
      padding: EdgeInsets.only(top: 20),
      height: MediaQuery.of(context).size.height * 0.08,
      width: double.infinity,
     // color: Color(0xFFF2A490),
     // color: Colors.green,
      alignment: Alignment.center,
      child: Text(
        "ชนิดสินค้า ${foodtype[this.widget.postShopData_menu.type]}",
        style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.025),
      ),
    );
    // Widget DateStopComponent = Container(
    //   padding: EdgeInsets.only(top: 30),
    //   height: MediaQuery.of(context).size.height * 0.08,
    //   width: double.infinity,
    //   color: Color(0xFFF2A490),
    //  // color: Colors.green,
    //   alignment: Alignment.center,
      // child: Text(
      //   "วันที่ปิดการจอง${this.widget.postShopData_post.stop.ToString()}",
      //   style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.025),
      // ),
    // );
    
    Widget DetailMenuComponent = Container(
      decoration: BoxDecoration(
      
      ),
     padding: EdgeInsets.only(top: 10,left: 10),
        height: MediaQuery.of(context).size.height * 0.5,
        width: double.infinity,
      //  color: Color(0xFFF2A490),
      //  color: Colors.green,
        alignment: Alignment.centerLeft,
        child: Column(
          children: [
            Row(children: [
              Icon(Icons.article_outlined,color: Colors.red,),
            Text("รายละเอียดสินค้า",
            style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.025,fontWeight: FontWeight.bold),),],),
            this.widget.postShopData_menu.detail == "null"
                ? Text("")
                : Text(
                    " ${this.widget.postShopData_menu.detail}",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.025),
                  ),
          ],
        ));

    return Container(
      decoration: BoxDecoration(
         borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(40.0),
                topRight: const Radius.circular(40.0),
              ),
         gradient: LinearGradient(
          colors:[Color(0xFFF2A490),Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
                0.0,
               0.9,
              ],
              ),
        ),
      child: Column(
        children: [
          NameMenuComponent,
         // DetailMenuComponent,
          Row(
            children: [
              Expanded(child: QuantityMenuComponent),
              Expanded(child: CostMenuComponent),
            ],
          ),
          TypeMenuComponent,
         // DateStopComponent,
         // DateSendComponent,
          DetailMenuComponent,
        ],
      ),
    );
  }
}
