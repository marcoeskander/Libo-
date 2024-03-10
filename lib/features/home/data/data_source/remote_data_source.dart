import 'package:libo/constant.dart';
import 'package:libo/core/utils/api_service.dart';
import 'package:libo/features/home/domain/entity/book_entity.dart';

import '../../../../core/utils/function/save_book.dart';
import '../models/book_model/book_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeatureBook({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewesstBook({int pageNumber = 0});
}

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  final APIService apiService;

  HomeRemoteDataSourceImp(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeatureBook({int pageNumber = 0}) async {
    var books = await apiService.get(
      endPoint:
          'volumes?q=programming&Filtering=free-ebooks&startIndex=${pageNumber * 10}',
    );
    List<BookEntity> booksRes = getbooks(books);

    saveBooks(booksRes, rFeaturedBox);
    return booksRes;
  }

  @override
  Future<List<BookEntity>> fetchNewesstBook({int pageNumber = 0}) async {
    var books = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&Sorting=newest&q=programming&startIndex=${pageNumber * 10}');
    List<BookEntity> booksRes = getbooks(books);
    saveBooks(booksRes, rNewestBox);
    return booksRes;
  }

  List<BookEntity> getbooks(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookModel in data['items']) {
      books.add(BookModel.fromJson(bookModel));
    }
    return books;
  }
}
