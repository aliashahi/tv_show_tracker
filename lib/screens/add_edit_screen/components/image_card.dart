import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:watch_list_tracker/constants/colors.dart';

class ImageCard extends StatelessWidget {
  ImageCard({Key key, this.getImage, this.backBtn, this.imageAddress})
      : super(key: key);
  final String imageAddress;
  final placeHolderImage = 'assets/images/test (5).jpg';
  final Function getImage;
  final Function backBtn;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: <Widget>[
          imageAddress != null
              ? Image.file(
                  File(imageAddress),
                  width: size.width,
                  height: size.height * 0.4,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  placeHolderImage,
                  width: size.width,
                  height: size.height * 0.4,
                  fit: BoxFit.cover,
                ),
          Container(
            width: size.width,
            height: size.height * 0.4,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
              child: Container(
                color: Colors.black.withOpacity(0.3),
                child: Container(
                  margin: EdgeInsets.all(100.0),
                  height: size.height * 0.3,
                  width: size.width * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: imageAddress != null
                          ? FileImage(
                              File(
                                imageAddress,
                              ),
                            )
                          : AssetImage(
                              placeHolderImage,
                            ),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: size.height * 0.1,
            right: size.width * 0.3,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: getImage,
              child: Icon(
                Icons.camera,
                color: primaryColor,
              ),
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
        ],
      ),
    );
  }
}
