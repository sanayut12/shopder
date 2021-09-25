import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/orderscreen/OrderPostComponent.dart';
import 'package:shopder/MainScreen/subScreen/profilescreen/sub_PostBoxProfileComponent/DetailPostComponent.dart';
import 'package:shopder/MainScreen/subScreen/profilescreen/sub_PostBoxProfileComponent/MenuListPostProfileComponent.dart';
import 'package:shopder/MainScreen/subScreen/profilescreen/sub_PostBoxProfileComponent/datePostAndSendCost.dart';
import 'package:shopder/MainScreen/subScreen/profilescreen/sub_PostBoxProfileComponent/miniProfileShop.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShopData.dart';
import 'package:shopder/function/http/httpGetPostShopData.dart';

class PostBoxProfileComponent extends StatefulWidget {
  GetPostShopDataResponse data;
  PostBoxProfileComponent({@required this.data});
  @override
  _PostBoxProfileComponentState createState() =>
      _PostBoxProfileComponentState();
}

class _PostBoxProfileComponentState extends State<PostBoxProfileComponent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget PostComponent = Container(
      // height: 100,
      width: double.infinity,
      color: Colors.amber,
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          MiniProfileShop(),
          DatePostAndSendCost(
            postShopData_post: this.widget.data.postShopData_post,
          ),
          DetailPostProfileComponent(
              postShopData_post: this.widget.data.postShopData_post),
          MenuListPostProfileComponent(
              bufferPostShopData_inventory:
                  this.widget.data.bufferPostShopData_inventory,
              bufferPostShopData_menu: this.widget.data.bufferPostShopData_menu)
        ],
      ),
    );

    return PostComponent;
  }
}
