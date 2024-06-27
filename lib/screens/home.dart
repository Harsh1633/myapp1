import 'package:flutter/material.dart';
import 'package:myapp1/screens/profile/button.dart';
import 'package:myapp1/screens/profile/datepicker.dart';
import 'package:myapp1/screens/profile/dropdown.dart';
import 'package:myapp1/screens/profile/image.dart';
import 'package:myapp1/screens/profile/intlphonenum.dart';
import 'package:myapp1/screens/profile/slider.dart';
import 'package:myapp1/screens/profile/text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My First App"),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontStyle: FontStyle.italic,
        ),
        backgroundColor: Color.fromRGBO(255, 235, 216, 1.0),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              ImageChoice(),
              SizedBox(height: 10),
              CustomContainer(label: 'Enter your Name', myicon: Icons.person,),
              SizedBox(height: 22.5),
              DatePicker(),
              SizedBox(height: 22.5),
              MyDropdownWidget(),
              SizedBox(height: 22.5,),
              IntlPhoneNum(),
              SizedBox(height: 22.5),
              CustomContainer(label: 'Enter your Email', myicon: Icons.email,),
              SizedBox(height: 22.5),
              Slide(),
              SaveButton(btext: "SAVE", back_color: Colors.blueAccent),
            ],
          ),
        ],
      ),
    );
  }
}



