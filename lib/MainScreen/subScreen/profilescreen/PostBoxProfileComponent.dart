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
  final String post_id;
  PostBoxProfileComponent({@required this.post_id});
  @override
  _PostBoxProfileComponentState createState() =>
      _PostBoxProfileComponentState();
}

class _PostBoxProfileComponentState extends State<PostBoxProfileComponent> {
  GetPostShopDataResponse data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetPostShopData();
  }

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return Container();
    } else {
      Widget PostComponent = Container(
        // height: 100,
        width: double.infinity,
        color: Colors.amber,
        margin: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            MiniProfileShop(),
            DatePostAndSendCost(
              postShopData_post: data.postShopData_post,
            ),
            DetailPostProfileComponent(
                postShopData_post: data.postShopData_post),
            MenuListPostProfileComponent(
                bufferPostShopData_inventory: data.bufferPostShopData_inventory,
                bufferPostShopData_menu: data.bufferPostShopData_menu)
          ],
        ),
      );

      return PostComponent;
    }
  }

  void GetPostShopData() async {
    GetPostShopDataRequest bufferGetPostShopDataRequest =
        GetPostShopDataRequest(post_id: this.widget.post_id);
    GetPostShopDataResponse bufferGetPostShopDataResponse =
        await httpGetPostShopData(
            bufferGetPostShopDataRequest: bufferGetPostShopDataRequest);
    setState(() {
      data = bufferGetPostShopDataResponse;
    });
  }
}
