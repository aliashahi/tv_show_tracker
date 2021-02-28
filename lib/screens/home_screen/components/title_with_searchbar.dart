import 'package:flutter/material.dart';
import 'package:watch_list_tracker/constants/colors.dart';

class HeaderAndSearchBar extends StatelessWidget {
  HeaderAndSearchBar({Key key, this.search, this.title}):super(key: key);
  final Function search;
  final String title;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: [
          Container(
            height: size.height * 0.2,
            width: size.width,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Snell Roundhand'
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 0),
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 30,
                      color: primaryColor.withOpacity(0.23))
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 20),
                      child: TextField(
                        onChanged: search,
                        decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              color: primaryColor,
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Icon(Icons.search),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
