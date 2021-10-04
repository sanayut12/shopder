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
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.only(top: 3, bottom: 2, right: 10, left: 10),
      child: Column(
        children: [
          MiniProfileShop(
            data: this.widget.data,
          ),
          DetailPostProfileComponent(
              postShopData_post: this.widget.data.postShopData_post),
          MenuListPostProfileComponent(data: this.widget.data),
          DatePostAndSendCost(
            postShopData_post: this.widget.data.postShopData_post,
          )
        ],
      ),
    );

    return PostComponent;
  }
}
