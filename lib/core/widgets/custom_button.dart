import 'package:flutter/material.dart';
import 'package:libo/core/utils/styles_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
     required this.buttonText,
     required this.textcolor,
     required this.backgroundcolor,
     required this.textSize,
      this.border
     });
   final String buttonText;
   final Color textcolor;
    final Color backgroundcolor;
   final double textSize;
   final BorderRadius ? border;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
       height: 48,
     child: TextButton(
      style: TextButton.styleFrom(
        backgroundColor: backgroundcolor,
        shape: RoundedRectangleBorder(
          borderRadius: border ?? BorderRadius.circular(12,),
        ),
      ),
      onPressed: (){}, 
     child: Text(
      buttonText,
     style: StylesManager.textStyle18.copyWith(
      color: textcolor,
      fontSize: textSize,
      fontWeight: FontWeight.w900,
     ),
     )),
    );
  }
}