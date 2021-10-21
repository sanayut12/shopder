import 'package:flutter/cupertino.dart';
import 'package:shopder/function/dataManagement/Readhostname.dart';

class Notification_showImage extends StatefulWidget {
  String image;
  Notification_showImage({@required this.image});
  @override
  _Notification_showImageState createState() => _Notification_showImageState();
}

class _Notification_showImageState extends State<Notification_showImage> {
  @override
  Widget build(BuildContext context) {
    double weight_screen = MediaQuery.of(context).size.width;
    return this.widget.image == null
        ? Container(
            height: weight_screen * 0.1,
            width: weight_screen * 0.1,
          )
        : Container(
            height: weight_screen * 0.1,
            width: weight_screen * 0.1,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "${HostName()}/image/ImageUsers/${this.widget.image}"))),
          );
  }
}
