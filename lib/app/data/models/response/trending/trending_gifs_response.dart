import 'package:health_flex/app/data/models/response/gif/gif.dart';

class TrendingGIFsResponse {
  List<GIF>? data;

  TrendingGIFsResponse({
    this.data,
  });

  factory TrendingGIFsResponse.fromJson(Map<String, dynamic> json) =>
      TrendingGIFsResponse(
        data: json["data"] == null
            ? []
            : List<GIF>.from(json["data"]!.map((x) => GIF.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.map((e) => e.toJson()).toList(),
      };
}
