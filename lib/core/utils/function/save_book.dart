import 'package:hive/hive.dart';
import '../../../features/home/domain/entity/book_entity.dart';

void saveBooks(List<BookEntity> booksRes, String boxName) {
  var box = Hive.box<BookEntity>(boxName);
  box.addAll(booksRes);
}
