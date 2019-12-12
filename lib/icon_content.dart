import 'package:flutter/material.dart';
import './constants.dart';
class IconContent extends StatelessWidget {
  final Widget icon;
  final String text;
    IconContent({
    this.icon,this.text   
  }) ;

  @override
  Widget build(BuildContext context) {
    return Column(
      
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
       this.icon,
        SizedBox(height: 15),
        Text(
         this.text,
          style: labelTextStyle,
        )
      ],
    );
  }
}

