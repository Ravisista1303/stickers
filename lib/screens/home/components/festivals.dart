import 'package:flutter/material.dart';
import 'package:stickers/constants.dart';
import 'package:stickers/screens/selected_sticker_page/selected_sticker_page.dart';

class Festivals extends StatelessWidget {
  const Festivals({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FestivalStickers(
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SelectedStickerPage(
                          image: "assets/images/sticker.png")));
            },
          ),
          FestivalStickers(
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SelectedStickerPage(
                          image: "assets/images/sticker.png")));
            },
          ),
          FestivalStickers(
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SelectedStickerPage(
                          image: "assets/images/sticker.png")));
            },
          ),
          FestivalStickers(
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SelectedStickerPage(
                          image: "assets/images/sticker.png")));
            },
          ),
        ],
      ),
    );
  }
}

class FestivalStickers extends StatelessWidget {
  const FestivalStickers({
    Key key,
    this.press,
  }) : super(key: key);

  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(
            left: kDefaultPadding,
            top: kDefaultPadding / 2,
            bottom: kDefaultPadding * 0.75),
        width: size.width * 0.4,
        child: Column(
          children: <Widget>[
            Image.asset("assets/images/sticker.png"),
            Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 50,
                  color: kPrimaryColor.withOpacity(0.23),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
