import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtomNavigationBar extends StatefulWidget {
  final Function onCurrentIndex;
  const ButtomNavigationBar({Key? key, required this.onCurrentIndex})
      : super(key: key);

  @override
  _ButtomNavigationBarState createState() => _ButtomNavigationBarState();
}

class _ButtomNavigationBarState extends State<ButtomNavigationBar> {
  int _currenIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        gradientColor(),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: BottomNavigationBar(
              elevation: 0, // to get rid of the shadow
              selectedItemColor: const Color.fromARGB(255, 251, 251, 251),
              backgroundColor: const Color.fromARGB(0, 253, 4,
                  4), // transparent, you could use 0x44aaaaff to make it slightly less transparent with a blue hue.
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: const Color.fromARGB(255, 128, 127, 127),
              enableFeedback: true,
              selectedFontSize: 0,
              currentIndex: _currenIndex,
              onTap: (value) {
                setState(() {
                  _currenIndex = value;
                  widget.onCurrentIndex(value);
                });
              },
              items: const [
                BottomNavigationBarItem(label: "", icon: Icon(Icons.home)),
                BottomNavigationBarItem(label: "", icon: Icon(Icons.search)),
                BottomNavigationBarItem(label: "", icon: Icon(Icons.download)),
                BottomNavigationBarItem(
                    label: "", icon: Icon(Icons.list_sharp)),
              ]),
        ),
      ],
    );
  }

  Container gradientColor() {
    return Container(
      width: 1.sw,
      height: 0.11.sh,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color.fromARGB(0, 0, 0, 0),
            Color.fromARGB(42, 0, 0, 0),
            Color.fromARGB(84, 0, 0, 0),
            Color.fromARGB(132, 0, 0, 0),
            Color.fromARGB(168, 0, 0, 0),
            Color.fromARGB(210, 0, 0, 0),
            Color.fromARGB(255, 0, 0, 0),
          ], // Gradient from https://learnui.design/tools/gradient-generator.html
          tileMode: TileMode.mirror,
        ),
      ),
    );
  }
}
