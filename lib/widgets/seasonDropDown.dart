// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SeasonDropDown extends StatefulWidget {
  final Function onCallValue;
  const SeasonDropDown({
    Key? key,
    required this.onCallValue,
  }) : super(key: key);

  @override
  _SeasonDropDownState createState() => _SeasonDropDownState();
}

class _SeasonDropDownState extends State<SeasonDropDown> {
  String changedValue = "0";
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DropdownButton<String>(
            underline: Container(),
            iconSize: 32,
            icon: Icon(Icons.keyboard_arrow_down_sharp),
            value: changedValue,
            hint: Text("Şehir Seçiniz"),
            items: [
              DropdownMenuItem<String>(value: "0", child: Text("Sezon 1")),
              DropdownMenuItem<String>(value: "1", child: Text("Sezon 2")),
              DropdownMenuItem<String>(value: "2", child: Text("Sezon 3"))
            ],
            onChanged: ((value) {
              setState(() {
                changedValue = value!;
                widget.onCallValue(value);
              });
            })),
      ],
    );
  }
}
