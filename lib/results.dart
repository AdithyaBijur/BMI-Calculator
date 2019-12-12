import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reuseable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final String result;
  final String resulttext;
  final String advice;
  ResultsPage({this.result,this.resulttext,this.advice});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Container(
                padding: EdgeInsets.all(15) ,
                alignment: Alignment.bottomLeft,
            child: Text(
              'Your Result',
              style: Tilte,
            ),
          )),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                  resulttext.toUpperCase(),
                    style: ResultStyle,
                  ),
                  Text(result, style: KBMI),
                  Text(
                   advice,
                    style: TextStyle(fontSize: 22),
                    textAlign: TextAlign.center,
                  ),FloatingActionButton(child: Icon(Icons.arrow_back),onPressed: (){Navigator.pop(context);},)
                ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
