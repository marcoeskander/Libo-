import 'package:flutter/material.dart';
import 'package:libo/core/widgets/custom_fading_widget.dart';
import 'package:libo/features/home/presentaion/widgets/custom_image_loading_indecator.dart';

class FeaturedBookListViewLoadingIndecator extends StatefulWidget {
  const FeaturedBookListViewLoadingIndecator({super.key});

  @override
  State<FeaturedBookListViewLoadingIndecator> createState() =>
      _FeaturedBookListViewLoadingIndecatorState();
}

class _FeaturedBookListViewLoadingIndecatorState
    extends State<FeaturedBookListViewLoadingIndecator> {
  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.0),
                child: ImageBookLoadingIndecator(),
              );
            }),
      ),
    );
  }
}
