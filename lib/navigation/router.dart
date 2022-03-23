import 'package:auto_route/auto_route.dart';
import 'package:assignment/ui/view/view.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(path: '/', page: ViewNavigation, children: [
      AutoRoute(
          path: "cities",
          name: 'CityListRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: Cities,
            ),
            AutoRoute(
              path: ':cityQuery',
              page: CityWeather,
            ),
          ]),
      AutoRoute(
        path: 'location',
        name: 'WheatherRouter',
        page: CityWeather,
      ),
      AutoRoute(
        path: 'settings',
        name: 'SettingsRouter',
        page: Settings,
      ),
    ]),
  ],
)
class $AppRouter {}
