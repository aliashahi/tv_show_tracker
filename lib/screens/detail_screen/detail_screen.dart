import 'package:flutter/material.dart';
import 'package:watch_list_tracker/screens/detail_screen/components/bottom_bar.dart';
import 'package:watch_list_tracker/screens/detail_screen/components/description.dart';
import 'package:watch_list_tracker/screens/detail_screen/components/image_title_backbtn.dart';
import 'package:watch_list_tracker/screens/home_screen/home_screen.dart';
import 'package:watch_list_tracker/services/object_handler.dart';

class DetailScreen extends StatelessWidget {
  final DObject elmnt;
  DetailScreen({Key key, this.elmnt}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            ImageTitleWithBackBtn(
              title: elmnt.title,
              subtitle: elmnt.subtitle,
              imageAddress: elmnt.imageAddress,
              editBtn: () {},
              backBtn: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            DescriptionCard(
              desc: elmnt.desc,
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(
        decreaseBtn: () {},
        favoriteBtn: () {},
        increaseBtn: () {},
        episodes: elmnt.episodes,
        favorite: elmnt.favorite,
      ),
    );
  }
}
