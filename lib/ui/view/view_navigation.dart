import 'package:assignment/core/theme/colors.dart';
import 'package:assignment/navigation/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class ViewNavigation extends StatelessWidget {
  const ViewNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      extendBodyBehindAppBar: true,
      appBarBuilder: (_, tabsRouter) => AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
        backgroundColor:Colors.white.withOpacity(0.1),
        elevation: 1,
        leading: AutoBackButton(color: Colors.black, showIfParentCanPop: false),
      ),
      routes: [
        const CityListRouter(),
        WheatherRouter(cityQuery: ""),
        const SettingsRouter(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) => SalomonBottomBar(

          margin: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30,
          ),
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            SalomonBottomBarItem(
               selectedColor: Colors.indigo,
                icon: Icon(
                  Icons.location_city,
                  size: 25,
                ),
                title: Text("Citys")),
            SalomonBottomBarItem(
              selectedColor: Colors.indigo,
                icon: Icon(
                  Icons.location_on,
                  size: 25,
                ),
                title: Text("LocationWheather")),
            SalomonBottomBarItem(
                selectedColor: Colors.indigo,
                icon: Icon(
                  Icons.settings,
                  size: 25,
                ),
                title: Text("Settings"))
                ,


          ]),
    );
  }
}
