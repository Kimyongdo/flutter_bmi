



import 'package:flutter/material.dart';
import 'package:flutter_bmi_portfolio/components/button_bottom.dart';
import 'package:flutter_bmi_portfolio/components/icon_content.dart';
import 'package:flutter_bmi_portfolio/components/reuseable_card.dart';
import 'package:flutter_bmi_portfolio/components/round_iconbutton.dart';
import 'package:flutter_bmi_portfolio/screens/result_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../calculator_brain.dart';
import '../constraint.dart';

enum EnumGender{
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  EnumGender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 30;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI 계산기')),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReuseableCard(
                  colour: selectedGender==EnumGender.male ? kActiveCardColour : kInactiveCardColour,
                  cardChild: IconContent(icon: FontAwesomeIcons.mars, label: "남자",),
                  onPress: (){
                    setState(() {
                      selectedGender=EnumGender.male;
                    });
                  },
                ),),
                Expanded(
                  child: ReuseableCard(
                  colour: selectedGender==EnumGender.female ? kActiveCardColour : kInactiveCardColour,
                  cardChild: IconContent(icon: FontAwesomeIcons.venus, label: "여자",),
                    onPress: (){
                      setState(() {
                        selectedGender=EnumGender.female;
                      });
                    },
                ),),
              ],
            )),
            Expanded(child: ReuseableCard(
              colour: kInactiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('키',style: kLabelTextStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString() ,style: kNumberTextStyle,),
                      Text('cm', style: kLabelTextStyle,),
                    ],
                  ),
                  //슬라이더 변형위해 슬라이더theme을 사용
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0)
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min:120,
                        max: 220,
                        activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue){
                         setState(() {
                           height=newValue.round();
                         });
                      },

                    ),
                  )
                ],
              ),
            ),),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(child: ReuseableCard(
                  colour: kInactiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("몸무게", style: kLabelTextStyle,),
                      Text(weight.toString(), style: kNumberTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                          SizedBox(width: 10.0,),
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                weight--;
                              });
                            },
                          ),

                        ],
                      )
                    ],
                  ),
                ),),
                Expanded(
                  child: ReuseableCard(
                    colour: kInactiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("나이", style: kLabelTextStyle,),
                        Text(age.toString(), style: kNumberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            SizedBox(width: 10.0,),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                            ),

                          ],
                        )
                      ],
                    ),
                  ),),
              ],
            )),
            BottomButton(buttonTItle: "결과보기",
              onTap: (){
              CalculatorBrain calc = CalculatorBrain(weight: weight, height: height);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  ResultsPages(
                    bmiResult: calc.calculatorBMI(),
                    resultText: calc.getResult(),
                    interpertation: calc.getInterpretation(),
                  )));
            },),
          ],
        )

    );
  }
}



