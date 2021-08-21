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
      height: 100,
      width: double.infinity,
      child: Text("${this.widget.postShopData_post.detail}"),
    );
  }
}
