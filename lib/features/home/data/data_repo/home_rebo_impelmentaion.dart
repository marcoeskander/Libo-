import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:libo/core/erorr/failure.dart';
import 'package:libo/features/home/data/data_source/local_data_source.dart';
import 'package:libo/features/home/data/data_source/remote_data_source.dart';
import 'package:libo/features/home/domain/entity/book_entity.dart';
import 'package:libo/features/home/domain/repo/book_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl(this.homeLocalDataSource, this.homeRemoteDataSource);

  @override
  Future<Either<Failure, List<BookEntity>>> fechFeatureBook(
      {int pageNumber = 0}) async {
    List<BookEntity>? booksList;
    try {
      booksList =
          homeLocalDataSource.fetchlocalFeatureBook(pageNumber: pageNumber);

      if (booksList.isNotEmpty) {
        return right(booksList);
      }
      booksList =
          await homeRemoteDataSource.fetchFeatureBook(pageNumber: pageNumber);
      return right(booksList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerErorr.fromdDioErorr(e));
      }
      return left(ServerErorr(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fechNewestBook(
      {int pageNumber = 0}) async {
    List<BookEntity> booksList;
    try {
      booksList =
          homeLocalDataSource.fetchlocalNewestBOok(pageNumber: pageNumber);
      if (booksList.isNotEmpty) {
        return right(booksList);
      }
      booksList =
          await homeRemoteDataSource.fetchNewesstBook(pageNumber: pageNumber);
      return right(booksList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerErorr.fromdDioErorr(e));
      }
      return left(ServerErorr(e.toString()));
    }
  }
}
