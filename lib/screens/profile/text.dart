import 'package:flutter/material.dart';



var Inputdata= TextEditingController();


class CustomContainer extends StatelessWidget {
  final String label;
  final myicon;



  CustomContainer(this.label, this.myicon);


  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: TextField(
          controller: Inputdata,
          decoration: InputDecoration(
            labelText: label,
            prefixIcon: Icon(myicon),
            border: OutlineInputBorder(),
            //hintText: 'Enter Your Email',
          ),
        ));
  }
}

// void abc(){
//   print(Inputdata);
// }