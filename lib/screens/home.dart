import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp1/screens/information/info.dart';
import 'package:myapp1/screens/profile/button.dart';
import 'package:myapp1/screens/profile/date.dart';
import 'package:myapp1/screens/profile/final_dropdown.dart';
import 'package:myapp1/screens/profile/image.dart';
import 'package:myapp1/screens/profile/intlphonenum.dart';
import 'package:myapp1/screens/profile/text.dart';




class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String? _selectedGender;

  TextEditingController phoneController= TextEditingController();
  TextEditingController nameController= TextEditingController();
  TextEditingController emailController= TextEditingController();
  TextEditingController dateController = TextEditingController();


  DateTime? selectedDate;
  void setDate(DateTime? date){
    setState(() {
      selectedDate= date;
    });
  }



  @override
  Widget build(BuildContext context) {
    String? handleSelectedDate;
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
              CustomContainer(nameController: nameController, label: "Name", myicon: Icons.person,),
              SizedBox(height: 22.5),
              IntlPhoneNum(phoneController: phoneController),
              SizedBox(height: 22.5),
              DropDown(
                  selectedGender: _selectedGender,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedGender = newValue;
                    });
                  }),
              SizedBox(height: 22.5),
              CustomContainer( nameController: emailController, label: 'Enter Email', myicon: Icons.message,),
              SizedBox(height: 22.5),
              Date(callback: setDate),
              SaveButton(name: nameController.text,
                phone: phoneController.text,
              gender: _selectedGender ?? "",
                  date:  selectedDate != null ? DateFormat('yyyy-MM-dd').format(selectedDate!) : "",
                email: emailController.text,
              ),
              // SaveButton(
              //   nameController.text,
              //   phoneController.text,
              //   _selectedGender ?? "",
              //   selectedDate != null ? DateFormat('yyyy-MM-dd').format(selectedDate!) : "",
              //   emailController.text, buttonText: 'SAVE',
              // )
            ],
          ),
        ],
      ),
    );
  }
}


