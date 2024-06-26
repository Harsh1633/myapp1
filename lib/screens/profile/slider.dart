import 'package:flutter/material.dart';

double _currentSliderValue = 18;

class Slide extends StatefulWidget {
  const Slide({super.key});

  @override
  State<Slide> createState() => _SlideState();
}

class _SlideState extends State<Slide> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Row(
        children: [
          Text(
            "Age",
            style: TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(128, 128, 135, 1),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Slider(
              value: _currentSliderValue,
              min: 18,
              max: 100,
              divisions: 82,
              // This is the number of discrete divisions in the slider
              label: _currentSliderValue.toInt().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}