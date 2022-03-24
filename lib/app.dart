import 'package:assignment/logic/cubit/city_cubit.dart';
import 'package:assignment/logic/cubit/wheather_cubit.dart';
import 'package:assignment/navigation/router.gr.dart';

import 'package:assignment/network/api_repository.dart';
import 'package:assignment/ui/view/city_weather.dart';
import 'package:assignment/ui/view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}


class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    final _appRouter=AppRouter();
    
    return MultiBlocProvider(
      providers: [
        BlocProvider<WheatherCubit>(
          create: (BuildContext context) {
            return WheatherCubit(apiRepository: APIRepository());
          },
          // child: ViewNavigation(),
        ), 
            BlocProvider<CityCubit>(
          create: (BuildContext context) {
            return CityCubit(apiRepository: APIRepository());
          },
          // child: ViewNavigation(),
        ), 
      ],
      child: MaterialApp.router(
        title: 'Wheather Application',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),


      ),
    );
  }
}
