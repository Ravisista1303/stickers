import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stickers/screens/festival_stickers_page/festival_page_body.dart';

class FestivalPage extends StatefulWidget {
  @override
  _FestivalPageState createState() => _FestivalPageState();
}

class _FestivalPageState extends State<FestivalPage> {
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
        body: FestivalPageBody(),
      ),
    );
  }

  void moveToLastScreen() {
    Navigator.pop(context);
  }
}
