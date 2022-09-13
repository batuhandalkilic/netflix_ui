// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:netflix_ui/Models/movies.dart';

import '../Constrains/Texts/text.dart';
import '../widgets/episodes_trailers.dart';
import '../widgets/likeButton.dart';

class DetayPage extends StatefulWidget {
  String moviek;
  String moviePosterPath;
  DetayPage({
    Key? key,
    required this.moviek,
    required this.moviePosterPath,
  }) : super(key: key);

  @override
  State<DetayPage> createState() => _DetayPageState();
}

class _DetayPageState extends State<DetayPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.r),
          child: ListView(
            children: [
              Stack(
                children: [
                  Stack(
                    children: [
                      topImageMovie(
                        widget.moviek,
                        context,
                      ),
                      closeIcon(),
                    ],
                  ),
                ],
              ),
              rowMovieInfo(widget.moviePosterPath),
              playbuttonAndActors(),
              const EpisodesTrailers(),
            ],
          ),
        ),
      ),
    );
  }

  Positioned playbuttonAndActors() {
    return Positioned(
      right: 0,
      left: 0,
      top: 480.h,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  shape: StadiumBorder(),
                  elevation: 0,
                ),
                icon: Icon(Icons.play_arrow),
                label: Text("Play")),
            SizedBox(height: 25.r),
            NetflixText.movieInfo,
            SizedBox(height: 25.r),
            SizedBox(
              height: 70.h,
              child: ListView(
                padding: EdgeInsets.all(0),
                scrollDirection: Axis.horizontal,
                children: [
                  actors(),
                  actors(),
                  actors(),
                  moreActors(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding moreActors() {
    //dropdownbutton
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.r),
      child: const CircleAvatar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        maxRadius: 27,
        minRadius: 26,
        child: CircleAvatar(
          maxRadius: 24,
          minRadius: 22,
          child: Icon(Icons.more_horiz_rounded),
        ),
      ),
    );
  }

  Padding actors() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.r),
      child: const CircleAvatar(
        maxRadius: 28,
        minRadius: 24,
        backgroundImage: AssetImage("assets/detayImage/narcos01.jpg"),
      ),
    );
  }

  Padding rowMovieInfo(String pathIage) {
    return Padding(
      padding: EdgeInsets.all(8.r),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color.fromARGB(30, 0, 0, 0),
              Color.fromARGB(120, 0, 0, 0),
              Color.fromARGB(129, 0, 0, 0),
              Color.fromARGB(132, 0, 0, 0),
              Color.fromARGB(168, 0, 0, 0),
              Color.fromARGB(210, 0, 0, 0),
              Color.fromARGB(230, 0, 0, 0),
              Color.fromARGB(250, 0, 0, 0),
              Color.fromARGB(171, 209, 62, 62),
            ], // Gradient from https://learnui.design/tools/gradient-generator.html
            tileMode: TileMode.mirror,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: informationImageMovie(pathIage),
            ),
            Expanded(
              flex: 2,
              child: informationMovie(),
            )
          ],
        ),
      ),
    );
  }

  Positioned closeIcon() {
    return Positioned(
      top: 30.h,
      right: 20.w,
      child: Container(
        width: 40.r,
        height: 40.r,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(14),
        ),
        child: IconButton(
            onPressed: (() {
              Navigator.of(context).pop();
            }),
            icon: Icon(
              size: 18,
              color: Color.fromARGB(255, 255, 255, 255),
              Icons.arrow_back_rounded,
            )),
      ),
    );
  }

  Container topImageMovie(
    String kapakImage,
    BuildContext context,
  ) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 0.3.sh,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(12),
              bottomLeft: Radius.circular(12)),
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage(kapakImage))),
    );
  }

  Container informationImageMovie(String posterPath) {
    return Container(
      height: 220.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(image: AssetImage(posterPath))),
    );
  }

  Column informationMovie() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: EdgeInsets.all(30).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "%${Random().nextInt(100)} Eşleşme",
                    style: TextStyle(color: Color.fromARGB(255, 74, 240, 122)),
                  ),
                  NetflixText.sezonText,
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NetflixText.icerikText,
                  NetflixText.yapimYili,
                ],
              ),
            ],
          ),
        ),
        actionRow()
      ],
    );
  }

  Row actionRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {},
          child: Tab(
            text: "Liste",
            icon: Icon(Icons.add),
          ),
        ),
        LikeButton(),
        InkWell(
          onTap: () {},
          child: Tab(
            child: Text("Paylaş"),
            icon: Icon(Icons.ios_share),
          ),
        ),
      ],
    );
  }
}
