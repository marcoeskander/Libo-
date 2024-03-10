import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageBook extends StatelessWidget {
  const ImageBook({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.9 / 4,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: CachedNetworkImage(fit: BoxFit.fill, imageUrl: imageUrl)),
    );
  }
}
