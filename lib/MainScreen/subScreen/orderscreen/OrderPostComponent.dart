import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/component/profileinpostComponent.dart';
import 'package:shopder/MainScreen/subScreen/orderscreen/OrderMenuComponent.dart';
import 'package:shopder/function/dataManagement/dataOrderPost.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';
import 'package:shopder/function/dataManagement/dateBox.dart';

class OrderPostComponent extends StatefulWidget {
  final Post post;
  final MenuOrder bufferMenu;
  OrderPostComponent({@required this.post, @required this.bufferMenu});
  @override
  _OrderPostComponentState createState() => _OrderPostComponentState();
}

class _OrderPostComponentState extends State<OrderPostComponent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget MenuTable = Container(
      color: Colors.grey[200],
      child: Row(
        children: [
          Container(width: 100, child: Center(child: Text("สินค้า"))),
          Expanded(
              child:
                  Container(alignment: Alignment.center, child: Text("จำนวน"))),
          Expanded(
              child: Container(
                  alignment: Alignment.center, child: Text("จองแล้ว"))),
          Expanded(
              child: Container(
                  alignment: Alignment.center, child: Text("รอยืนยัน"))),
          Expanded(
              child: Container(
                  alignment: Alignment.center, child: Text("คงเหลือ"))),
        ],
      ),
    );

    List<Widget> MenuList = [];
    if (this.widget.bufferMenu.bufferMenu.length > 0) {
      MenuList.add(MenuTable);
    }
    this.widget.bufferMenu.bufferMenu.forEach((key, value) {
      print("${value.name}");
      MenuList.add(OrderMenuScreenComponent(menu: value));
    });
    return Container(
      margin: EdgeInsets.only(left: 3, right: 3, top: 3, bottom: 5),
      // height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.red,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          ProfileInPostComponent(),
          UnderProfileInPost(
            date_start: this.widget.post.start,
            sendCost: this.widget.post.sendCost,
          ),
          // Text("${this.widget.post.}"),
          DetailPostComponent(
            detail: this.widget.post.detail,
          ),

          Column(
            children: MenuList,
          ),
          DateStopAndSend(
              stop: this.widget.post.stop, send: this.widget.post.send),
          Text("${shopInfo.name}")
        ],
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////
class UnderProfileInPost extends StatefulWidget {
  final DateBox date_start;
  final int sendCost;
  UnderProfileInPost({@required this.date_start, @required this.sendCost});
  @override
  _UnderProfileInPostState createState() => _UnderProfileInPostState();
}

class _UnderProfileInPostState extends State<UnderProfileInPost> {
  @override
  Widget build(BuildContext context) {
    Widget DateStart = Container(
      margin: EdgeInsets.only(left: 5),
      child: Text("${this.widget.date_start.ToString()}"),
    );

    Widget SendCost = Container(
      margin: EdgeInsets.only(right: 5),
      child: Text("ค่าจัดส่ง ${this.widget.sendCost} บาท"),
    );
    return Container(
      height: 20,
      width: double.infinity,
      // color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [DateStart, SendCost],
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////
class DetailPostComponent extends StatefulWidget {
  final String detail;
  DetailPostComponent({@required this.detail});
  @override
  _DetailPostComponentState createState() => _DetailPostComponentState();
}

class _DetailPostComponentState extends State<DetailPostComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: this.widget.detail == 'null'
          ? Text("")
          : Text("${this.widget.detail}"),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////////
class DateStopAndSend extends StatefulWidget {
  final DateBox stop, send;
  DateStopAndSend({@required this.stop, @required this.send});
  @override
  _DateStopAndSendState createState() => _DateStopAndSendState();
}

class _DateStopAndSendState extends State<DateStopAndSend> {
  @override
  Widget build(BuildContext context) {
    Widget DateStop = Container(
      child: Text("${this.widget.stop.ToString()}"),
    );
    Widget DateSend = Container(child: Text("${this.widget.send.ToString()}"));

    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [DateStop, DateSend],
      ),
    );
  }
}
