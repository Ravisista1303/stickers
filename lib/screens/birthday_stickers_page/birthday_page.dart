import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stickers/screens/birthday_stickers_page/birthday_page_body.dart';

class BirthdayPage extends StatefulWidget {
  @override
  _BirthdayPageState createState() => _BirthdayPageState();
}

class _BirthdayPageState extends State<BirthdayPage> {
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
        body: BirthdayPageBody(),
      ),
    );
  }

  void moveToLastScreen() {
    Navigator.pop(context);
  }
}
