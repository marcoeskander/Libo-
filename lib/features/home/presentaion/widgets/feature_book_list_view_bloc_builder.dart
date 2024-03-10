import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libo/features/home/domain/entity/book_entity.dart';
import 'package:libo/features/home/presentaion/widgets/feature_book_list_view.dart';

import '../../../../core/utils/function/build_error_snackbar.dart';
import '../manager/fetch_feature_book_cubit/fetch_feature_book_cubit.dart';
import '../manager/fetch_feature_book_cubit/fetch_feature_book_state.dart';
import 'featured_book_list_view_loading_indecator.dart';

class FeatureBookListViewBlocBuilder extends StatelessWidget {
  const FeatureBookListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<BookEntity> books = [];
    return BlocConsumer<FeatureBookCubit, FeatureBookState>(
      builder: (context, state) {
        if (state is FeatureBookSuccessState ||
            state is FeatureBookPagenationLoadingState ||
            state is FeatureBookpagenationFailureState) {
          return FeatueBookListView(
            books: books,
          );
        } else if (state is FeatureBookFailureState) {
          return Text(state.message);
        } else {
          return const FeaturedBookListViewLoadingIndecator();
        }
      },
      listener: (context, state) {
        if (state is FeatureBookSuccessState) {
          books.addAll(state.books);
        }
        if (state is FeatureBookpagenationFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildErrorSnackbar(state.message),
          );
        }
      },
    );
  }
}
