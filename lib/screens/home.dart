import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp1/screens/information/info.dart';
import 'package:myapp1/screens/profile/button.dart';
import 'package:myapp1/screens/profile/date.dart';
import 'package:myapp1/screens/profile/final_dropdown.dart';
import 'package:myapp1/screens/profile/image.dart';
import 'package:myapp1/screens/profile/intlphonenum.dart';
import 'package:myapp1/screens/profile/text.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final formKey= GlobalKey<FormState>();

  String? _selectedGender;
  TextEditingController phoneController= TextEditingController();
  TextEditingController nameController= TextEditingController();
  TextEditingController emailController= TextEditingController();
  TextEditingController dateController = TextEditingController();

  Future<void> _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', nameController.text);
    await prefs.setString("num", phoneController.text);
    await prefs.setString("gender", _selectedGender ?? "",);
    await prefs.setString("email", emailController.text);
    await prefs.setString("date", dateController.text);
  }

  String _name = '';
  String _num1 = '';
  String _gender = '';
  String _date='';
  String _email='';

  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {

      _name = prefs.getString('name') ?? 'Not provided';
      _num1 = prefs.getString('num') ?? 'Not provided';
      _gender = prefs.getString('gender') ?? 'Not provided';
      _email = prefs.getString('email') ?? 'Not provided';
      _date = prefs.getString('date') ?? 'Not provided';

      nameController.text = _name;
      phoneController.text = _num1;
      _selectedGender = _gender;
      emailController.text= _email;
      dateController.text= _date;
    });
  }



  DateTime? selectedDate;
  void setDate(DateTime? date){
    setState(() {
      selectedDate= date;
    });
  }


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
          Form(
            key: formKey ,
            child: Column(
              children: [
                ImageChoice(),
                SizedBox(height: 10),
                CustomContainer(nameController: nameController,
                    label: "Name", myicon: Icons.person,
                    label_cond: r'^[a-zA-Z ]+$', label_display: 'Name cant contain AlphaNumeric Values',),
                SizedBox(height: 22.5),
                IntlPhoneNum(phoneController: phoneController, phonehint: "Phone Number",),
                SizedBox(height: 15),
                DropDown(
                    selectedGender: _selectedGender,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedGender = newValue;
                      });
                    }, dropdownhint: 'Enter your Gender',),
                SizedBox(height: 22.5),
                CustomContainer(nameController: emailController, label: "Email",
                  myicon: Icons.message,
                  label_cond: r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  label_display: 'Invalid Email',),
                SizedBox(height: 20),
                Date(callback: setDate, datehint: "Date of Joining",),
                SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () async{
                      if (formKey.currentState!.validate()){
                      //abc();
                      Navigator.of(context).push
                        (MaterialPageRoute(
                          builder: (context)=> Page1(
                            selected_name: nameController.text,
                            selected_phonenum: phoneController.text, selected_gender: _selectedGender ?? "",
                            selected_email: emailController.text,
                            selected_date: selectedDate != null ? DateFormat('yyyy-MM-dd').format(selectedDate!) : "",
                          )));

                      await _saveData();
                    }},
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




