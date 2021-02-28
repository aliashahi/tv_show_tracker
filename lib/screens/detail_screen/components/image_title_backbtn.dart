import 'dart:io';

import 'package:flutter/material.dart';
import 'package:watch_list_tracker/constants/colors.dart';

class ImageTitleWithBackBtn extends StatelessWidget {

  ImageTitleWithBackBtn(
      {Key key,
      this.title,
      this.subtitle,
      this.imageAddress,
      this.backBtn,
      this.editBtn})
      : super(key: key);
  final String title;
  final String subtitle;
  final Function backBtn;
  final Function editBtn;
  final String imageAddress;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: [
          Container(
            height: size.height * 0.6,
            decoration: BoxDecoration(color: primaryColor, boxShadow: [
              BoxShadow(
                offset: Offset(0, 1),
                color: primaryColor,
                blurRadius: 70,
                spreadRadius: -3,
              )
            ]),
            child:imageAddress!=null?FileImage(File(imageAddress)):Image.asset(
              'assets/images/test (5).jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 30,
            left: 10,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(-30, -30),
                    color: Colors.white,
                    blurRadius: 80,
                    spreadRadius: 10,
                  ),
                ],
              ),
              child: IconButton(
                color: Colors.black,
                iconSize: 30,
                icon: Icon(Icons.keyboard_backspace),
                onPressed: backBtn,
              ),
            ),
          ),
          Positioned(
            top: 30,
            right: 30,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(30, -30),
                    color: Colors.white,
                    blurRadius: 80,
                    spreadRadius: 10,
                  ),
                ],
              ),
              child: IconButton(
                color: Colors.black,
                iconSize: 30,
                icon: Icon(Icons.edit),
                onPressed: editBtn,
              ),
            ),
          ),
          Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: '$title\n\t'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: subtitle,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          BoxShadow(
                              offset: Offset(1, 1),
                              color: Colors.white,
                              blurRadius: 10,
                              spreadRadius: 3)
                        ]),
                  ),
                ]),
              ))
        ],
      ),
    );
  }
}
