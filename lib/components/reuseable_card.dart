import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {


  final Color colour;
  final Widget cardChild; //위젯을 변수로 받음.
  final Function onPress;

  const ReuseableCard({Key key, this.colour, this.cardChild, this.onPress}) : super(key: key); //콜백함수 만들기

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
