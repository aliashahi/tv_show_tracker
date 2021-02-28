import 'package:flutter/material.dart';

class DescriptionCard extends StatelessWidget {
  DescriptionCard({Key key, this.desc}):super(key: key);
  final String desc;
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.3,
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 3),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 0, vertical: 20),
                  child: Text(
                    'Description:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: Divider(),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            child: RichText(
              text: TextSpan(
                text:desc,
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
