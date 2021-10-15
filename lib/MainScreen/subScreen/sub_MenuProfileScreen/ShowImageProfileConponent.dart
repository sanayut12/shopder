import 'package:flutter/cupertino.dart';
import 'package:shopder/function/dataManagement/Readhostname.dart';

class ShowImageProfileComponent extends StatelessWidget {
  final String path;
  ShowImageProfileComponent({@required this.path});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.6,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage("${HostName()}/image/menuImage/${path}"))),
    );
    ;
  }
}
