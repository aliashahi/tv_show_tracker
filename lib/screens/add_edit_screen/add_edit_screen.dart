import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:watch_list_tracker/constants/colors.dart';
import 'package:watch_list_tracker/screens/add_edit_screen/components/image_card.dart';
import 'package:watch_list_tracker/screens/add_edit_screen/components/input_field.dart';
import 'package:watch_list_tracker/screens/home_screen/home_screen.dart';
import 'package:watch_list_tracker/services/file_handler.dart';
import 'package:watch_list_tracker/services/object_handler.dart';

class AddEditScreen extends StatefulWidget {
  @override
  _AddEditScreenState createState() => _AddEditScreenState();
}

class _AddEditScreenState extends State<AddEditScreen> {
  String imageAddress;

  String title;

  String subtitle;

  String desc;

  int episodes;

  getImage() async {
    var x = new FileHandler();
    var d = await x.imgFromGallery();
    setState(() {
      imageAddress = d;
      // imageAddress = d;
    });
  }

  submit() {
    DObject object = new DObject(
      id: Uuid().v4(),
      title: title,
      desc: desc,
      episodes: episodes,
      subtitle: subtitle,
      imageAddress: imageAddress,
      favorite: false,
      lastModifiedTime: DateTime.now().toString(),
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageCard(
              imageAddress: imageAddress,
              getImage: getImage,
              backBtn: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
            ),
            InputField(
              placeHolder: 'name',
              onValueChange: (value) {
                title = value;
              },
              textInputType: TextInputType.text,
            ),
            InputField(
              placeHolder: 'Season',
              onValueChange: (value) {
                subtitle = value;
              },
              textInputType: TextInputType.text,
            ),
            InputField(
              placeHolder: 'description',
              onValueChange: (value) {
                desc = value;
              },
              textInputType: TextInputType.multiline,
            ),
            InputField(
              placeHolder: 'watched episodes',
              onValueChange: (value) {
                episodes = value;
              },
              textInputType: TextInputType.number,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: RaisedButton(
                onPressed: submit,
                color: primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'ADD To LIST',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
