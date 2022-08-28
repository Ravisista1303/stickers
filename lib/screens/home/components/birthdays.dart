import 'package:flutter/material.dart';
import 'package:stickers/constants.dart';

class Birthdays extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(
                  left: kDefaultPadding,
                  top: kDefaultPadding / 2,
                  bottom: kDefaultPadding * 0.75),
              width: size.width * 0.4,
              child: Column(
                children: <Widget>[
                  Image.network(
                      'http://stickersportal.herokuapp.com/uploads/sticker/image/40/birthday_1.jpg'),
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
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(
                  left: kDefaultPadding,
                  top: kDefaultPadding / 2,
                  bottom: kDefaultPadding * 0.75),
              width: size.width * 0.4,
              child: Column(
                children: <Widget>[
                  Image.network(
                      'http://stickersportal.herokuapp.com/uploads/sticker/image/41/birthday_2.jpg'),
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
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(
                  left: kDefaultPadding,
                  top: kDefaultPadding / 2,
                  bottom: kDefaultPadding * 0.75),
              width: size.width * 0.4,
              child: Column(
                children: <Widget>[
                  Image.network(
                      'http://stickersportal.herokuapp.com/uploads/sticker/image/43/birthday_3.jpg'),
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
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(
                  left: kDefaultPadding,
                  top: kDefaultPadding / 2,
                  bottom: kDefaultPadding * 0.75),
              width: size.width * 0.4,
              child: Column(
                children: <Widget>[
                  Image.network(
                      'http://stickersportal.herokuapp.com/uploads/sticker/image/44/birthday_4.jpg'),
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
          ),
        ],
      ),
    );
  }
}
