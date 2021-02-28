import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watch_list_tracker/constants/colors.dart';
import 'package:watch_list_tracker/screens/add_edit_screen/add_edit_screen.dart';
import 'package:watch_list_tracker/screens/home_screen/components/favorite_list.dart';
import 'package:watch_list_tracker/screens/home_screen/components/recent_list.dart';
import 'components/section_header_with_more_btn.dart';
import 'components/title_with_searchbar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AppBar appBar() {
    return AppBar(
      backgroundColor: primaryColor,
      leading: Icon(Icons.menu),
      elevation: 0,
    );
  }

  void search(value) {
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: appBar(),
        body: SingleChildScrollView(
          child: Column(children: [
            HeaderAndSearchBar(
              title: 'My Show Tracker',
              search: search,
            ),
            SectionHeaderWithMoreBtn(
              moreBtn: () {},
              title: 'Favorites',
            ),
            FavoriteList(),
            SectionHeaderWithMoreBtn(
              moreBtn: () {},
              title: 'Recent',
            ),
            RecentList(),
          ]),
        ),
        bottomNavigationBar: Container(
          height: 60,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 50,
              spreadRadius: 10,
            )
          ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  print('favorites');
                },
                child: Icon(
                  Icons.favorite,
                  color: primaryColor,
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('home');
                },
                child: Icon(
                  Icons.home,
                  color: primaryColor,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddEditScreen(),
                    ),
                  );
                },
                child: Icon(
                  Icons.add,
                  color: primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
