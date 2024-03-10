import 'package:dartz/dartz.dart';
import 'package:libo/core/erorr/failure.dart';
import 'package:libo/features/home/domain/entity/book_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fechFeatureBook(
      {int pageNumber = 0});

  Future<Either<Failure, List<BookEntity>>> fechNewestBook(
      {int pageNumber = 0});
}
