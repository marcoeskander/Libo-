import 'package:flutter/material.dart';
import 'package:libo/core/utils/styles_manager.dart';
import 'package:libo/features/home/domain/entity/book_entity.dart';
import 'package:libo/features/home/presentaion/widgets/book_details_section.dart';
import 'package:libo/features/home/presentaion/widgets/custom_image.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BookDetailsSection(
                book: book,
              ),
              const SizedBox(
                height: 45.0,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Text(
                  'Book Description',
                  style: StylesManager.textStyle14,
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text(book.bookDescription ?? " "),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SimilarBookListView extends StatelessWidget {
  const SimilarBookListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          //itemCount: 4,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.0),
              child: ImageBook(
                imageUrl:
                    'https://books.google.com/books/content?id=45ncDgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
              ),
            );
          }),
    );
  }
}
