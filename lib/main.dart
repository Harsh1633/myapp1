import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as io;
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

var img =
    'https://cdn.britannica.com/31/255531-050-B7E07090/eiffel-tower-paris-france-champ-de-mars-view.jpg';

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
  final ImageProvider defaultImage = AssetImage('assets/img1.jpg');
  ImageProvider?
      imageFile; // Assuming this is where you store the selected image

  // Function to handle opening gallery and picking an image
  Future<void> _openGallery() async {
    // Using ImagePicker to open gallery
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    // Update imageFile with the picked image
    if (pickedFile != null) {
      setState(() {
        imageFile = FileImage(io.File(pickedFile.path));
      });
    }
  }

  double _currentSliderValue = 18;
  final _textController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    ImageProvider imageToShow = imageFile ?? defaultImage;
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
              Padding(
                  padding: EdgeInsets.fromLTRB(60, 20, 0, 10),
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 80, // Image radius
                          backgroundImage: imageToShow,
                        ),
                        IconButton(
                            icon: Icon(Icons.add_a_photo_outlined),
                            iconSize: 30,
                            color: Colors.black,
                            onPressed: _openGallery),
                      ],
                    ),
                  )),
              //Text(
              // "Name Comes here",
              //style: TextStyle(
              //  fontSize: 25,
              // fontWeight: FontWeight.bold,
              // ),
              //),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                    controller: _textController,
                    inputFormatters: [LengthLimitingTextInputFormatter(10)],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Your Name',
                    )),
              ),
              SizedBox(height: 22.5),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                    inputFormatters: [LengthLimitingTextInputFormatter(10)],
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Your Domain')),
              ),
              SizedBox(height: 22.5),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: MyDropdownWidget(),
              ),
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
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  children: [
                    Icon(Icons.email, color: Colors.grey),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          //border: InputBorder.none
                          hintText: 'Enter your email',
                          hintStyle:
                              TextStyle(fontSize: 18), // Adjust hint font size
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 22.5,
              ),
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
                        // This is the number of discrete divisions in the slider
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
            ],
          ),
        ],
      ),
      floatingActionButton: IconButton(
          icon: Icon(Icons.add_circle),
          iconSize: 30,
          color: Colors.black,
          onPressed: (){print(_textController);}),
    );
  }
}

class MyDropdownWidget extends StatefulWidget {
  @override
  _MyDropdownWidgetState createState() => _MyDropdownWidgetState();
}

class _MyDropdownWidgetState extends State<MyDropdownWidget> {
  String? _selectedItem; // Make _selectedItem nullable

  // List of countries for the dropdown
  List<String> _dropdownItems = [
    'Male',
    'Female',
    'Other',
  ];

  //
  @override
  void initState() {
    super.initState();
    _selectedItem = null; // Initialize with null to show hint
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // Occupy the entire width of the screen
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        // Optional: Add rounded corners
        border: Border.all(color: Colors.black.withOpacity(0.5), width: 1.0),
        // Thin black border with opacity
        color: Colors.white, // Set background color with opacity
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      // Optional: Adjust padding
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedItem,
          hint: Text('Select your Gender'),
          // Hint text when no country is selected
          icon: Icon(Icons.arrow_drop_down, color: Colors.black),
          // Dropdown icon on the right
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.black, fontSize: 18.0),
          // Optional: Adjust text style
          onChanged: (String? newValue) {
            setState(() {
              _selectedItem = newValue; // Update selected item
            });
          },
          items: _dropdownItems.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
