import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stickers/screens/birthday/birthday_body.dart';
import 'package:stickers/screens/home/components/body.dart';
import 'package:stickers/screens/saved/saved_body.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final tabs = [
    Body(),
    SavedBody(),
    BirthdayBody(),
  ];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        //backgroundColor: Colors.white,
        iconSize: 25,
        selectedFontSize: 15,
        selectedIconTheme: IconThemeData(color: Colors.red),
        selectedItemColor: Colors.red,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              // ignore: deprecated_member_use
              title: Text(
                "Home",
              ),
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.save_alt),
              // ignore: deprecated_member_use
              title: Text("Saved"),
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              // ignore: deprecated_member_use
              title: Text("Birthdays"),
              backgroundColor: Colors.red),
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
