import 'package:flutter/material.dart';

class Views extends StatefulWidget {
  const Views({super.key});

  @override
  State<Views> createState() => _ViewState();
}

class _ViewState extends State<Views> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("MVC"),
        backgroundColor: Color.fromRGBO(255, 235, 216, 1.0),
        centerTitle: true,
      ),
      body: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          child:Row(
          //mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              onPressed: () {},
              child: Icon(
                Icons.remove_circle_outlined,
              ),
            ),
            Text(
              "0",
              style: TextStyle(
                fontSize: 28,
              ),
            ),
            FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add_circle_outlined),
            )
          ],
        ),)
      ],),),
    ));
  }
}
