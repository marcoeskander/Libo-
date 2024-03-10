import 'package:flutter/material.dart';
import 'package:libo/features/home/presentaion/widgets/best_seller_list_view_item_loading_indecator.dart';

import '../../../../core/widgets/custom_fading_widget.dart';

class BestSellerListViewLoadingIndecator extends StatefulWidget {
  const BestSellerListViewLoadingIndecator({
    super.key,
  });

  @override
  State<BestSellerListViewLoadingIndecator> createState() =>
      _BestSellerListViewLoadingIndecatorState();
}

class _BestSellerListViewLoadingIndecatorState
    extends State<BestSellerListViewLoadingIndecator> {
  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: BestSellerListViewItemLoadingIndecator(),
        ),
      ),
    );
  }
}
