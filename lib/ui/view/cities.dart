import 'package:assignment/core/theme/colors.dart';
import 'package:assignment/logic/cubit/city_cubit.dart';
import 'package:assignment/logic/cubit/result_state.dart';
import 'package:assignment/model/city/city_response.dart';
import 'package:assignment/navigation/router.gr.dart';
import 'package:assignment/network/dio_exception.dart';
import 'package:assignment/ui/widget/cities/city_card.dart';
import 'package:assignment/ui/widget/cities/city_list.dart';
import 'package:assignment/ui/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';

class Cities extends StatefulWidget {
  const Cities({ Key? key }) : super(key: key);

  @override
  State<Cities> createState() => _CitiesState();
}


class _CitiesState extends State<Cities> {
  @override

  @override
void initState() {
  BlocProvider.of<CityCubit>(context)
        .loadCities();


    super.initState();
}
  Widget build(BuildContext context) {  
    Size size = MediaQuery.of(context).size;
return 
    Container(
                  height: size.height,
                  width: size.width,
                  child: Center(
                    child: BlocBuilder<CityCubit, ResultState<List<Datas>>>(
                      builder:
                          (BuildContext context, ResultState<List<Datas>> state) {
                        return state.when(
                          loading: () {
                            return Center(child: LoadingScreen());
                          },
                          idle: () {
                            return Center(child: LoadingScreen());
                          },
                          data: (List<Datas> data) {
                            return Container(
      margin: EdgeInsets.only(top: 150),
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: (){
              debugPrint("I worked"+data[index].name.toString());
        context.navigateTo(WheatherRouter(cityQuery: data[index].name ));



              
            
        }
            ,
            child: Citylistcard(cityName: data[index].name.toString()));
        },
      ),
    );
                          },
                          error: (DioExceptions error) {
                            return Center(
                                child: ErrorScreen(
                                    error:
                                        DioExceptions.getErrorMessage(error)));
                          },
                        );
                      },
                    ),
                  ),
                );
  }
}