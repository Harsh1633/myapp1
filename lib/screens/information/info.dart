import 'package:flutter/material.dart';
import 'package:myapp1/screens/home.dart';
import 'package:myapp1/screens/profile/button.dart';


class Page1 extends StatelessWidget {

  final String selected_name,selected_phonenum,selected_gender,selected_email,selected_date;
  Page1({required this.selected_name,
    required this.selected_phonenum,
    required this.selected_gender,
    required this.selected_email,
    required this.selected_date});

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
                      child: Text(selected_name,style: TextStyle(fontSize: 30,color: Colors.black)),
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
                        child: Text(selected_email,style: TextStyle(fontSize: 30,color: Colors.black)),
                      ),
                    ],
                  )
              ),
              Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
                        child: Text("Phone Number: ",style: TextStyle(fontSize: 15,color: Colors.red)),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
                        child: Text(selected_phonenum,style: TextStyle(fontSize: 30,color: Colors.black)),
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
                        child: Text(selected_gender,style: TextStyle(fontSize: 30,color: Colors.black)),
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
                        child: Text(selected_date,style: TextStyle(fontSize: 30,color: Colors.black),),
                      ),
                    ],
                  )
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push
                      (MaterialPageRoute(
                        builder: (context)=> Home()));
                  },
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

