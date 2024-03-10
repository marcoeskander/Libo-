import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libo/core/utils/function/build_error_snackbar.dart';
import 'package:libo/features/home/domain/entity/book_entity.dart';
import 'package:libo/features/home/presentaion/manager/fetch_newest_book_cubit/fetch_newest_book_cubit.dart';
import 'package:libo/features/home/presentaion/manager/fetch_newest_book_cubit/fetch_newest_book_state.dart';
import 'package:libo/features/home/presentaion/widgets/best_seller_list_view.dart';
import 'package:libo/features/home/presentaion/widgets/best_seller_list_view_loading_indecator.dart';

class BestSellerListViewBlocBuilder extends StatelessWidget {
  const BestSellerListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<BookEntity> books = [];
    return BlocConsumer<NewestBookCubit, NewestBookState>(
      builder: (context, state) {
        if (state is NewestBookSuccessState ||
            state is NewestBookpagenationFailureState ||
            state is NewestBookpagenationLoadingState) {
          return BestSellerListView(
            books: books,
          );
        } else if (state is NewestBookFailureState) {
          return Text(state.message);
        } else {
          return const BestSellerListViewLoadingIndecator();
        }
      },
      listener: (context, state) {
        if (state is NewestBookSuccessState) {
          books.addAll(state.books);
        }
        if (state is NewestBookpagenationFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildErrorSnackbar(state.message),
          );
        }
      },
    );
  }
}
