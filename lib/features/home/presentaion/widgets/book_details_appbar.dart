import 'package:flutter/material.dart';

class BookDetailsAppBar extends StatelessWidget {
  const BookDetailsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0,),
      child: Row(
        children: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.close,),),
            const  Spacer(),
          IconButton(onPressed: (){}, icon: const Icon(Icons.shop_2_outlined,),),
        ],
      ),
    );
  }
}