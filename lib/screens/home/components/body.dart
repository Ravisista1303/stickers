import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stickers/constants.dart';
import 'package:stickers/screens/about_us/about_us.dart';
import 'package:stickers/screens/birthday_stickers_page/birthday_page.dart';
import 'package:stickers/screens/festival_stickers_page/festival_page.dart';
import 'package:stickers/screens/home/components/birthdays.dart';
import 'package:stickers/screens/home/components/festivals.dart';
import 'package:stickers/screens/home/components/login.dart';
import 'package:stickers/screens/home/components/misc.dart';
import 'package:stickers/screens/home/components/mood.dart';
import 'package:stickers/screens/home/components/movies.dart';
import 'package:stickers/screens/home/components/series.dart';
import 'package:stickers/screens/home/components/sports.dart';
import 'package:stickers/screens/home/components/title_with_more_btn.dart';
import 'package:stickers/screens/misc_sticker_page/misc_page.dart';
import 'package:stickers/screens/mood_stickers_page/mood_page.dart';
import 'package:stickers/screens/movies_sticker_page/movies_page.dart';
import 'package:stickers/screens/privacy_policy/privacy_policy.dart';
import 'package:stickers/screens/series_sticker_page/series_page.dart';
import 'package:stickers/screens/sports_stickers_page/sports_page.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  GlobalKey<ScaffoldState> _scaffoldKEY = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    // Provides us the height and width of our screen
    Size size = MediaQuery.of(context).size;
    // It enables scrolling
    return Scaffold(
        key: _scaffoldKEY,
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.red),
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          radius: 50,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add_a_photo,
                              color: Colors.black,
                            ),
                          )),
                    )
                  ],
                ),
              ),
              ListTile(
                title: Text(
                  'Invite a friend',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Divider(
                thickness: 1,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PrivacyPolicy()));
                },
                leading: Icon(
                  Icons.privacy_tip,
                  color: Colors.red,
                ),
                title: Text(
                  'Privacy Policy',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Divider(
                thickness: 1,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutUs()));
                },
                leading: Icon(
                  Icons.info_rounded,
                  color: Colors.red,
                ),
                title: Text(
                  'About Us',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Divider(
                thickness: 1,
              ),
              ListTile(
                leading: Icon(
                  Icons.star,
                  color: Colors.red,
                ),
                title: Text(
                  'Rate this App',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Divider(
                thickness: 1,
              ),
              ListTile(
                title: Text(
                  'Follow Us',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Divider(
                thickness: 1,
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: kDefaultPadding),
                // It will cover 20% of our total height
                height: size.height * 0.3,
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                        left: kDefaultPadding,
                        right: kDefaultPadding,
                      ),
                      height: (size.height * 0.3) - 27,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(36),
                          bottomRight: Radius.circular(36),
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 50),
                            child: Row(
                              children: <Widget>[
                                IconButton(
                                  icon:
                                      SvgPicture.asset('assets/icons/menu.svg'),
                                  onPressed: () {
                                    _scaffoldKEY.currentState.openDrawer();
                                  },
                                ),
                                Spacer(),
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginPage()));
                                    },
                                    icon: Icon(
                                      Icons.login,
                                      color: Colors.white,
                                      size: 35,
                                    ))
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 50),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "Hello there!",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Spacer(),
                              ],
                            ),
                          ),

                          // add your app logo here
                          // Image.asset("")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              TitleWithMoreButton(
                title: "Birthdays",
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BirthdayPage()));
                },
              ),
              Birthdays(),
              TitleWithMoreButton(
                title: "Mood",
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MoodPage()));
                },
              ),
              Mood(),
              TitleWithMoreButton(
                title: "Festivals",
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FestivalPage()));
                },
              ),
              Festivals(),
              TitleWithMoreButton(
                title: "Sports",
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SportsPage()));
                },
              ),
              Sports(),
              TitleWithMoreButton(
                title: "Movies",
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MoviesPage()));
                },
              ),
              Movies(),
              TitleWithMoreButton(
                title: "Series",
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SeriesPage()));
                },
              ),
              Series(),
              TitleWithMoreButton(
                title: "Miscellaneous",
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MiscPage()));
                },
              ),
              Misc(),
            ],
          ),
        ));
  }
}
