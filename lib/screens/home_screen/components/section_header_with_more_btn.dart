import 'package:flutter/material.dart';
import 'package:watch_list_tracker/constants/colors.dart';

class SectionHeaderWithMoreBtn extends StatelessWidget {
  SectionHeaderWithMoreBtn({Key key, this.moreBtn, this.title})
      : super(key: key);
  final Function moreBtn;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),
          Spacer(),
          FlatButton(
            onPressed: moreBtn,
            color: primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Text(
              'more',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
