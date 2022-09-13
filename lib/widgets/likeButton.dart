// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  LikeButton({
    Key? key,
  }) : super(key: key);

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isFovorite = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isFovorite = !isFovorite;
        });
      },
      child: Tab(
        icon: Icon(
          Icons.favorite,
          color: isFovorite == true
              ? Color.fromARGB(223, 210, 114, 45)
              : Color.fromARGB(223, 255, 255, 255),
        ),
        child: Text("Beğen"),
      ),
    );
  }
}
