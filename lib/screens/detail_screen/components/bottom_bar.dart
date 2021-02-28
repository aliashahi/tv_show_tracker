import 'package:flutter/material.dart';
import 'package:watch_list_tracker/constants/colors.dart';

class BottomBar extends StatelessWidget {
  BottomBar(
      {Key key,
      this.episodes,
      this.increaseBtn,
      this.decreaseBtn,
      this.favorite,
      this.favoriteBtn})
      : super(key: key);
  final int episodes;
  final bool favorite;
  final Function increaseBtn;
  final Function decreaseBtn;
  final Function favoriteBtn;
  Color isFavorite() {
    if (favorite) {
      return primaryColor;
    } else
      return Colors.black45;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 20),
            blurRadius: 90,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              FlatButton(
                minWidth: 10,
                onPressed: decreaseBtn,
                child: Icon(
                  Icons.remove,
                  color: primaryColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  episodes.toString() ?? '0',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              FlatButton(
                minWidth: 10,
                onPressed: increaseBtn,
                child: Icon(
                  Icons.add,
                  color: primaryColor,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: favoriteBtn,
            icon: Icon(
              Icons.favorite,
              color: isFavorite(),
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}
