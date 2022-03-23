import 'package:assignment/core/theme/typhography.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  String ?weatherDesciription;
   Description({ Key? key,this.weatherDesciription }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: EdgeInsets.only(top:150, left: 20, bottom: 20),
       alignment:Alignment.topLeft ,
      child: Text(weatherDesciription??"Nice",style:hl3),
      
    );
  }
}