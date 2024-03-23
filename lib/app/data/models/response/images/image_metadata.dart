class ImageMetaData {
  String? height;
  String? width;
  String? size;
  String? url;
  String? mp4Size;
  String? mp4;
  String? webpSize;
  String? webp;
  String? frames;
  String? hash;

  ImageMetaData({
    this.height,
    this.width,
    this.size,
    this.url,
    this.mp4Size,
    this.mp4,
    this.webpSize,
    this.webp,
    this.frames,
    this.hash,
  });

  ImageMetaData copyWith({
    String? height,
    String? width,
    String? size,
    String? url,
    String? mp4Size,
    String? mp4,
    String? webpSize,
    String? webp,
    String? frames,
    String? hash,
  }) =>
      ImageMetaData(
        height: height ?? this.height,
        width: width ?? this.width,
        size: size ?? this.size,
        url: url ?? this.url,
        mp4Size: mp4Size ?? this.mp4Size,
        mp4: mp4 ?? this.mp4,
        webpSize: webpSize ?? this.webpSize,
        webp: webp ?? this.webp,
        frames: frames ?? this.frames,
        hash: hash ?? this.hash,
      );

  factory ImageMetaData.fromJson(Map<String, dynamic> json) => ImageMetaData(
        height: json["height"],
        width: json["width"],
        size: json["size"],
        url: json["url"],
        mp4Size: json["mp4_size"],
        mp4: json["mp4"],
        webpSize: json["webp_size"],
        webp: json["webp"],
        frames: json["frames"],
        hash: json["hash"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "width": width,
        "size": size,
        "url": url,
        "mp4_size": mp4Size,
        "mp4": mp4,
        "webp_size": webpSize,
        "webp": webp,
        "frames": frames,
        "hash": hash,
      };
}
