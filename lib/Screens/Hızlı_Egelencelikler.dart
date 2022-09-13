import 'package:flutter/material.dart';

class HZlEgelencelikler extends StatelessWidget {
  const HZlEgelencelikler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
          aspectRatio: 4 / 3, child: Image.asset("assets/work.jpg")),
    );
  }
}
