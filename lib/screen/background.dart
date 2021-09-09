import 'package:flutter/material.dart';

import 'utils/constants.dart';

class Background extends StatelessWidget {
  const Background({this.child});

  final child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [
                    0.3,
                    1
                  ],
                  colors: [
                    PRIMARY_BLUE,
                    BACKGROUND_BLUE,
                  ])),
          child: child),
    );
  }
}
