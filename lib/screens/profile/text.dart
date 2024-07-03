import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';






class CustomContainer extends StatelessWidget {
  final String label,label_cond,label_display;
  final myicon;
  final TextEditingController nameController;

  CustomContainer(
      {Key? key, required this.nameController, required this.label, required this.myicon,
        required this.label_cond, required this.label_display}
      ):super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: TextFormField(
          controller: nameController,
          validator: (value){
            if(value!.isEmpty){
              return "Field Cannot be Empty";
            }
            else if(!RegExp(label_cond).hasMatch(value)
            ){
              return label_display;
            }else{
              return null;
            }
          },
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