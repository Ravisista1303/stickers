import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stickers/screens/mood_stickers_page/mood_page_body.dart';

class MoodPage extends StatefulWidget {
  @override
  _MoodPageState createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () {
        moveToLastScreen();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: SvgPicture.asset("assets/icons/back_arrow.svg"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: MoodPageBody(),
      ),
    );
  }

  void moveToLastScreen() {
    Navigator.pop(context);
  }
}
