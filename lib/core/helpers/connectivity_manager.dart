import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityManager {
  final _connectivity = Connectivity();
  final connectivityStream=StreamController<ConnectivityResult>();


  ConnectivityManager() {
    _connectivity.onConnectivityChanged.listen((event) {
      connectivityStream.add(event);
    });
  }
}
