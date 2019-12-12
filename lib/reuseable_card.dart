import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget cardChild;
  final Function onpress;
  ReusableCard({@required this.color, this.cardChild,this.onpress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){this.onpress();},
          child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: this.color != null?this.color:Color(0xFF1D1E33),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}