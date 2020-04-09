import 'package:flutter/material.dart';
import '../constraint.dart';

class BottomButton extends StatelessWidget {

  final Function onTap;
  final String buttonTItle;

  const BottomButton({Key key, @required this.onTap,  @required this.buttonTItle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(child: Text(buttonTItle, style: kLargeButton,)),
        color:kBottomCardColour,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}