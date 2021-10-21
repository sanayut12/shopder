// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:shopder/MainScreen/subScreen/subItemConfirmScreen/subItemConfirmPost/subMenu/ItemConfirmPostMenu_MenuComponent.dart';
// import 'package:shopder/function/dataManagement/Readhostname.dart';
// import 'package:shopder/function/http/ClassObjects/httpGetPostShopItemData.dart';

// class FullItemConfirmPost_ListMenuComponent extends StatefulWidget {
//   final GetPostShopItemDataResposne data;
//   FullItemConfirmPost_ListMenuComponent({@required this.data});

//   @override
//   _FullItemConfirmPost_ListMenuComponentState createState() =>
//       _FullItemConfirmPost_ListMenuComponentState();
// }

// class _FullItemConfirmPost_ListMenuComponentState
//     extends State<FullItemConfirmPost_ListMenuComponent> {
//   @override
//   Widget build(BuildContext context) {
//     double weight_screen = MediaQuery.of(context).size.width;

//     List<Widget> buffer = [];
//     this.widget.data.bufferInventory.forEach((key, value) {
//       String inventory_id = key;
//       String menu_id = this.widget.data.bufferInventory[inventory_id].menu_id;
//       String image = this.widget.data.bufferMenu[menu_id].path;
//       String name = this.widget.data.bufferMenu[menu_id].name;

//       int quantity = this.widget.data.bufferInventory[inventory_id].quantity;
//       int cost = this.widget.data.bufferInventory[inventory_id].cost;
//       int item = 0;

//       this.widget.data.bufferBill.forEach((key1, value) {
//         if (value.status == "1" ||
//             value.status == "2" ||
//             value.status == "3" ||
//             value.status == "4") {
//           // print("${value.status}");
//           this.widget.data.bufferItem.forEach((key2, value) {
//             if (value.bill_id == key1 && value.inventory_id == inventory_id) {
//               item += value.quantity;
//             }
//           });
//         }
//       });
//       buffer.add(ItemConfirmPostMenu_MenuComponent(
//           name: name,
//           image: image,
//           quantity: quantity,
//           hole: item,
//           cost: cost)); //ShowMenu(_name, _image, _quantity, _cost, _item)
//     });

//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.all(2),
//       margin: EdgeInsets.all(5),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(weight_screen * 0.05)),
//       child: Column(
//         children: buffer,
//       ),
//     );
//   }
// }
