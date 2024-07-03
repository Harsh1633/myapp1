import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class IntlPhoneNum extends StatefulWidget {
  final TextEditingController phoneController;
  final String phonehint;
  //const IntlPhoneNum({super.key, required this.phoneController});

  IntlPhoneNum(
      {Key? key, required this.phoneController, required this.phonehint}
      ):super(key: key);

  @override
  State<IntlPhoneNum> createState() => _IntlPhoneNumState();
}

class _IntlPhoneNumState extends State<IntlPhoneNum> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: IntlPhoneField(
        controller: widget.phoneController,
        decoration: InputDecoration(
            hintText: "phone number",
            labelText: widget.phonehint,
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black,
                    width: 5)
            )
        ),
      ),);
  }
}
