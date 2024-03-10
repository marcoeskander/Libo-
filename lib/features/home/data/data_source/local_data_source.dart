import 'package:hive/hive.dart';
import 'package:libo/constant.dart';

import '../../domain/entity/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchlocalFeatureBook({int pageNumber = 0});

  List<BookEntity> fetchlocalNewestBOok({int pageNumber = 0});
}

class HomeLocalDataSourceImp extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchlocalFeatureBook({int pageNumber = 0}) {
    var startIndex = pageNumber * 10;
    var endIndex = (pageNumber + 1) * 10;
    var box = Hive.box<BookEntity>(rFeaturedBox);
    var length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchlocalNewestBOok({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    var box = Hive.box<BookEntity>(rNewestBox);
    var length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }
}
