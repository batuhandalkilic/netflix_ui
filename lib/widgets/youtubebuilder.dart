import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Youtubee extends StatefulWidget {
  const Youtubee({super.key});

  @override
  State<Youtubee> createState() => _YoutubeeState();
}

class _YoutubeeState extends State<Youtubee> {
  late YoutubePlayerController controller;

  Scaffold _screenListener(Widget player) {
    return Scaffold(
      body: Container(
        child: player,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    const url = "https://www.youtube.com/watch?v=RNWAKZzgbp4";
    controller = YoutubePlayerController(
      flags: const YoutubePlayerFlags(
        controlsVisibleAtStart: true,
        disableDragSeek: true,
        mute: false,
        loop: false,
        autoPlay: false,
      ),
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
    );
  }

  @override
  Widget build(BuildContext context) => YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: controller,
      ),
      builder: ((context, player) =>
          ScreenUtil().orientation == Orientation.portrait
              ? SizedBox(
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: player,
                      ),
                    ],
                  ),
                )
              : Center(
                  child: Container(
                    child: player,
                  ),
                )));
}
