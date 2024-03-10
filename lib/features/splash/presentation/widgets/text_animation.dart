
import 'package:flutter/material.dart';

class TextAnimation extends StatelessWidget {
  const TextAnimation({
    super.key,
    required this.animation,
  });

  final Animation<Offset> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: animation,
     builder:(context,_)=> SlideTransition(
          position:  animation,
        child:const Text('enjoy with free books',
       textAlign: TextAlign.center, ),
        ) ,
    
    );
  }
}