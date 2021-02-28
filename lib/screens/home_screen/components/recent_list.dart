import 'dart:io';

import 'package:flutter/material.dart';
import 'package:watch_list_tracker/screens/detail_screen/detail_screen.dart';
import 'package:watch_list_tracker/services/object_handler.dart';

class RecentList extends StatefulWidget {
  @override
  _RecentListState createState() => _RecentListState();
}

class _RecentListState extends State<RecentList> {
  final objectHandler = new ObjectHandler();
  _RecentListState() {
    createList();
  }
  List<Widget> list = [];

  void createList() async {
    final objects = await objectHandler.getObjects();
    setState(() {
      print(objects.length);
      objects.forEach((element) {
        print('1');
        list.add(
          RecentListCard(
            object: element,
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: list,
        ),
      ),
    );
  }
}

class RecentListCard extends StatelessWidget {
  RecentListCard({Key key, this.object}) : super(key: key);
  final DObject object;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: 30, left: 10, right: 10),
      width: size.width * 0.8,
      height: 200,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(elmnt: object),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image(
            image: object.imageAddress != null
                ? FileImage(
                    File(object.imageAddress),
                  )
                : AssetImage('assets/images/test (5).jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
