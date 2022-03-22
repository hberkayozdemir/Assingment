import 'package:assignment/core/helpers/responsive_manager.dart';
import 'package:assignment/core/theme/colors.dart';
import 'package:assignment/logic/cubit/result_state.dart';
import 'package:assignment/logic/cubit/wheather_cubit.dart';
import 'package:assignment/model/weather/wheather_response.dart';
import 'package:assignment/network/dio_exception.dart';
import 'package:assignment/ui/widget/empty_widget.dart';
import 'package:assignment/ui/widget/error_widget.dart';
import 'package:assignment/ui/widget/loading_widget.dart';
import 'package:assignment/ui/widget/weather_calculated.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CityWeather extends StatefulWidget {

   CityWeather({Key? key}) : super(key: key);


  @override
  State<CityWeather> createState() => _CityWeatherState();
}

class _CityWeatherState extends State<CityWeather> {
  @override
  void initState() {
  
    BlocProvider.of<WheatherCubit>(context).loadMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  
 final cubit = context.watch<WheatherCubit>();
Size size=MediaQuery.of(context).size;

    return Scaffold(

      extendBodyBehindAppBar: true,
        appBar: AppBar(

          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(cubit.city),
              Icon(Icons.location_on)
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(child:Icon(Icons.settings), onTap: (){



          }, ),
          actions: [IconButton(onPressed: (){
      
          }, icon: const Icon(Icons.search))],

        ),
        body: ResponsiveManager(
            mobile: RefreshIndicator(
              onRefresh: () async {
                initState();
                debugPrintDone;
              },
              child: SingleChildScrollView(
                // To make RefreshIndicator work, it child widget should scroll, thats why I added [AlwaysScrollableScrollPhysics]
                physics: AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),

                // You can fill this with anyting you like, or even you can use [ListView]

                child: Container(
                  height: size.height,
                  width: size.width,
                  child: Center(
                    child: BlocBuilder<WheatherCubit, ResultState<Current>>(
                      builder: (BuildContext context, ResultState<Current> state) {
                        return state.when(
                          loading: () {
                            return Center(child: LoadingScreen());
                          },
                          idle: () {
                            return Center(child: LoadingScreen());
                          },
                          data: (Current wheather) {
                            return CalculatedWeather(wheather);
                          },
                          error: (DioExceptions error) {
                            return Center(
                                child: ErrorScreen(error:DioExceptions.getErrorMessage(error)));
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            tablet: Row(children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: stormy1,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: stormy2,
                ),
              )
            ]),
            desktop: Row(children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: stormy1,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: stormy1,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: stormy2,
                ),
              )
            ])));
  }
}
