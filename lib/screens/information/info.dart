import 'package:flutter/material.dart';


class Page1 extends StatelessWidget {
  final String sel_item, sel_email,sel_name,sel_phone;
  final double slider_val;
  const Page1({required this.sel_name,required this.sel_phone,required this.sel_item,required this.sel_email, required this.slider_val, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:Scaffold(
      body:Center(
      child: Container(
        // width: 200,
        // height: 200,
        decoration: BoxDecoration(
            color: Colors.blue
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Name :"),
                //SizedBox(width: 100),
                Text(sel_name,style: TextStyle(
                    fontSize: 20,
                    color: Colors.black
                ),)

              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Email:"),
                //SizedBox(width: 100),
                Text(sel_email,style: TextStyle(
                    fontSize: 20,
                    color: Colors.black
                ),)

              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Age :"),
                //SizedBox(width: 100),
                Text("$slider_val",style: TextStyle(
                    fontSize: 20,
                    color: Colors.black
                ),)

              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Gender :"),
                //SizedBox(width: 100),
                Text(sel_item,style: TextStyle(
                    fontSize: 20,
                    color: Colors.black
                ),)

              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Number :"),
                //SizedBox(width: 100),
                Text(sel_phone,style: TextStyle(
                    fontSize: 20,
                    color: Colors.black
                ),)

              ],
            ),
          ]
          ,
        ),
      ),
    )));
  }
}

