import 'dart:math';
import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NetflixText {
  static Text appName = const Text("Netflix UaaI");

  // static final Text eslesmeText = Text(
  //   "%${Random().nextInt(100)} Eşleşme",
  //   style: TextStyle(color: Color.fromARGB(255, 74, 240, 122)),
  // );

  static final Text sezonText = Text("Sezon ${Random().nextInt(1) + 7}");

  static final Text icerikText = Text(
    randomIcerik(),
  );

  static final Text yapimYili = Text(
    "${Random().nextInt(32) + 1990}",
  );

  static final Text movieInfo = Text(faker.lorem.sentence() * 4);
}

String randomIcerik() {
  int randomIcerikSayisi = Random().nextInt(4);
  switch (randomIcerikSayisi) {
    case 0:
      return "Genel İzleyici";
    case 1:
      return "Genel İzleyici";
    case 2:
      return "+7";
    case 3:
      return "+13";
    case 4:
      return "+18";
    default:
      return "";
  }
}
