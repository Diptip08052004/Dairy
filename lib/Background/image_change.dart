import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageChange extends StatefulWidget {
  @override
  _ImageChangeState createState() => _ImageChangeState();
}

class _ImageChangeState extends State<ImageChange> {
  Color? _backgroundColor;
  List<File?> _images = List.generate(4 , (index) => null);

  void _changeBackgroundColor(int index) async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _images[index] = File(pickedFile.path);
        _backgroundColor = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Stack(
        children: [
          _backgroundColor == null
              ? Container(
            decoration: BoxDecoration(
              image: _images.isNotEmpty && _images.any((element) => element != null)
                  ? DecorationImage(
                image: FileImage(_images.firstWhere((element) => element != null)!) as ImageProvider<Object>,
                fit: BoxFit.cover,
              )
                  : DecorationImage(
                image: AssetImage('assets/default_image.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          )
              : Container(color: _backgroundColor),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                4,
                    (index) => GestureDetector(
                  onTap: () => _changeBackgroundColor(index),
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.black),
                      image: _images[index] != null
                          ? DecorationImage(
                        image: FileImage(_images[index]!),
                        fit: BoxFit.cover,
                      )
                          : null,
                    ),
                    child: _images[index] == null
                        ? null
                        : Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/background_image.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
