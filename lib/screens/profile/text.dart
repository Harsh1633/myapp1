import 'package:flutter/material.dart';
var emailText= TextEditingController();

class CustomContainer extends StatelessWidget {
  final String label;
  final myicon;

  CustomContainer({required this.label, required this.myicon});

 // var emailText= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: TextField(
          controller: emailText,
          decoration: InputDecoration(
            labelText: label,
            prefixIcon: Icon(myicon),
            border: OutlineInputBorder(),
            //hintText: 'Enter Your Email',
          ),
        ));
  }
}
