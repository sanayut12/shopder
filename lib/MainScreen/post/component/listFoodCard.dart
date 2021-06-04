import 'package:flutter/material.dart';
import 'package:shopder/function/dataManagement/dataWriteFoodPost.dart';

class FoodCard extends StatefulWidget {
  final int index;
  final ItemFoodInfo itemFoodInfo;
  FoodCard({@required this.index, @required this.itemFoodInfo});
  @override
  _FoodCardState createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 100,
      width: 100,
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.memory(
              this.widget.itemFoodInfo.image,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
