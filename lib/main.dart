import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
var img= 'https://cdn.britannica.com/31/255531-050-B7E07090/eiffel-tower-paris-france-champ-de-mars-view.jpg';
void main() {
  runApp(MaterialApp(
    home: Home()
    ),
  );
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "My First App"),
        titleTextStyle: TextStyle(
          color: Color.fromRGBO(137, 185, 173,0.4),
          fontSize: 35,
          fontStyle: FontStyle.italic,
        ),
        backgroundColor: Color.fromRGBO(255, 235, 216, 1.0),
        centerTitle: true,
        toolbarHeight: 100,
      ),

      body:Column(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            height: 150,
            width: MediaQuery.of(context).size.width,

            child: Center(
              child: CircleAvatar(
              radius: 80, // Image radius
              backgroundImage: NetworkImage(img),
            ),),
          )
          ,
          Text("Name Comes here",
            style: TextStyle(
              fontSize: 25,
              fontWeight:FontWeight.bold,
            ),
                ),
          Text("Email ID Comes Here",
            style: TextStyle(
              fontSize: 15,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height: 10),
          TextField(
              inputFormatters: [LengthLimitingTextInputFormatter(10)],
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Your Name')),
          SizedBox(height: 15),
          TextField(
              inputFormatters: [LengthLimitingTextInputFormatter(10)],
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Your Blood Group')),
          SizedBox(height: 20),
          MyDropdownWidget()

        ],
      ) 


      ,floatingActionButton: IconButton(
      icon: Icon(Icons.add_a_photo_outlined),
      iconSize: 30,
      color: Colors.brown,
      onPressed: () {},
    ),

    );
  }
}

class MyDropdownWidget extends StatefulWidget {
  @override
  _MyDropdownWidgetState createState() => _MyDropdownWidgetState();
}

class _MyDropdownWidgetState extends State<MyDropdownWidget> {
  String? _selectedItem; // Make _selectedItem nullable

  // List of countries for the dropdown
  List<String> _dropdownItems = [
    'Country 1',
    'Country 2',
    'Country 3',
    'Country 4',
    'Country 5',
  ];

  @override
  void initState() {
    super.initState();
    _selectedItem = null; // Initialize with null to show hint
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Occupy the entire width of the screen
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0), // Optional: Add rounded corners
        border: Border.all(color: Colors.black.withOpacity(0.5), width: 1.0), // Thin black border with opacity
        color: Colors.white, // Set background color with opacity
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.0), // Optional: Adjust padding
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedItem,
          hint: Text('Select a country'), // Hint text when no country is selected
          icon: Icon(Icons.arrow_drop_down, color: Colors.black), // Dropdown icon on the right
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.black, fontSize: 18.0), // Optional: Adjust text style
          onChanged: (String? newValue) {
            setState(() {
              _selectedItem = newValue; // Update selected item
            });
          },
          items: _dropdownItems.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}