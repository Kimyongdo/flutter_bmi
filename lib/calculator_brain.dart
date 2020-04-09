import 'dart:math';
class CalculatorBrain{

  final int height;
  final int weight;

  double _bmi;
  CalculatorBrain({this.height, this.weight});


  String calculatorBMI(){
    _bmi = weight/pow(height/100,2);
    return _bmi.toStringAsFixed(1);//소수점 뒤에 어느정도 정할지
  }

  String getResult(){
    if(_bmi>=25){
      return "과체중";
    }else if(_bmi>18.5){
      return "정상";
    }else{
      return "저체중";
    }
  }

  String getInterpretation(){
    if(_bmi>=25){
      return "운동 좀 하셔야겠어요";
    }else if(_bmi>18.5){
      return "정상입니다 좋아요!";
    }else{
      return "닭가슴살 먹고 운동하자!";
    }
  }
}