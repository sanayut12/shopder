import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/Secondary/billScreen.dart';
import 'package:shopder/MainScreen/subScreen/billscreen/subbillScreen/billScreen/billScreen.dart';
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/dataManagement/dataOrderPost.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetBill.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetOrderAndUser.dart';
// import 'package:shopder/function/dataManagement/dataOrderPost.dart';
// import 'package:shopder/function/http/ClassObjects/httpObjectGetBill.dart';
// import 'package:shopder/function/http/ClassObjects/httpObjectGetOrderAndUser.dart';

class UserBillComponent extends StatefulWidget {
  final Post post;
  final MenuOrder menuList;
  final Bill bill; //รลิสต์ รายการบิล
  final String user_id;
  final UserBill user; //<user_id , .....>
  final Map<String, InventoryBill> bufferInventoryBill; //<item_id , ......>
  UserBillComponent(
      {@required this.post,
      @required this.menuList,
      @required this.bill,
      @required this.user_id,
      @required this.user,
      @required this.bufferInventoryBill});
  @override
  _UserBillComponentState createState() => _UserBillComponentState();
}

class _UserBillComponentState extends State<UserBillComponent> {
  int countOrder = 0;
  int costSend = 0;
  String buffer = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      this.widget.bufferInventoryBill.forEach((key, value1) {
        countOrder += value1.quantity;
        this.widget.menuList.bufferMenu.forEach((key, value2) {
          if (value1.inventory_id == value2.inventory_id) {
            costSend += value2.cost * value1.quantity;
            // buffer += " ${value2.cost} * ${value1.quantity} ";
          }
        });
      });

      costSend += this.widget.post.sendCost;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget ImageUser = Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: this.widget.user.image == null
              ? NetworkImage(
                  "https://cdn.pixabay.com/photo/2019/10/16/09/09/doraemon-4553920_1280.png")
              : NetworkImage("${HostName()}/"),
        ),
      ),
    );
    Widget NameUser = Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: Text("${this.widget.user.name}"),
    );
    Widget CountOrder = Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: Text("จำนวน ${countOrder} ชิ้น"),
    );
    Widget TotalCost = Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      child: Text("รวมทั้งสิ้น ${costSend} บาท"), //
    );
    Widget FromBox = Row(
      children: [
        ImageUser,
        Expanded(
            child: Column(
          children: [Expanded(child: NameUser), Expanded(child: CountOrder)],
        )),
        Expanded(child: TotalCost)
      ],
    );
    return GestureDetector(
      onTap: () {
        // print("${this.widget.user.name}");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => UserBillScreen(
                  post: this.widget.post,
                  menuList: this.widget.menuList,
                  bill: this.widget.bill,
                  user_id: this.widget.user_id,
                  user: this.widget.user,
                  bufferInventoryBill: this.widget.bufferInventoryBill,
                )));
      },
      child: Container(
        margin: EdgeInsets.all(5),
        color: Colors.red,
        height: 80,
        width: double.infinity,
        child: FromBox,
      ),
    );
  }
}
