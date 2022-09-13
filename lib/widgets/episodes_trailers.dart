import 'dart:math';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progressed_play_button/flutter_progressed_play_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_ui/widgets/seasonDropDown.dart';
import 'package:netflix_ui/widgets/youtubebuilder.dart';

class EpisodesTrailers extends StatefulWidget {
  const EpisodesTrailers({Key? key}) : super(key: key);

  @override
  _EpisodesTrailersState createState() => _EpisodesTrailersState();
}

class _EpisodesTrailersState extends State<EpisodesTrailers> {
  var faker = Faker();
  bool selectButtonUnderLine1 = true;
  bool selectButtonUnderLine2 = false;
  int _currentStackIndex = 0;
  String seasonChange = "0";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        selectionButtons(),
        tabScreens(),
      ],
    );
  }

  selectionButtons() {
    return SizedBox(
      height: 70.h,
      child: Row(
        children: [
          ButtonBar(
            children: [
              InkWell(
                onTap: () {
                  if (selectButtonUnderLine2 == false) {
                    selectButtonUnderLine1 = true;
                  } else {
                    setState(() {
                      _currentStackIndex = 0;
                      selectButtonUnderLine1 = !selectButtonUnderLine1;
                      selectButtonUnderLine2 = false;
                    });
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: selectButtonUnderLine1 == true
                        ? BorderSide(width: 2, color: Colors.red)
                        : BorderSide(color: Colors.transparent),
                  )),
                  child: Text("Bölümler"),
                ),
              ),
              InkWell(
                onTap: () {
                  if (selectButtonUnderLine1 == false) {
                    selectButtonUnderLine2 = true;
                  } else {
                    setState(() {
                      _currentStackIndex = 1;
                      selectButtonUnderLine2 = !selectButtonUnderLine2;
                      selectButtonUnderLine1 = false;
                    });
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: selectButtonUnderLine2 == true
                        ? BorderSide(width: 2, color: Colors.red)
                        : BorderSide(color: Colors.transparent),
                  )),
                  child: Text("Fragman ve Daha Fazlası"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  tabScreens() {
    return IndexedStack(
      sizing: StackFit.expand,
      index: _currentStackIndex,
      children: [
        SizedBox(
          height: 600.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: SeasonDropDown(onCallValue: (String sezonIndex) {
                  setState(() {
                    seasonChange = sezonIndex;
                  });
                }),
              ),
              seasonChanged(),
            ],
          ),
        ),
        SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(flex: 3, child: Youtubee()),
              Expanded(
                flex: 4,
                child: Placeholder(
                  child: Center(child: Text("İlginizi Çekebilecek yapımlar")),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Expanded seasonChanged() {
    if (seasonChange == "0") {
      return Expanded(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return seasonListTile(index);
          },
        ),
      );
    } else if (seasonChange == "1") {
      return Expanded(
        child: ListView.builder(
          itemCount: 14,
          itemBuilder: (BuildContext context, int index) {
            return seasonListTile(index);
          },
        ),
      );
    } else {
      return Expanded(
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            return seasonListTile(index);
          },
        ),
      );
    }
  }

  ListTile seasonListTile(
    int index,
  ) {
    return ListTile(
      style: ListTileStyle.drawer,
      visualDensity: VisualDensity(vertical: 3),
      leading: Stack(
        children: [
          Container(
            width: 120.w,
            height: 100.h,
            child: Placeholder(),
            /*  decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage("assets/narcos.png")),
            ), */
          ),
          Positioned(
              left: 45.h,
              top: 25.h,
              child: ProgressedPlayButton(
                iconSize: 24.w,
                backgroundColor: Color.fromARGB(255, 52, 51, 51),
                icon: Icons.play_arrow,
                iconColor: Color.fromARGB(255, 170, 167, 167),
              ))
        ],
      ),
      trailing: Icon(Icons.download),
      title: Text(
        "${index + 1}.${faker.lorem.sentence()}",
        style: TextStyle(fontSize: 12.sp),
      ),
      subtitle: Text((Random().nextInt(20) + 20).toString() + "Dk",
          style: TextStyle(fontSize: 12.sp)),
    );
  }
}
