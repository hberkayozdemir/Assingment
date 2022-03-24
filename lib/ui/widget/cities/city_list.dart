import 'package:assignment/logic/cubit/result_state.dart';
import 'package:assignment/model/city/city_response.dart';
import 'package:assignment/navigation/router.gr.dart';
import 'package:assignment/ui/widget/cities/city_card.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class CityList extends StatelessWidget {
  List<Datas> a;
  CityList({Key? key, required this.a}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 150),
      child: ListView.builder(
        itemCount: a.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: (){
              debugPrint("I worked"+a[index].name.toString());

        context.router.push(
          
          WheatherRouter(
            cityQuery: a[index].name,
          ));
              
            
        }
            ,
            child: Citylistcard(cityName: a[index].name.toString()));
        },
      ),
    );
  }
}
