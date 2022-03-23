import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
class EmptyScreen extends StatelessWidget {
  const EmptyScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    
    
    Container(
      child:Icon(Icons.hourglass_empty),
      height: 300,
      width: 300,
    );
  }
}