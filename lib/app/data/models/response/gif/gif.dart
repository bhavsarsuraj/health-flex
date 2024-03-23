import 'package:health_flex/app/data/models/response/images/images.dart';
import 'package:health_flex/app/data/models/response/user/user.dart';

class GIF {
  String? type;
  String? id;
  String? url;
  String? title;
  Images? images;
  User? user;
  String? analyticsResponsePayload;

  GIF({
    this.type,
    this.id,
    this.url,
    this.title,
    this.images,
    this.user,
    this.analyticsResponsePayload,
  });

  GIF copyWith({
    String? type,
    String? id,
    String? url,
    String? title,
    Images? images,
    User? user,
    String? analyticsResponsePayload,
  }) =>
      GIF(
        type: type ?? this.type,
        id: id ?? this.id,
        url: url ?? this.url,
        title: title ?? this.title,
        images: images ?? this.images,
        user: user ?? this.user,
      );

  factory GIF.fromJson(Map<String, dynamic> json) => GIF(
        type: json["type"],
        id: json["id"],
        url: json["url"],
        title: json["title"],
        images: json["images"] == null ? null : Images.fromJson(json["images"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "url": url,
        "title": title,
        "images": images?.toJson(),
        "user": user?.toJson(),
      };
}
