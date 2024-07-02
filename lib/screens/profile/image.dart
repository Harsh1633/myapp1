import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as io;

class ImageChoice extends StatefulWidget {
  const ImageChoice({super.key});

  @override
  State<ImageChoice> createState() => _ImageChoiceState();
}

class _ImageChoiceState extends State<ImageChoice> {

  final ImageProvider defaultImage = AssetImage('assets/img1.jpg');
  ImageProvider?
  imageFile; // Assuming this is where you store the selected image

  // Function to handle opening gallery and picking an image
  Future<void> _openGallery() async {
    // Using ImagePicker to open gallery
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    // Update imageFile with the picked image
    if (pickedFile != null) {
      setState(() {
        imageFile = FileImage(io.File(pickedFile.path));
        // print(FileImage);;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    ImageProvider imageToShow = imageFile ?? defaultImage;
    return Padding(
        padding: EdgeInsets.fromLTRB(60, 20, 0, 10),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 80, // Image radius
                backgroundImage: imageToShow,
              ),
              IconButton(
                  icon: Icon(Icons.add_a_photo_outlined),
                  iconSize: 30,
                  color: Colors.black,
                  onPressed: _openGallery),
            ],
          ),
        ),
    );
  }
}

