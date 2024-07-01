import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:myapp1/screens/information/info.dart';
import 'package:myapp1/screens/profile/button.dart';
import 'package:myapp1/screens/profile/datepicker.dart';
import 'package:myapp1/screens/profile/dropdown.dart';
import 'package:myapp1/screens/profile/image.dart';
import 'package:myapp1/screens/profile/intlphonenum.dart';
import 'package:myapp1/screens/profile/slider.dart';
import 'package:myapp1/screens/profile/text.dart';




class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _currentSliderValue = 18;
  String? _selectedItem; // Make _selectedItem nullable

  TextEditingController _phoneNumber= TextEditingController();
  TextEditingController _name= TextEditingController();
  TextEditingController _email= TextEditingController();

  // List of genders for the dropdown
  List<String> _genderItems = [
    'Male',
    'Female',
    'Other',
  ];


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
              Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextField(
                    controller: _name,
                    decoration: InputDecoration(
                      labelText: "Enter your Name",
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                      //hintText: 'Enter Your Email',
                    ),
                  )),
              //CustomContainer('Enter your Name', Icons.person),
              SizedBox(height: 22.5),
              Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child:
              IntlPhoneField(
                controller: _phoneNumber,
                decoration: const InputDecoration(
                  hintText: 'Enter Phone Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black,
                    width: 5)
                  )
                ),
              ),),
              SizedBox(height: 22.5),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.black.withOpacity(0.5), width: 1.0),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _selectedItem,
                      hint: Text('Select your Gender'),
                      icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.black, fontSize: 18.0),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedItem = newValue; // Update selected item
                        });
                      },
                      items: _genderItems.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 22.5),
              Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextField(
                    controller: _name,
                    decoration: InputDecoration(
                      labelText: "Enter your Name",
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                      //hintText: 'Enter Your Email',
                    ),
                  )),
              SizedBox(height: 22.5),
              Container(
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
              ),

              ElevatedButton(
                onPressed: () {
                  print(_currentSliderValue);
                  print(_selectedItem);
                  print(_phoneNumber.text);
                  print(_name.text);
                  print(_email.text);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Page1(sel_item: _selectedItem as String,
                      slider_val: _currentSliderValue, sel_name: _name.text, sel_email: _email.text, sel_phone:_phoneNumber.text,)));
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}


