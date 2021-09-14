import 'package:flutter/cupertino.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShopBillData.dart';

class BillSendMiniPost_StatusComponent extends StatefulWidget {
  GetPostShopBillDataResposne data;
  BillSendMiniPost_StatusComponent({@required this.data});
  @override
  _BillSendMiniPost_StatusComponentState createState() =>
      _BillSendMiniPost_StatusComponentState();
}

class _BillSendMiniPost_StatusComponentState
    extends State<BillSendMiniPost_StatusComponent> {
  @override
  Widget build(BuildContext context) {
    Widget ShowDateStart = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("วันที่โพสต์"),
          Text("${this.widget.data.post_info.start.ToString()}")
        ],
      ),
    );

    Widget ShowDateStop = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("วันที่ปิดการขาย"),
          Text("${this.widget.data.post_info.stop.ToString()}")
        ],
      ),
    );

    Widget ShowDateSend = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("วันที่จะจัดส่ง"),
          Text("${this.widget.data.post_info.send.ToString()}")
        ],
      ),
    );

    Widget ShowDetail = Container(
      alignment: Alignment.centerLeft,
      child: Text("${this.widget.data.post_info.detail}"),
    );

    Widget ShowSendCost = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("ค่าจัดส่ง"),
          Text(
              "${this.widget.data.post_info.sendCost == 0 ? 'ฟรี' : this.widget.data.post_info.sendCost}")
        ],
      ),
    );

    Widget ShowHowSend = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("วิธีการจัดส่ง"),
          Text(
              "${this.widget.data.post_info.how_send == '1' ? 'ส่งถึงที่' : this.widget.data.post_info.how_send == '2' ? 'รับที่ร้าน' : 'ส่งถึงที่/รับที่ร้าน'}")
        ],
      ),
    );
    Widget ShowOverOrder = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("การรับออเดอร์เกินจำนวน"),
          Text(
              "${this.widget.data.post_info.over_order == 1 ? 'ไม่เกิน' : 'เกิน'}")
        ],
      ),
    );

    Widget ShowHowConfirm = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("วิธีการรับออเดอร์"),
          Text(
              "${this.widget.data.post_info.confirm_order == '1' ? 'ยืนยันออเดอร์อัตโนมัติ' : this.widget.data.post_info.confirm_order == '2' ? 'ยืนยันเอง' : 'ยืนยันเฉพาะที่เกิน'}")
        ],
      ),
    );

    return Container(
      child: Column(
        children: [
          ShowDateStart,
          ShowDateStop,
          ShowDateSend,
          ShowSendCost,
          ShowHowSend,
          ShowOverOrder,
          ShowHowConfirm,
          ShowDetail,
        ],
      ),
    );
  }
}
