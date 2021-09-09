// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:shopder/MainScreen/subScreen/sebFullItemConfirmScreen/FullItemConfirmPostListBill_BillComponent.dart';
// import 'package:shopder/function/http/ClassObjects/httpGetPostShopItemData.dart';

// class FullItemConfirmPost_ListBillComponent extends StatefulWidget {
//   final GetPostShopItemDataResposne data;
//   FullItemConfirmPost_ListBillComponent({@required this.data});
//   @override
//   _FullItemConfirmPost_ListBillComponentState createState() =>
//       _FullItemConfirmPost_ListBillComponentState();
// }

// class _FullItemConfirmPost_ListBillComponentState
//     extends State<FullItemConfirmPost_ListBillComponent> {
//   @override
//   Widget build(BuildContext context) {
//     List<Widget> buffer = [];
//     //บิลที่รอยืนยัน
//     this.widget.data.bufferBill.forEach((key, value) {
//       if (value.status == "0") {
//         buffer.add(FullItemConfirmPostListBill_BillComponent(
//             bill_id: key, status: 0, data: this.widget.data));
//       }
//     });
//     //บิลที่รับแล้ว
//     this.widget.data.bufferBill.forEach((key, value) {
//       if (value.status == "1" ||
//           value.status == "2" ||
//           value.status == "3" ||
//           value.status == "4") {
//         buffer.add(FullItemConfirmPostListBill_BillComponent(
//             bill_id: key, status: 1, data: this.widget.data));
//         ;
//       }
//     });
//     //บิลที่ยกเลิก
//     this.widget.data.bufferBill.forEach((key, value) {
//       if (value.status == "9") {
//         buffer.add(FullItemConfirmPostListBill_BillComponent(
//             bill_id: key, status: 2, data: this.widget.data));
//       }
//     });
//     return Container(
//       color: Colors.pink,
//       child: ListView(children: buffer),
//     );
//   }
// }
