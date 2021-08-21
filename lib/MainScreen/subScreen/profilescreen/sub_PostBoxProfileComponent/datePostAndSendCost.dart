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
      child: Text("${this.widget.postShopData_post.start.ToString()}"),
    );

    Widget SendCostComponent = Container(
        child: Text(this.widget.postShopData_post.sendCost == 0
            ? "ค่าส่ง ฟรี"
            : "ค่าส่ง ${this.widget.postShopData_post.sendCost} บาท"));
    Widget DateStopComponent = Container(
      child: Text("${this.widget.postShopData_post.stop.ToString()}"),
    );
    Widget DateSendComponent = Container(
      child: Text("${this.widget.postShopData_post.send.ToString()}"),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DateStopComponent,
                DateSendComponent,
              ],
            ),
            Row(
              children: [
                Text("${how_send_item[this.widget.postShopData_post.how_send]}")
              ],
            )
          ],
        ));
  }
}
