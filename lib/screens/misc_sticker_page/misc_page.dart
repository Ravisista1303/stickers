import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stickers/screens/misc_sticker_page/misc_page_body.dart';

class MiscPage extends StatefulWidget {
  @override
  _MiscPageState createState() => _MiscPageState();
}

class _MiscPageState extends State<MiscPage> {
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
        body: MiscPageBody(),
      ),
    );
  }

  void moveToLastScreen() {
    Navigator.pop(context);
  }
}
