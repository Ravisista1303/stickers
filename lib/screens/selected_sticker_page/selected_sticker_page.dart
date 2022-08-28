import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;
import 'package:share/share.dart';

class SelectedStickerPage extends StatefulWidget {
  final String image;
  // ignore: non_constant_identifier_names
  SelectedStickerPage({this.image});
  @override
  _SelectedStickerPageState createState() => _SelectedStickerPageState();
}

class _SelectedStickerPageState extends State<SelectedStickerPage> {
  List<String> imagePaths = [];
  @override
  // ignore: override_on_non_overriding_member
  void initstate() {
    super.initState();
  }

  Future<void> _share() async {
    final response = await http.get(widget.image);
    // Get the image name
    final imageName = path.basename(widget.image);
    // Get the document directory path
    final appDir = await pathProvider.getApplicationDocumentsDirectory();
    // This is the saved image path
    // You can use it to display the saved image later.
    final localPath = path.join(appDir.path, imageName);
    // Downloading
    final imageFile = File(localPath);
    await imageFile.writeAsBytes(response.bodyBytes);
    print('Downloaded!');
    imagePaths.add(localPath);
    Share.shareFiles(imagePaths);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            "assets/icons/back_arrow.svg",
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 100, left: 90, right: 90),
              child: Column(
                children: <Widget>[
                  Container(
                      height: 256,
                      width: 256,
                      child: Image.network(widget.image)),
                  SizedBox(height: 40),
                  Container(
                    height: 50,
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      shadowColor: Colors.greenAccent,
                      color: Colors.red,
                      elevation: 7,
                      child: GestureDetector(
                        onTap: () => _share(),
                        child: Center(
                          child: Text(
                            'SHARE',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: 50.0,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 1.0),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: InkWell(
                        onTap: () {},
                        child: Center(
                          child: Text('SAVE',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat')),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
