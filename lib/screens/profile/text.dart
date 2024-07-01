import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';






class CustomContainer extends StatelessWidget {
  final String label;
  final myicon;
  final TextEditingController nameController;

  CustomContainer(
      {Key? key, required this.nameController, required this.label, required this.myicon}
      ):super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: TextField(
          controller: nameController,
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