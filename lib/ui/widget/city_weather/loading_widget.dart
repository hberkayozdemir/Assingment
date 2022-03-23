import 'package:assignment/core/theme/colors.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';


class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: stormy,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: FlareActor(
                "assets/objects/WorldSpin.flr",
                fit: BoxFit.contain,
                animation: "roll",
              ),
              height: 300,
              width: 300,
            )
          ],
        ));
  }
}
