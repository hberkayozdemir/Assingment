import 'package:assignment/core/theme/typhography.dart';
import 'package:flutter/material.dart';

class Citylistcard extends StatefulWidget {

  String cityName;
   Citylistcard({ Key? key ,required this.cityName}) : super(key: key);

  @override
  State<Citylistcard> createState() => _CitylistcardState();
}

class _CitylistcardState extends State<Citylistcard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
      borderRadius: BorderRadius.circular(24)
      ),

      child:Center(child: Text("Şehir:"+widget.cityName,style: writeStyle, )),
    );
  }
}