import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:health_flex/app/data/models/response/gif/gif.dart';

class GIFCard extends StatelessWidget {
  final GIF gif;
  const GIFCard({super.key, required this.gif});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(imageUrl: gif.images?.original?.url ?? '');
  }
}
