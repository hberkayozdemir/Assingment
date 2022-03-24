import 'package:assignment/core/theme/typhography.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class Symbol extends StatelessWidget {
  String? weatherDesciription;
  Symbol({Key? key, this.weatherDesciription}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getSymbolWidget(weatherDesciription.toString());
  }

  Widget getSymbolWidget(String desc) {
    if (desc.contains("Sunny")||desc.contains("Clear")) {
      return Container(
        height: 300, width: 350,
        child:FlareActor("assets/objects/sun.flr",
          alignment: Alignment.center,
          isPaused: false,
          fit: BoxFit.cover,
          animation: '1',));
    } else if (desc.contains("Snowy")) {
      return Container(
        height: 250, width: 350,
        child:FlareActor("assets/objects/snowfall.flr",
          alignment: Alignment.center,
          isPaused: false,
          fit: BoxFit.cover,
          animation: "animate",));
    } else if (desc.contains("Stormy")) {
      return Container(
        height: 250, width: 350,
        child:FlareActor("assets/objects/thunder.flr",
          alignment: Alignment.center,
          isPaused: false,
          fit: BoxFit.cover,
          animation: "animate",));
    }
    
     else if (desc.contains("Rainy")||desc.contains("Rain")||desc.contains("rain")) {
      return Container(
        height: 250, width: 350,
        child:FlareActor("assets/objects/rainfall.flr",
          alignment: Alignment.center,
          isPaused: false,
          fit: BoxFit.cover,
          animation: "animate",));
    }
     else {
      return Container(
        height: 250, width: 250,
        child:FlareActor("assets/objects/Penguin.flr",
          alignment: Alignment.center,
          isPaused: false,
          fit: BoxFit.cover,
          animation: "walk",));
    }
  }
}
