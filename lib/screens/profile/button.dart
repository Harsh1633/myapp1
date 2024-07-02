import 'package:flutter/material.dart';
import 'package:myapp1/screens/information/info.dart';

class SaveButton extends StatefulWidget {
  final String name,phone,gender,email,date;
  // final String buttonText;
  const SaveButton({super.key, required this.name, required this.phone, required this.gender,required this.email,required this.date});


  // const SaveButton(this.name,  this.phone, this.gender, this.email,this.date,{super.key, required this.buttonText} );


  @override
  State<SaveButton> createState() => _SaveButtonState();
}

class _SaveButtonState extends State<SaveButton> {

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push
          (MaterialPageRoute(
            builder: (context)=> Page1(
                selected_name: widget.name,
              selected_phonenum: widget.phone,
              selected_gender: widget.gender,
              selected_email: widget.email,
              selected_date: widget.date,
            )));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        elevation: 15.0,
        textStyle: const TextStyle(
          color: Colors.purple,
          fontSize: 25,
        ),
      ),
      child: Text("SAVE"),
    );
  }
}
