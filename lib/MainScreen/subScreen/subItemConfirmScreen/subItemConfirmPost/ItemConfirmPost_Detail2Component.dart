import 'package:flutter/cupertino.dart';
import 'package:shopder/function/http/ClassObjects/httpGetPostShopItemData.dart';

class ItemConfirmPost_Detail2Component extends StatelessWidget {
  final PostShopItem_PostShop post_info;
  ItemConfirmPost_Detail2Component({@required this.post_info});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          this.post_info.sendCost == 0
              ? Text("ค่าจัดส่ง : ฟรี")
              : Text("ค่าจัดส่ง : ${this.post_info.sendCost} บาท"),
          Text(
              "วิธีการจัดส่ง ${this.post_info.how_send == '1' ? 'ส่งถึงที่' : ''}${this.post_info.how_send == '2' ? 'รับที่ร้าน' : ''}${this.post_info.how_send == '3' ? 'ส่งถึงที่/รับที่ร้าน' : ''}"),
          Text(
              "การรับออเดอร์เกิน ${this.post_info.over_order == '1' ? 'ใช่' : 'ไม่'}"),
          this.post_info.confirm_order == "1"
              ? Text("วิธีการรับออเดอร์ ยืนยันอัตโนมัติ")
              : this.post_info.confirm_order == "2"
                  ? Text("วิธีการรับออเดอร์ ยืนยันเอง")
                  : Text("วิธีการรับออเดอร์ ยืนยันเมื่อเกินเท่านั้น")
        ],
      ),
    );
  }
}
