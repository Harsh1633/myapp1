import 'package:flutter/material.dart';

class Date extends StatefulWidget {
  final Function(DateTime?) callback;
  final String datehint;

  const Date({Key? key, required this.callback, required this.datehint}) : super(key: key);

  @override
  _DateState createState() => _DateState();
}

class _DateState extends State<Date> {
  TextEditingController dateController = TextEditingController();
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: TextField(
        controller: dateController,
        readOnly: true, // Make the TextField non-editable
        onTap: () async {
          DateTime? datePicked = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );
          if (datePicked != null) {
            setState(() {
              selectedDate = datePicked;
              dateController.text =
              '${datePicked.day}-${datePicked.month}-${datePicked.year}';
              widget.callback(selectedDate); // Pass selectedDate to callback
            });
          }
        },
        decoration: InputDecoration(
          labelText: widget.datehint,
          prefixIcon: IconButton(
            onPressed: () {},
            icon: Icon(Icons.calendar_today),
          ),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}