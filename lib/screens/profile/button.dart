import 'package:flutter/material.dart';
import 'package:myapp1/screens/information/info.dart';
import 'package:myapp1/screens/profile/text.dart';

class SaveButton extends StatefulWidget {
  final String btext;
  final back_color;

  SaveButton({ required this.btext, required this.back_color});

  @override
  State<SaveButton> createState() => _SaveButtonState();
}

class _SaveButtonState extends State<SaveButton> {
  @override
  Widget build(BuildContext context) {
    final String nametext;
    return ElevatedButton(
        onPressed: () {
          //Navigator.of(context).push(MaterialPageRoute(builder: (context) => Welcome("Harsh", "ABC", "123")));
        },//String uEmail= emailText.text.toString()},
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.back_color,//
          elevation: 15.0,
          textStyle: const TextStyle(
            color: Colors.purple, //
            fontSize: 25,
          ),
        ),
        child: Text(widget.btext),//
    );
  }
}
