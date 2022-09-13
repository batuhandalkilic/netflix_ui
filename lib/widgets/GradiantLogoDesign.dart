import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'netflixLogo.dart';

class GradiantLogoDesign extends StatelessWidget {
  const GradiantLogoDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 1.sw,
          height: 0.15.sh,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Color.fromARGB(255, 0, 0, 0),
                Color.fromARGB(210, 0, 0, 0),
                Color.fromARGB(168, 0, 0, 0),
                Color.fromARGB(132, 0, 0, 0),
                Color.fromARGB(84, 0, 0, 0),
                Color.fromARGB(42, 0, 0, 0),
                Color.fromARGB(0, 0, 0, 0),
              ], // Gradient from https://learnui.design/tools/gradient-generator.html
              tileMode: TileMode.mirror,
            ),
          ),
        ),
        Positioned(
            top: 0.1.sw, right: 0.3.sw, left: 0.3.sw, child: netflixLogo()),
      ],
    );
  }
}
