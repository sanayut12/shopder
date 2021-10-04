import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageMenuDisplayComponent extends StatefulWidget {
  final List<String> listImage;
  ImageMenuDisplayComponent({@required this.listImage});
  @override
  _ImageMenuDisplayComponentState createState() =>
      _ImageMenuDisplayComponentState();
}

class _ImageMenuDisplayComponentState extends State<ImageMenuDisplayComponent> {
  Widget imageDisplay(String _image) => Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(image: MemoryImage(base64Decode(_image)))),
      );
  Widget delete({@required int index}) => Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.topRight,
        color: Colors.transparent,
        child: GestureDetector(
          onTap: () {
            print(index);
            // this.widget.deleteImage(index);
            setState(() {
              this.widget.listImage.removeAt(index);
            });
          },
          child: Icon(
            Icons.delete,color:Colors.grey[400],
            size: 50,
          ),
        ),
      );
  Widget CardImage(String _image, int index) => Container(
        height: double.infinity,
        width: MediaQuery.of(context).size.width - (10.0 * 4),
        decoration:
            BoxDecoration(border: Border.all( color: Colors.white,width: 5)),
        child: Stack(
          children: [
            Expanded(child: imageDisplay(_image)),
            Expanded(child: delete(index: index))
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.6,
      width: double.infinity,
      child: ListView.builder(
          itemCount: this.widget.listImage.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            // return Container(
            //   height: 100,
            //   width: 100,
            //   color: Colors.blue,
            // );
            return CardImage(this.widget.listImage[index], index);
          }),
    );
  }
}
