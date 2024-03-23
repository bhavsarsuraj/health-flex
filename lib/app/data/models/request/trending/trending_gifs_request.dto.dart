class TrendingGIFRequestDTO {
  int limit;
  int offset;
  String rating;
  String bundle;
  String apiKey;

  TrendingGIFRequestDTO({
    required this.limit,
    required this.offset,
    required this.rating,
    required this.bundle,
    required this.apiKey,
  });

  Map<String, dynamic> toJson() => {
        "limit": limit,
        "offset": offset,
        "rating": rating,
        "bundle": bundle,
        "api_key": apiKey,
      };
}
