
import 'package:flutter/material.dart';
import 'package:flutter_bmi_portfolio/components/button_bottom.dart';
import 'package:flutter_bmi_portfolio/components/reuseable_card.dart';
import '../constraint.dart';


class ResultsPages extends StatelessWidget {

  final String bmiResult;
  final String resultText;
  final String interpertation;

  const ResultsPages({@required this.bmiResult,@required this.resultText,@required this.interpertation});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI 계산기"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
            Expanded(
              child: Container(
          child: Text('BMI 결과', style: kTitleTextStyle,),
      ),
            ),
          Expanded(
            flex: 5,
            child: ReuseableCard(
              colour: Colors.black,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                    Text(bmiResult, style: kResultTextStyle,),
                    Text(resultText, style: kResultContentStyle,),
                  Text(interpertation,
                  style: kBodyTextStyle,
                  textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(onTap: (){
            Navigator.pop(context);
          }, buttonTItle: '다시하기'),
        ],
      )
    );
  }
}
