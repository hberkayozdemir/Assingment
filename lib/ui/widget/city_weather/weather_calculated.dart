import 'package:assignment/core/theme/colors.dart';
import 'package:assignment/model/weather/wheather_response.dart';
import 'package:assignment/ui/widget/city_weather/weather_calculated/description.dart';
import 'package:assignment/ui/widget/city_weather/weather_calculated/informations.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
class CalculatedWeather extends StatelessWidget {
   final Current data;
   CalculatedWeather( this.data);

  @override
  Widget build(BuildContext context) {
  Size size=MediaQuery.of(context).size;

    return Container(

width: size.width,
        
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: getColor(data.weatherDescriptions.toString()),
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Column(

          children: [
           Description(weatherDesciription: data.weatherDescriptions?[0]),
           
            Informations(feelsLike:data.feelslike.toString(), tempature: data.temperature, wind: data.windSpeed, humudity: data.humidity, windDirection: data.windDir),
          ],
        ));
  }
}


List<Color> getColor(String desc){
  if(desc.contains("Sunny") ){

    return sunny;
    
    }

else if(desc.contains("Snowy")){
List<Color> snowy=[
stormy2,Colors.white12,Colors.white

    ];

return snowy;
}
else if(desc.contains("Stormy")){
  return stormy;
}
else{
  return stormy;
}

  }

