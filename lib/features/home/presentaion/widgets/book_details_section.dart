import 'package:flutter/material.dart';
import 'package:libo/core/utils/styles_manager.dart';
import 'package:libo/features/home/domain/entity/book_entity.dart';
import 'package:libo/features/home/presentaion/widgets/book_action.dart';
import 'package:libo/features/home/presentaion/widgets/book_details_appbar.dart';
import 'package:libo/features/home/presentaion/widgets/custom_image.dart';
import 'package:libo/features/home/presentaion/widgets/rating_item.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({
    super.key,
    required this.book,
  });
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const BookDetailsAppBar(),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.25,
          ),
          // dont forget par
          child: ImageBook(
            imageUrl: book.bookImage!,
          ),
        ),
        const SizedBox(
          height: 43.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            book.bookName!,
            style: StylesManager.textStyle30,
          ),
        ),
        const SizedBox(
          height: 4.0,
        ),
        Text(
          book.autherName!,
          style: StylesManager.textStyle18,
        ),
        const SizedBox(
          height: 14,
        ),
        RatingItem(
          rate: book.rate ?? 0,
          averagerate: book.averageRate ?? 0,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 37,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: BookAction(),
        ),
      ],
    );
  }
}
