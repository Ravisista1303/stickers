import 'package:flutter/material.dart';
import 'package:stickers/Services.dart';
import 'package:stickers/StickerData.dart';
import 'package:stickers/screens/selected_sticker_page/selected_sticker_page.dart';

class SeriesPageBody extends StatefulWidget {
  @override
  _SeriesPageBodyState createState() => _SeriesPageBodyState();
}

class _SeriesPageBodyState extends State<SeriesPageBody> {
  //
  List<StickerData> _stickers;
  // ignore: non_constant_identifier_names
  List<StickerData> _series_stickers;
  // ignore: non_constant_identifier_names
  int sticker_length = 0;

  @override
  void initState() {
    super.initState();
    Services.getStickerData().then((stickers) {
      setState(() {
        _stickers = stickers;
        _series_stickers =
            _stickers.where((element) => element.category == 'Series').toList();
        sticker_length = _series_stickers.length;
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
                          _series_stickers[index].image.url.substring(
                                35,
                              )),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SelectedStickerPage(
                                image:
                                    'https://stickersportal.herokuapp.com/uploads' +
                                        _series_stickers[index]
                                            .image
                                            .url
                                            .substring(
                                              35,
                                            ),
                              )))))),
    ));
  }
}
