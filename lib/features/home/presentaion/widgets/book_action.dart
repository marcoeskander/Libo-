import 'package:flutter/material.dart';
import 'package:libo/core/widgets/custom_button.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              buttonText: '\$free',
              textcolor: Colors.black,
              backgroundcolor: Colors.white,
              textSize: 18.0,
              border: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              buttonText: 'Free preview',
              textcolor: Colors.white,
              backgroundcolor: Color(0xffEF8262),
              textSize: 16.0,
              border: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
