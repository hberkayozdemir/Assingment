import 'package:assignment/core/theme/typhography.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:assignment/core/theme/colors.dart';

class ErrorScreen extends StatelessWidget {
  String error;
   ErrorScreen({Key? key,required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

        
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: stormy,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Expanded(
          child: Column(
           
            children: [
              Container(
                child: Icon(Icons.error,size: 100,)
                
               
              ),
              Container(child: Text(error,style:hl1))
            ],
          ),
        ));
  }
}
