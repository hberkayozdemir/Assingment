import 'package:assignment/core/theme/typhography.dart';
import 'package:flutter/material.dart';

class Informations extends StatelessWidget {
  String? feelsLike;
  num? tempature;
  num? wind;
  num? humudity;
  String? windDirection;

  Informations(
      {Key? key,
      this.feelsLike,
      this.tempature,
      this.wind,
      this.windDirection,
      this.humudity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 150, left: 20, top: 20),
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.location_pin, color: Colors.white, size: 40),
                Text(
                  "Feels Like: " + feelsLike.toString(),
                  style: hl4,
                )
              ],
            ),
            Row(
              children: [
                Flexible(
                  flex: 4,
                  child: Text(
                    tempature.toString() + " C",
                    style: hl3,
                  ),
                ),
               Flexible(
                  flex: 3,
                  child: Container(
                     margin: EdgeInsets.only(left:15),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white.withOpacity(0.3),
                    ),
                    child: Center(
                        child: Column(
                      children: [
                        Text("WIND",style: boxstyle,),
                        Text(wind.toString(),style: boxstyle,),
                        Text(windDirection.toString(),style: boxstyle,),
                      ],
                    )),
                  ),
                ),
                          Flexible(
                  flex: 3,
                             child: Container(
                               
                               margin: EdgeInsets.only(left:15),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white.withOpacity(0.3),
                  ),
                  child: Center(
                      child: Column(
                    children: [
                      Text("Humudity",style: boxstyle,),
                      Text(humudity.toString(),style: boxstyle,),
                     
                    ],
                  )),
                ),
                           )
              ],
            )
          ],
        ));
  }
}
