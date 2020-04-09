import 'package:flutter/material.dart';

import '../constraint.dart';



class IconContent extends StatelessWidget {

  final IconData icon;//IconData인지는 저게 무엇인지 확인하면 된다.
  final String label;

  const IconContent({Key key, this.icon, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          icon, size: 80.0,color: Colors.white,),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,style: kLabelTextStyle,
        )
      ],
    );
  }
}