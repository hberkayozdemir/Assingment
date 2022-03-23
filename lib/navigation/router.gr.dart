// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;

import '../ui/view/view.dart' as _i1;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    ViewNavigation.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.ViewNavigation());
    },
    CityListRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    WheatherRouter.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<WheatherRouterArgs>(
          orElse: () =>
              WheatherRouterArgs(cityQuery: pathParams.optString('cityQuery')));
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i1.CityWeather(
              key: args.key,
              cityQuery: args.cityQuery,
              appbartitle: args.appbartitle));
    },
    SettingsRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.Settings());
    },
    Cities.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.Cities());
    },
    CityWeather.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CityWeatherArgs>(
          orElse: () =>
              CityWeatherArgs(cityQuery: pathParams.optString('cityQuery')));
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i1.CityWeather(
              key: args.key,
              cityQuery: args.cityQuery,
              appbartitle: args.appbartitle));
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(ViewNavigation.name, path: '/', children: [
          _i2.RouteConfig(CityListRouter.name,
              path: 'cities',
              parent: ViewNavigation.name,
              children: [
                _i2.RouteConfig(Cities.name,
                    path: '', parent: CityListRouter.name),
                _i2.RouteConfig(CityWeather.name,
                    path: ':cityQuery', parent: CityListRouter.name)
              ]),
          _i2.RouteConfig(WheatherRouter.name,
              path: 'location', parent: ViewNavigation.name),
          _i2.RouteConfig(SettingsRouter.name,
              path: 'settings', parent: ViewNavigation.name)
        ])
      ];
}

/// generated route for
/// [_i1.ViewNavigation]
class ViewNavigation extends _i2.PageRouteInfo<void> {
  const ViewNavigation({List<_i2.PageRouteInfo>? children})
      : super(ViewNavigation.name, path: '/', initialChildren: children);

  static const String name = 'ViewNavigation';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class CityListRouter extends _i2.PageRouteInfo<void> {
  const CityListRouter({List<_i2.PageRouteInfo>? children})
      : super(CityListRouter.name, path: 'cities', initialChildren: children);

  static const String name = 'CityListRouter';
}

/// generated route for
/// [_i1.CityWeather]
class WheatherRouter extends _i2.PageRouteInfo<WheatherRouterArgs> {
  WheatherRouter({_i3.Key? key, String? cityQuery, String? appbartitle})
      : super(WheatherRouter.name,
            path: 'location',
            args: WheatherRouterArgs(
                key: key, cityQuery: cityQuery, appbartitle: appbartitle),
            rawPathParams: {'cityQuery': cityQuery});

  static const String name = 'WheatherRouter';
}

class WheatherRouterArgs {
  const WheatherRouterArgs({this.key, this.cityQuery, this.appbartitle});

  final _i3.Key? key;

  final String? cityQuery;

  final String? appbartitle;

  @override
  String toString() {
    return 'WheatherRouterArgs{key: $key, cityQuery: $cityQuery, appbartitle: $appbartitle}';
  }
}

/// generated route for
/// [_i1.Settings]
class SettingsRouter extends _i2.PageRouteInfo<void> {
  const SettingsRouter() : super(SettingsRouter.name, path: 'settings');

  static const String name = 'SettingsRouter';
}

/// generated route for
/// [_i1.Cities]
class Cities extends _i2.PageRouteInfo<void> {
  const Cities() : super(Cities.name, path: '');

  static const String name = 'Cities';
}

/// generated route for
/// [_i1.CityWeather]
class CityWeather extends _i2.PageRouteInfo<CityWeatherArgs> {
  CityWeather({_i3.Key? key, String? cityQuery, String? appbartitle})
      : super(CityWeather.name,
            path: ':cityQuery',
            args: CityWeatherArgs(
                key: key, cityQuery: cityQuery, appbartitle: appbartitle),
            rawPathParams: {'cityQuery': cityQuery});

  static const String name = 'CityWeather';
}

class CityWeatherArgs {
  const CityWeatherArgs({this.key, this.cityQuery, this.appbartitle});

  final _i3.Key? key;

  final String? cityQuery;

  final String? appbartitle;

  @override
  String toString() {
    return 'CityWeatherArgs{key: $key, cityQuery: $cityQuery, appbartitle: $appbartitle}';
  }
}
