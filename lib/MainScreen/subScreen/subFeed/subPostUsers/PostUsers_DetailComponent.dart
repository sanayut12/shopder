import 'package:flutter/cupertino.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostUsers_Data.dart';

class PostUsers_DetailComponent extends StatefulWidget {
  GetPostUsersDataResponse data;
  PostUsers_DetailComponent({@required this.data});
  @override
  _PostUsers_DetailComponentState createState() =>
      _PostUsers_DetailComponentState();
}

class _PostUsers_DetailComponentState extends State<PostUsers_DetailComponent> {
  @override
  Widget build(BuildContext context) {
    String detail = this.widget.data.post_info.message;
    return Container(
      width: double.infinity,
      child: Text("${detail}"),
    );
  }
}
