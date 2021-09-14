import 'package:flutter/cupertino.dart';
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShopBillData.dart';

class BillSendListBill_MiniProfilecomponent extends StatefulWidget {
  String bill_id;
  GetPostShopBillDataResposne data;
  String status;
  BillSendListBill_MiniProfilecomponent(
      {@required this.bill_id, @required this.data, @required this.status});
  @override
  _BillSendListBill_MiniProfilecomponentState createState() =>
      _BillSendListBill_MiniProfilecomponentState();
}

class _BillSendListBill_MiniProfilecomponentState
    extends State<BillSendListBill_MiniProfilecomponent> {
  @override
  Widget build(BuildContext context) {
    String user_id = "";
    this.widget.data.bufferItem.forEach((key, value) {
      if (this.widget.bill_id == value.bill_id) {
        user_id = value.user_id;
      }
    });
    Widget ShowImage(String _image) => Container(
          height: MediaQuery.of(context).size.width * 0.15,
          width: MediaQuery.of(context).size.width * 0.15,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "${_image == null ? '${HostName()}/image/menuImage/0AD3246B86B391E52B9FA3DF0163E8CB.jpg' : '${HostName()}/image/ImageUsers/${_image}'}"))),
        );
    Widget ShowName(String _name) => Container(
          child: Text("${_name}"),
        );

    String image = this.widget.data.bufferUsers[user_id].path;
    String name = this.widget.data.bufferUsers[user_id].name;
    print(image);
    return Container(
      child: Row(
        children: [
          ShowImage(image),
          ShowName(name),
          Expanded(
              child: Container(
            alignment: Alignment.bottomRight,
            child: this.widget.status == '1'
                ? Text("ยืนยันสินค้าแล้ว")
                : this.widget.status == '2'
                    ? Text("แพคสินค้าเสร็จแล้ว")
                    : this.widget.status == '3'
                        ? Text("กำลังจัดส่ง")
                        : this.widget.status == '4'
                            ? Text("ส่งสำเร็จ")
                            : Text("data"),
          ))
        ],
      ),
    );
  }
}
