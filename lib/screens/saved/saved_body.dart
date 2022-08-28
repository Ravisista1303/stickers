import 'package:flutter/material.dart';
import 'package:stickers/screens/saved/saved_header.dart';

class SavedBody extends StatefulWidget {
  @override
  _SavedBodyState createState() => _SavedBodyState();
}

class _SavedBodyState extends State<SavedBody> {
  @override
  Widget build(BuildContext context) {
    // Provides us the height and width of our screen
    Size size = MediaQuery.of(context).size;
    // It enables scrolling
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SavedHeader(size: size),
        ],
      ),
    );
  }
}
