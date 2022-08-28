import 'package:stickers/StickerData.dart';
import 'package:stickers/Services.dart';
import 'package:flutter/material.dart';
import 'package:stickers/screens/selected_sticker_page/selected_sticker_page.dart';

class FestivalPageBody extends StatefulWidget {
  @override
  _FestivalPageBodyState createState() => _FestivalPageBodyState();
}

class _FestivalPageBodyState extends State<FestivalPageBody> {
  //
  List<StickerData> _stickers;
  // ignore: non_constant_identifier_names
  List<StickerData> _festival_stickers;
  // ignore: non_constant_identifier_names
  int sticker_length = 0;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    Services.getStickerData().then((stickers) {
      setState(() {
        _stickers = stickers;
        _festival_stickers = _stickers
            .where((element) => element.category == 'Festival')
            .toList();
        sticker_length = _festival_stickers.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 1),
          itemCount: sticker_length,
          itemBuilder: (context, index) => Container(
              color: Colors.grey[200],
              child: GestureDetector(
                  child: Image.network(
                      'https://stickersportal.herokuapp.com/uploads' +
                          _festival_stickers[index].image.url.substring(
                                35,
                              )),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SelectedStickerPage(
                                image:
                                    'https://stickersportal.herokuapp.com/uploads' +
                                        _festival_stickers[index]
                                            .image
                                            .url
                                            .substring(
                                              35,
                                            ),
                              )))))),
    ));
  }
}
