import 'package:assignment/core/theme/typhography.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class Symbol extends StatelessWidget {
  String? weatherDesciription;
  Symbol({Key? key, this.weatherDesciription}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getSymbolWidget(weatherDesciription.toString());
  }

  Widget getSymbolWidget(String desc) {
    if (desc.contains("Sunny")) {
      return FlareActor();
    } else if (desc.contains("Snowy")) {
      return FlareActor();
    } else if (desc.contains("Stormy")) {
      return FlareActor();
    } else {
      return FlareActor();
    }
  }
}
