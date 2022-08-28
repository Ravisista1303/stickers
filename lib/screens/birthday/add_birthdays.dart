import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stickers/constants.dart';
import 'package:stickers/screens/birthday/birthday_body.dart';

class AddBirthday extends StatefulWidget {
  @override
  _AddBirthdayState createState() => _AddBirthdayState();
}

class _AddBirthdayState extends State<AddBirthday> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: BirthdayBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        iconSize: 25,
        selectedFontSize: 15,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              // ignore: deprecated_member_use
              title: Text("Home"),
              backgroundColor: kPrimaryColor),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/heart-icon.svg"),
              // ignore: deprecated_member_use
              title: Text("Saved"),
              backgroundColor: kPrimaryColor),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/user-icon.svg"),
              // ignore: deprecated_member_use
              title: Text("Birthdays"),
              backgroundColor: kPrimaryColor),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    elevation: 0,
    leading: IconButton(
      icon: SvgPicture.asset("assets/icons/menu.svg"),
      onPressed: () {},
    ),
  );
}
