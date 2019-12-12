import 'package:bmi_calculator/calculate.dart';
import 'package:bmi_calculator/results.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './reuseable_card.dart';
import './icon_content.dart';
import './constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color malecolor = inactiveCardColor;
  Color femalecolor = inactiveCardColor;

  Gender gender;
  int Height = 180;
  int Weight = 20;
  int Age=20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  child: Row(children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  onpress: () {
                    setState(() {
                      gender = Gender.male;
                    });
                  },
                  color: gender == Gender.male
                      ? activeCardColor
                      : inactiveCardColor,
                  cardChild: IconContent(
                      icon: Icon(FontAwesomeIcons.mars, size: 80),
                      text: 'MALE'),
                )),
                Expanded(
                    child: ReusableCard(
                        onpress: () {
                          setState(() {
                            gender = Gender.female;
                          });
                        },
                        color: gender == Gender.female
                            ? activeCardColor
                            : inactiveCardColor,
                        cardChild: IconContent(
                            icon: Icon(FontAwesomeIcons.venus, size: 80),
                            text: 'FEMALE')))
              ])),
              Expanded(
                  child: Row(children: <Widget>[
                Expanded(
                    child: new ReusableCard(
                  onpress: () {},
                  color: activeCardColor,
                  cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('HEIGHT'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              Height.toString(),
                              style: labelNumber,
                            ),
                            Text('cm'),
                          ],
                        ),
                        Slider(
                          value: Height.toDouble(),
                          min: 120,
                          max: 200,
                          activeColor: Color(0xFFEB1555),
                          onChanged: (value) {
                            setState(() {
                              Height = value.round();
                            });
                          },
                        )
                      ]),
                ))
              ])),
              Expanded(
                  child: Row(children: <Widget>[
                Expanded(
                    child: new ReusableCard(
                  color: activeCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: labelTextStyle,
                      ),
                      Text(
                        Weight.toString(),
                        style: labelNumber,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RawMaterialButton(
                            
                            shape: new CircleBorder(),
                            elevation: 0.0,
                            child: Icon(Icons.add),
                            fillColor: Colors.grey.shade600,
                            onPressed: () {setState(() {
                              Weight++;
                            });},
                            constraints: BoxConstraints.tightFor(height: 56,width:56),
                          ),
                        RawMaterialButton(
                            shape: new CircleBorder(),
                            elevation: 0.0,
                            child: Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                Weight--;
                              });
                            },
                            fillColor: Colors.grey.shade600,
                            constraints: BoxConstraints.tightFor(height: 56,width:56),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(child: ReusableCard( color: activeCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: labelTextStyle,
                      ),
                      Text(
                        Age.toString(),
                        style: labelNumber,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RawMaterialButton(
                            shape: new CircleBorder(),
                            elevation: 0.0,
                            child: Icon(Icons.add),
                            fillColor: Colors.grey.shade600,
                            onPressed: () {
                              setState(() {
                                Age++;
                              });
                            },
                            constraints: BoxConstraints.tightFor(height: 56,width:56),
                          ),
                        RawMaterialButton(
                            shape: new CircleBorder(),
                            elevation: 0.0,
                            child: Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                Age--;
                              });
                            },
                            fillColor: Colors.grey.shade600,
                            constraints: BoxConstraints.tightFor(height: 56,width:56),
                          ),
                        ],
                      )
                    ],
                  ),))
              ])),
              GestureDetector(
                onTap: (){
                  Calculate calc=Calculate(height: Height,weight: Weight);

                      Navigator.push(context, MaterialPageRoute(builder:(context)=>ResultsPage(
                      result: calc.calc(),resulttext: calc.result(),advice: calc.getadvice(), 
                      )));
                },
                              child: Container( 
                                padding: EdgeInsets.only(bottom:10),
                  child: Center(child: Text('CALCULATE',style:LargeButtoon,)),
                  color: Color(0xFFEB1555),
                  margin: EdgeInsets.only(top: 10),
                  width: double.infinity,
                  height: 50,
                ),
              )
            ]));
  }
}
