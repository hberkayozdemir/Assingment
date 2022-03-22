import 'package:assignment/core/theme/colors.dart';
import 'package:assignment/model/weather/wheather_response.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
class CalculatedWeather extends StatelessWidget {
   final Current data;
   CalculatedWeather( this.data);

  @override
  Widget build(BuildContext context) {
  
    return Container(

        
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: getColor(data.temperature!),
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Column(

          children: [
            Text(data.weatherDescriptions.toString()),
            Expanded(
              child: FlareActor(
                "assets/objects/WorldSpin.flr",
                fit: BoxFit.contain,
                animation: "roll",
              ),
             
            )
          ],
        ));
  }
}


List<Color> getColor(int feels){
  if(feels<=0){
    List<Color> snowy=[
stormy2,Colors.white12,Colors.white

    ];

return snowy;
    }

else if(feels >=5){
return stormy;
}
else if(feels>=10){
  return sunny;
}
else{
  return stormy;
}

  }

