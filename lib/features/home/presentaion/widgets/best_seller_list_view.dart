import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libo/features/home/presentaion/manager/fetch_newest_book_cubit/fetch_newest_book_cubit.dart';

import '../../domain/entity/book_entity.dart';
import 'best_seller_list_view_item.dart';

class BestSellerListView extends StatefulWidget {
  const BestSellerListView({
    super.key,
    required this.books,
  });
  final List<BookEntity> books;

  @override
  State<BestSellerListView> createState() => _BestSellerListViewState();
}

class _BestSellerListViewState extends State<BestSellerListView> {
  late ScrollController scrollController;
  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(scrollLisner);
    super.initState();
  }

  int nextPage = 1;
  var isLoading = false;
  void scrollLisner() {
    var scrollPosition = scrollController.position.pixels;
    var maxLength = scrollController.position.maxScrollExtent;
    if (scrollPosition >= 0.7 * maxLength) {
      if (!isLoading) {
        isLoading = true;
        BlocProvider.of<NewestBookCubit>(context)
            .fetchNewestBook(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: widget.books.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: BestSellerListViewItem(
          book: widget.books[index],
        ),
      ),
    );
  }
}
