import 'package:flutter/cupertino.dart';
import 'package:shopder/function/dataManagement/Readhostname.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectGetPostUsers_Data.dart';

class PostUsers_ShowImageComponent extends StatefulWidget {
  GetPostUsersDataResponse data;
  PostUsers_ShowImageComponent({@required this.data});
  @override
  _PostUsers_ShowImageComponentState createState() =>
      _PostUsers_ShowImageComponentState();
}

class _PostUsers_ShowImageComponentState
    extends State<PostUsers_ShowImageComponent> {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    GetPostUsersDataResponse data = this.widget.data;
    if (data.post_info.bufferImage.length == 0) {
      return Container();
    } else {
      return Container(
        height: weight_screen * 0.9,
        width: weight_screen * 0.9,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.post_info.bufferImage.length,
            itemBuilder: (BuildContext context, int index) {
              String image = data.post_info.bufferImage[index];
              return ShowImagePostUsers(image: image);
            }),
      );
    }
  }
}

class ShowImagePostUsers extends StatefulWidget {
  String image;
  ShowImagePostUsers({@required this.image});
  @override
  _ShowImagePostUsersState createState() => _ShowImagePostUsersState();
}

class _ShowImagePostUsersState extends State<ShowImagePostUsers> {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    return Container(
      height: weight_screen * 0.9,
      width: weight_screen * 0.9,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "${HostName()}/image/menuImage/${this.widget.image}"))),
    );
  }
}
