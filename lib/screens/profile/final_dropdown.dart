import 'package:flutter/material.dart';

class DropDown extends StatelessWidget {
  final String? selectedGender;
  final ValueChanged<String?> onChanged;
  final String dropdownhint;

  // const DropDown({super.key});
  const DropDown({
    Key? key,
    required this.selectedGender,
    required this.onChanged, required this.dropdownhint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border:
                Border.all(color: Colors.black.withOpacity(0.5), width: 1.0),
            color: Colors.white,
          ),
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedGender,
              icon: Icon(Icons.arrow_drop_down, color: Colors.black),
              iconSize: 24,
              elevation: 16,
              hint: Text(dropdownhint),
              style: TextStyle(color: Colors.black, fontSize: 18.0),
              padding: const EdgeInsets.all(10.0),
              underline: Container(
                height: 1,
                color: Colors.black,
              ),
              onChanged: onChanged,
              items: <String>['Male', 'Female','Other']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ));
  }
}
