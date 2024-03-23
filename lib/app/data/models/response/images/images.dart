import 'package:health_flex/app/data/models/response/images/image_metadata.dart';

class Images {
  ImageMetaData? original;
  ImageMetaData? fixedHeight;
  ImageMetaData? fixedHeightDownsampled;
  ImageMetaData? fixedHeightSmall;
  ImageMetaData? fixedWidth;
  ImageMetaData? fixedWidthDownsampled;
  ImageMetaData? fixedWidthSmall;

  Images({
    this.original,
    this.fixedHeight,
    this.fixedHeightDownsampled,
    this.fixedHeightSmall,
    this.fixedWidth,
    this.fixedWidthDownsampled,
    this.fixedWidthSmall,
  });

  Images copyWith({
    ImageMetaData? original,
    ImageMetaData? fixedHeight,
    ImageMetaData? fixedHeightDownsampled,
    ImageMetaData? fixedHeightSmall,
    ImageMetaData? fixedWidth,
    ImageMetaData? fixedWidthDownsampled,
    ImageMetaData? fixedWidthSmall,
  }) =>
      Images(
        original: original ?? this.original,
        fixedHeight: fixedHeight ?? this.fixedHeight,
        fixedHeightDownsampled:
            fixedHeightDownsampled ?? this.fixedHeightDownsampled,
        fixedHeightSmall: fixedHeightSmall ?? this.fixedHeightSmall,
        fixedWidth: fixedWidth ?? this.fixedWidth,
        fixedWidthDownsampled:
            fixedWidthDownsampled ?? this.fixedWidthDownsampled,
        fixedWidthSmall: fixedWidthSmall ?? this.fixedWidthSmall,
      );

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        original: json["original"] == null
            ? null
            : ImageMetaData.fromJson(json["original"]),
        fixedHeight: json["fixed_height"] == null
            ? null
            : ImageMetaData.fromJson(json["fixed_height"]),
        fixedHeightDownsampled: json["fixed_height_downsampled"] == null
            ? null
            : ImageMetaData.fromJson(json["fixed_height_downsampled"]),
        fixedHeightSmall: json["fixed_height_small"] == null
            ? null
            : ImageMetaData.fromJson(json["fixed_height_small"]),
        fixedWidth: json["fixed_width"] == null
            ? null
            : ImageMetaData.fromJson(json["fixed_width"]),
        fixedWidthDownsampled: json["fixed_width_downsampled"] == null
            ? null
            : ImageMetaData.fromJson(json["fixed_width_downsampled"]),
        fixedWidthSmall: json["fixed_width_small"] == null
            ? null
            : ImageMetaData.fromJson(json["fixed_width_small"]),
      );

  Map<String, dynamic> toJson() => {
        "original": original?.toJson(),
        "fixed_height": fixedHeight?.toJson(),
        "fixed_height_downsampled": fixedHeightDownsampled?.toJson(),
        "fixed_height_small": fixedHeightSmall?.toJson(),
        "fixed_width": fixedWidth?.toJson(),
        "fixed_width_downsampled": fixedWidthDownsampled?.toJson(),
        "fixed_width_small": fixedWidthSmall?.toJson(),
      };
}
