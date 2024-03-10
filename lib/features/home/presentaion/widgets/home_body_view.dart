import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:libo/core/utils/styles_manager.dart';
import 'package:libo/features/home/presentaion/widgets/best_seller_list_view_bloc_builder.dart';
import 'package:libo/features/home/presentaion/widgets/feature_book_list_view_bloc_builder.dart';
import 'custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: NeverScrollableScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  bottom: 40,
                  left: 20.0,
                  right: 30.0,
                ),
                child: CustomAppBar(),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 14.0,
                ),
                child: FeatureBookListViewBlocBuilder(),
              ),
              SizedBox(
                height: 46.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Best Seller',
                  style: StylesManager.textStyle18,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          child: BestSellerListViewBlocBuilder(),
        ),
      ],
    );
  }
}
