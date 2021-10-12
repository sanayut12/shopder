import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/BillSendScreen.dart';
import 'package:shopder/function/dataManagement/dataCalendar.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShopBillData.dart';
import 'package:shopder/function/http/httpGetPostShopBillData.dart';

class Calendar_ListEventComponent extends StatefulWidget {
  Map<String, PostCalendar> bufferPostEventSelectDay;
  Calendar_ListEventComponent({@required this.bufferPostEventSelectDay});
  @override
  _Calendar_ListEventComponentState createState() =>
      _Calendar_ListEventComponentState();
}

class _Calendar_ListEventComponentState
    extends State<Calendar_ListEventComponent> {
  @override
  Widget build(BuildContext context) {
    Map<String, PostCalendar> bufferPostEventSelectDay =
        this.widget.bufferPostEventSelectDay;
    List<Widget> buffer = [];
    bufferPostEventSelectDay.forEach((key, value) {
      buffer.add(EventCard(post_id: key, postCalendar: value));
    });
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: buffer,
      ),
    );
  }
}

class EventCard extends StatefulWidget {
  String post_id;
  PostCalendar postCalendar;
  EventCard({@required this.post_id, @required this.postCalendar});
  @override
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    String post_id = this.widget.post_id;
    PostCalendar postCalendar = this.widget.postCalendar;
    double weight_screen = MediaQuery.of(context).size.width;

    Widget MessageCard = GestureDetector(
      onTap: () {
        OpenBillScreen();
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xfffa897b).withOpacity(0.6),
            border: Border.all(color: Colors.grey[200])),
        width: weight_screen * 0.7,
        child: Text(
          "ต้องส่งสินค้า จากโพสต์\n  ${postCalendar.detail}",
          style: TextStyle(fontSize: 10),
        ),
      ),
    );

    Widget ShowDate = Container(
      width: weight_screen * 0.2,
      child: Text("${postCalendar.send.hour}:${postCalendar.send.min} น."),
    );

    // Widget Buuton = Container(
    //   width: weight_screen * 0.15,
    //   color: Colors.red,
    //   child: Text("เปิด"),
    // );
    return Container(
      width: weight_screen * 0.9,
      margin: EdgeInsets.only(top: 10),
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ShowDate, MessageCard],
      ),
    );
  }

  Future<void> OpenBillScreen() async {
    GetPostShopBillDataRequest bufferGetPostShopBillDataRequest =
        GetPostShopBillDataRequest(post_id: this.widget.post_id);
    GetPostShopBillDataResposne data = await HttpGetPostShopBillData(
        bufferGetPostShopBillDataRequest: bufferGetPostShopBillDataRequest);

    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => BillSendScreen(data: data)));
  }
}
