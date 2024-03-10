import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libo/features/home/domain/entity/book_entity.dart';
import 'package:libo/features/home/presentaion/manager/fetch_feature_book_cubit/fetch_feature_book_cubit.dart';

import 'custom_image.dart';

class FeatueBookListView extends StatefulWidget {
  const FeatueBookListView({
    super.key,
    required this.books,
  });
  final List<BookEntity> books;

  @override
  State<FeatueBookListView> createState() => _FeatueBookListViewState();
}

class _FeatueBookListViewState extends State<FeatueBookListView> {
  late final ScrollController scroollController;
  var nextPage = 1;
  var isLoading = false;
  @override
  void initState() {
    super.initState();
    scroollController = ScrollController();
    scroollController.addListener(scrollLisner);
  }

  void scrollLisner() async {
    var currentPosition = scroollController.position.pixels;
    var maxListlength = scroollController.position.maxScrollExtent;
    if (currentPosition >= 0.7 * maxListlength) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<FeatureBookCubit>(context)
            .fetchFeatureBook(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    scroollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.23,
      child: ListView.builder(
          controller: scroollController,
          scrollDirection: Axis.horizontal,
          itemCount: widget.books.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: ImageBook(
                imageUrl: widget.books[index].bookImage!,
              ),
            );
          }),
    );
  }
}
