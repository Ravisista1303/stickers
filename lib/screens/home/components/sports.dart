import 'package:flutter/material.dart';
import 'package:stickers/constants.dart';
import 'package:stickers/screens/selected_sticker_page/selected_sticker_page.dart';

class Sports extends StatelessWidget {
  const Sports({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SportStickers(
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SelectedStickerPage(
                          image: "assets/images/sticker.png")));
            },
          ),
          SportStickers(
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SelectedStickerPage(
                          image: "assets/images/sticker.png")));
            },
          ),
          SportStickers(
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SelectedStickerPage(
                          image: "assets/images/sticker.png")));
            },
          ),
          SportStickers(
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

class SportStickers extends StatelessWidget {
  const SportStickers({
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
