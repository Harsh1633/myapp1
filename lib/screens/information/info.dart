import 'package:flutter/material.dart';
import 'package:myapp1/screens/home.dart';
import 'package:myapp1/screens/profile/button.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Page1 extends StatefulWidget {


  final String selected_name, selected_phonenum,selected_gender,selected_email,selected_date;
  Page1({required this.selected_name, required this.selected_phonenum, required this.selected_gender,
    required this.selected_email, required this.selected_date});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {


  String _name = '';
  String _num1 = '';
  String _gender = '';
  String _email = '';
  String _date='';

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

    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:Scaffold(
        appBar: AppBar(
          title: Text("View Details"),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontStyle: FontStyle.italic,
          ),
          backgroundColor: Color.fromRGBO(255, 235, 216, 1.0),
          centerTitle: true,
        ),
      body:Container(
        child: Center(
          child: Column(
            //mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
                      child: Text("Name: ",style: TextStyle(fontSize: 15,color: Colors.red)),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
                      child: Text(widget.selected_name,style: TextStyle(fontSize: 30,color: Colors.black)),
                    ),
                  ],
                )
              ),
              Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
                        child: Text("Number: ",style: TextStyle(fontSize: 15,color: Colors.red)),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
                        child: Text(widget.selected_phonenum,style: TextStyle(fontSize: 30,color: Colors.black)),
                      ),
                    ],
                  )
              ),
              Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
                        child: Text("Email: ",style: TextStyle(fontSize: 15,color: Colors.red)),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
                        child: Text(widget.selected_email,style: TextStyle(fontSize: 30,color: Colors.black)),
                      ),
                    ],
                  )
              ),
              Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
                        child: Text("Gender: ",style: TextStyle(fontSize: 15,color: Colors.red)),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
                        child: Text(widget.selected_gender,style: TextStyle(fontSize: 30,color: Colors.black)),
                      ),
                    ],
                  )
              ),
              Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
                        child: Text("Date: ",style: TextStyle(fontSize: 15,color: Colors.red)),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
                        child: Text(widget.selected_date,style: TextStyle(fontSize: 30,color: Colors.black),),
                      ),
                    ],
                  )
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    // isedit= true;
                    print(widget.selected_name);
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Home(t_label: selected_name,)));
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Home()));


                  },
                  //SaveButton(button_text: 'EDIT'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    elevation: 15.0,
                    textStyle: const TextStyle(
                      color: Colors.purple,
                      fontSize: 25,
                    ),
                  ),
                  child: Text("EDIT"),
                ),
              )
              //const SaveButton(buttonText: "buttonText")
            ],
          ),
        ),
      )));
  }

}

