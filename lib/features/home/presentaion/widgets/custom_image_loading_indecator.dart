import 'package:flutter/material.dart';

class ImageBookLoadingIndecator extends StatelessWidget {
  const ImageBookLoadingIndecator({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.5 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Container(
          color: Colors.grey[50],
        ),
      ),
    );
  }
}
