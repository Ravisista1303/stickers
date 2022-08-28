import 'package:flutter/material.dart';
import 'package:stickers/screens/about_us/about_us_header.dart';

class AboutUsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Provides us the height and width of our screen
    Size size = MediaQuery.of(context).size;
    // It enables scrolling
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          AboutUsHeader(size: size),
        ],
      ),
    );
  }
}
