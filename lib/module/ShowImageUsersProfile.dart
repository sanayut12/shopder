import 'package:flutter/cupertino.dart';
import 'package:shopder/function/dataManagement/Readhostname.dart';

class ShowImageUsersProfile extends StatefulWidget {
  String image;
  ShowImageUsersProfile({@required this.image});
  @override
  _ShowImageUsersProfileState createState() => _ShowImageUsersProfileState();
}

class _ShowImageUsersProfileState extends State<ShowImageUsersProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "${HostName()}/image/ImageUsers/${this.widget.image}"))),
    );
  }
}
