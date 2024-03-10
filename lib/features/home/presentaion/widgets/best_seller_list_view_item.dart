import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:libo/core/utils/routing.dart';
import 'package:libo/features/home/domain/entity/book_entity.dart';
import '../../../../core/utils/styles_manager.dart';
import 'rating_item.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({
    super.key,
    required this.book,
  });
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).go(AppRouter.lbookdetails, extra: book);
      },
      child: SizedBox(
        height: 130.0,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.5 / 4,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: CachedNetworkImage(
                      fit: BoxFit.fill, imageUrl: book.bookImage!)),
            ),
            const SizedBox(
              width: 30.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      book.bookName!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: StylesManager.textStyle20,
                    ),
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  Text(
                    book.autherName ?? '',
                    style: StylesManager.textStyle14,
                  ),
                  Row(
                    children: [
                      Text(
                        " \$ free ",
                        style: StylesManager.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      RatingItem(
                        averagerate:
                            book.averageRate == null ? 0 : book.averageRate!,
                        rate: book.averageRate ?? 0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
