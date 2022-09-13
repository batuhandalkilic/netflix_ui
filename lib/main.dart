import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_ui/widgets/buttomNavigationBar.dart';
import 'package:netflix_ui/widgets/episodes_trailers.dart';
import 'Screens/Hızlı_Egelencelikler.dart';
import 'Screens/Indirilenler.dart';
import 'Screens/NetflixAnaSayfa.dart';
import 'Screens/Yeni_ve_Popüler.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> listPages = [
    NetflixHomePage(),
    YeniVePopLer(),
    HZlEgelencelikler(),
    Indirilenler()
  ];
  int _curretIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 914),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: "Gotham",
        ),
        title: 'Netflix UI',
        home: SafeArea(
          child: Scaffold(
            extendBody: true,
            body: listPages[_curretIndex],
            bottomNavigationBar: ButtomNavigationBar(onCurrentIndex: (index) {
              setState(() {
                _curretIndex = index;
              });
            }),
          ),
        ),
      ),
    );
  }
}
