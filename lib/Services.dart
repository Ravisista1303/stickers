import 'package:http/http.dart' as http;
import 'StickerData.dart';

class Services {
  static const String url =
      'http://stickersportal.herokuapp.com/api/v1/stickers.json';

  static Future<List<StickerData>> getStickerData() async {
    try {
      final response = await http.get(url);

      if (200 == response.statusCode) {
        final List<StickerData> stickers = stickerDataFromJson(response.body);
        return stickers;
      } else {
        // ignore: deprecated_member_use
        return List<StickerData>();
      }
    } catch (e) {
      // ignore: deprecated_member_use
      return List<StickerData>();
    }
  }
}
