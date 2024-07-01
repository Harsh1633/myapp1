
import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  @override
  _DatePickerExampleState createState() => _DatePickerExampleState();
}

class _DatePickerExampleState extends State<DatePicker> {
  late TextEditingController _dateController;
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController();
    _dateController.text = _selectedDate
        .toString()
        .substring(0, 10); // Initialize text field with selected date
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = _selectedDate
            .toString()
            .substring(0, 10); // Update text field value
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child:
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _dateController,
                readOnly: true,
                decoration:
                InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Birth Date',
                  prefixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () {
                      _selectDate(context); // Call function to show date picker
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
