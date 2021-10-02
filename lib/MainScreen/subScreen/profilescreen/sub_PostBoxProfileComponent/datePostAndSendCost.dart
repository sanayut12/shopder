import 'package:flutter/cupertino.dart';
import 'package:shopder/function/dataManagement/dateBox.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShopData.dart';

class DatePostAndSendCost extends StatefulWidget {
  final PostShopData_post postShopData_post;
  DatePostAndSendCost({@required this.postShopData_post});
  @override
  _DatePostAndSendCostState createState() => _DatePostAndSendCostState();
}

class _DatePostAndSendCostState extends State<DatePostAndSendCost> {
  Map<String, String> how_send_item = {
    "1": "สั่งถึงที่",
    "2": "รับที่ร้าน",
    "3": "ส่งถึงที่/รับที่ร้าน"
  };

  @override
  Widget build(BuildContext context) {
    Widget DateStartComponent = Container(
      margin: EdgeInsets.only(left: 5,top: 5), //วันที่โพสต์ขาย
      child: Text("${this.widget.postShopData_post.start.ToString()}"),
    );

    Widget SendCostComponent = Container(
      margin: EdgeInsets.only(right: 5,top: 5),
        child: Text(this.widget.postShopData_post.sendCost == 0
            ? "ค่าส่ง ฟรี"
            : "ค่าส่ง ${this.widget.postShopData_post.sendCost} บาท"));
    Widget DateStopComponent = Container(
      margin: EdgeInsets.only(left: 5), //วันที่ปิดการจอง
      child: Text("วันที่ปิดการจอง${this.widget.postShopData_post.stop.ToString()}"),
    );  
    Widget DateSendComponent = Container(
     // color:Color(0xFFFDAC00),
      margin: EdgeInsets.only(left: 5), //ขวาอันที่2วันที่จัดส่ง
      child: Text( "วันที่จัดส่ง${this.widget.postShopData_post.send.ToString()}"),
    );
    return Container(
    
        // height: 50,
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DateStartComponent,
                SendCostComponent,
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                 margin: EdgeInsets.only(right: 100),),
                DateStopComponent,
                DateSendComponent,
                ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 5,top: 10,bottom: 10), //ส่งถึงที่/รับที่ร้าน
               child: Text("${how_send_item[this.widget.postShopData_post.how_send]}")),
              ],
            )
          ],
        ));
  }
}
