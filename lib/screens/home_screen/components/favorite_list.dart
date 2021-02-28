import 'dart:io';

import 'package:flutter/material.dart';
import 'package:watch_list_tracker/screens/detail_screen/detail_screen.dart';
import 'package:watch_list_tracker/services/object_handler.dart';

class FavoriteList extends StatefulWidget {
  @override
  _FavoriteListState createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  final objectHandler = new ObjectHandler();
  List<Widget> list = [];

  _FavoriteListState() {
    createList();
  }

  void createList() async {
    final objects = await objectHandler.getObjects();
    setState(() {
      objects.forEach((element) {
        if (element.favorite)
          list.add(
            FavoriteListCard(
              elmnt: element,
            ),
          );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: list,
      ),
    );
  }
}

class FavoriteListCard extends StatelessWidget {
  FavoriteListCard({Key key, this.elmnt}) : super(key: key);
  final DObject elmnt;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 30),
      width: size.width * 0.4,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(elmnt: elmnt),
            ),
          );
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: elmnt.imageAddress != null || elmnt.imageAddress!=''
                  ? FileImage(
                      File(elmnt.imageAddress),
                    )
                  : Image.asset(
                      'assets/images/test (5).jpg',
                      fit: BoxFit.cover,
                      width: 200,
                      height: 170,
                    ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 70,
                    spreadRadius: 10,
                    color: Colors.black.withOpacity(0.3))
              ]),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: elmnt.title + '\n'.toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .button
                              .copyWith(fontSize: 14, height: 2),
                        ),
                        TextSpan(
                          text: elmnt.subtitle.toUpperCase(),
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    elmnt.episodes.toString(),
                    style: Theme.of(context).textTheme.button,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
