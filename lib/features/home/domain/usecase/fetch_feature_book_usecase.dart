import 'package:dartz/dartz.dart';
import 'package:libo/core/erorr/failure.dart';
import 'package:libo/features/home/domain/entity/book_entity.dart';
import 'package:libo/features/home/domain/repo/book_repo.dart';

import '../../../../core/usecase/generic_usecase.dart';

class FetchFeatureBookUseCase extends GeneralUsecase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchFeatureBookUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call([int param = 0]) {
    return homeRepo.fechFeatureBook(pageNumber: param);
  }
}
