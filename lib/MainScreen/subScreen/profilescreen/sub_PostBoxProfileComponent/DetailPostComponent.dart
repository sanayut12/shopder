import 'package:flutter/cupertino.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostShopData.dart';

class DetailPostProfileComponent extends StatefulWidget {
  final PostShopData_post postShopData_post;
  DetailPostProfileComponent({@required this.postShopData_post});
  @override
  _DetailPostProfileComponentState createState() =>
      _DetailPostProfileComponentState();
}


class _DetailPostProfileComponentState
    extends State<DetailPostProfileComponent> {
  @override
  Widget build(BuildContext context) {
   return Container(
   //   color:Color(0xFFFDAC00),
      height: 70,
      width: double.infinity,
      margin: EdgeInsets.only(left: 5, top: 10), //แคปชั่น
      child: Text("${this.widget.postShopData_post.detail}",
       style : TextStyle( fontSize: 16,)),
    ); 
  }
}

