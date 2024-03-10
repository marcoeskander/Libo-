import 'package:hive_flutter/adapters.dart';

part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String? bookID;
  @HiveField(1)
  final String? bookImage;
  @HiveField(2)
  final String? autherName;
  @HiveField(3)
  final String? bookName;
  @HiveField(4)
  final num? rate;
  @HiveField(5)
  final num? averageRate;
  @HiveField(6)
  final String? bookDescription;

  BookEntity({
    required this.bookID,
    required this.autherName,
    required this.bookImage,
    required this.bookName,
    required this.averageRate,
    required this.rate,
    required this.bookDescription,
  });
}
