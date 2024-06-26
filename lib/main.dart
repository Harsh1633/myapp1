import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:myapp1/screens/profile/datepicker.dart';
import 'package:myapp1/screens/profile/dropdown.dart';
import 'package:myapp1/screens/profile/image.dart';
import 'package:myapp1/screens/profile/slider.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:myapp1/screens/profile/text.dart';

void main() {
  runApp(
    MaterialApp(home: Home()),
  );
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _textController = TextEditingController();

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
              SizedBox(
                height: 22.5,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber number) {
                    print(number.phoneNumber);
                  },
                  onInputValidated: (bool value) {
                    print(value);
                  },
                  selectorConfig: SelectorConfig(
                    selectorType: PhoneInputSelectorType.DIALOG,
                  ),
                  ignoreBlank: false,
                  autoValidateMode: AutovalidateMode.disabled,
                  selectorTextStyle: TextStyle(color: Colors.black),
                  inputBorder: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 22.5),
              CustomContainer(label: 'Enter your Email', myicon: Icons.email,),
              SizedBox(height: 22.5),
              Slide(),
              SizedBox(
                width: 150.0,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {},//String uEmail= emailText.text.toString()},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    elevation: 15.0,
                    textStyle: const TextStyle(
                      color: Colors.purple,
                      fontSize: 25,
                    ),
                  ),
                  child: const Text('Save'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}