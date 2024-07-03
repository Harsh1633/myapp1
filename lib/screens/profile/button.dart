import 'package:flutter/material.dart';
import 'package:myapp1/screens/home.dart';
import 'package:myapp1/screens/information/info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveButton extends StatefulWidget {
  //final String name,phone,gender,email,date;
  final String name,phone,gender,email,date;


  SaveButton({super.key,
    required this.name,required this.phone, required this.gender, required this.email, required this.date});


  @override
  State<SaveButton> createState() => _SaveButtonState();
}

class _SaveButtonState extends State<SaveButton> {

  @override
  // void initState(){
  //   super.initState();
  //   getvals();
  // }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        print(widget.name);
        print(widget.phone);
        print(widget.gender);
        print(widget.email);
        print(widget.date);

        Navigator.of(context).push
          (MaterialPageRoute(
            builder: (context)=> Page1(
              selected_name: widget.name,
              selected_phonenum: widget.phone, selected_gender: widget.gender,
              selected_email: widget.email, selected_date: widget.date,
            )));

        var prefs= await SharedPreferences.getInstance();
        prefs.setString("name", widget.name);
        prefs.setString("num", widget.phone);
        prefs.setString("gender", widget.gender,);
        prefs.setString("email", widget.email);
        prefs.setString("date",widget.date);

        //var prefs= await SharedPreferences.getInstance();


      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        elevation: 15.0,
        textStyle: const TextStyle(
          color: Colors.purple,
          fontSize: 25,
        ),
      ),
      // child: Text(widget.button_text),
      child: Text("SAVE")
    );
  }
}


