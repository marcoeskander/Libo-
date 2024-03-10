import 'package:dartz/dartz.dart';
import 'package:libo/core/erorr/failure.dart';
import 'package:libo/features/home/domain/entity/book_entity.dart';
import 'package:libo/features/home/domain/repo/book_repo.dart';

import '../../../../core/usecase/generic_usecase.dart';

class FetchNewestBookUseCase extends GeneralUsecase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchNewestBookUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call([int param = 0]) async {
    return await homeRepo.fechNewestBook(pageNumber: param);
  }
}
