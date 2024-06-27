import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class IntlPhoneNum extends StatefulWidget {
  const IntlPhoneNum({super.key});

  @override
  State<IntlPhoneNum> createState() => _IntlPhoneNumState();
}

class _IntlPhoneNumState extends State<IntlPhoneNum> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
