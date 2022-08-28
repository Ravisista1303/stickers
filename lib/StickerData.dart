import 'dart:convert';

List<StickerData> stickerDataFromJson(String str) => List<StickerData>.from(
    json.decode(str).map((x) => StickerData.fromJson(x)));

String stickerDataToJson(List<StickerData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StickerData {
  StickerData({
    this.id,
    this.category,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String category;
  Images image;
  DateTime createdAt;
  DateTime updatedAt;

  factory StickerData.fromJson(Map<String, dynamic> json) => StickerData(
        id: json["id"],
        category: json["category"],
        image: Images.fromJson(json["image"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "image": image.toJson(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Images {
  Images({
    this.url,
  });

  String url;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}
