import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Container netflixLogo() {
  return Container(
    constraints: BoxConstraints(
      minWidth: ScreenUtil().orientation == Orientation.portrait ? 60.w : 100.w,
      minHeight: ScreenUtil().orientation == Orientation.portrait ? 35.h : 50.w,
    ),
    decoration: const BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: AssetImage("assets/logo/netflix_logo_big.png"))),
  );
}
