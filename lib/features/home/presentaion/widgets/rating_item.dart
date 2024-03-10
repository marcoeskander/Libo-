import 'package:flutter/material.dart';

import '../../../../core/utils/styles_manager.dart';

class RatingItem extends StatelessWidget {
  const RatingItem(
      {super.key,
      this.mainAxisAlignment = MainAxisAlignment.start,
      required this.rate,
      required this.averagerate});
  final MainAxisAlignment mainAxisAlignment;
  final num rate;
  final num averagerate;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          Icons.star_border_outlined,
          color: Color(0xffFFDD4F),
        ),
        const SizedBox(
          width: 6.3,
        ),
        Text(
          rate.toString(),
          style: StylesManager.textStyle16,
        ),
        const SizedBox(
          width: 9.0,
        ),
        Text(
          averagerate.toString(),
          style: StylesManager.textStyle14,
        ),
      ],
    );
  }
}
