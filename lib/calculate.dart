import 'dart:math';

class Calculate {
  final int height;
  final int weight;
 double _bmi;
  Calculate({this.height, this.weight});
  String calc() {
   _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }
  String result(){
  
    if (_bmi >= 25)
    {return 'Overweight';}
    else if(_bmi > 18.5)
    {return 'Normal';}
    else
  {  return 'Underweight';}
  }

  String getadvice()
  {
     if (_bmi >= 25)
    {return 'You have a higher than normal body weight';}
    else if(_bmi>18.5)
{    return 'You have a normal body weight';}
    else
   { return 'You have a below normal body weight';
}
  }
}
