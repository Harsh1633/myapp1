import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {


  late String firstname;
  //Welcome({[String name], [String email],[String phone]});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text(firstname),
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.purple
          ),
        ),
      ),
    );
  }
}
