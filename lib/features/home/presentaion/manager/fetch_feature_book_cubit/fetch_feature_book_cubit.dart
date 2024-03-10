import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libo/features/home/domain/usecase/fetch_feature_book_usecase.dart';
import 'package:libo/features/home/presentaion/manager/fetch_feature_book_cubit/fetch_feature_book_state.dart';

class FeatureBookCubit extends Cubit<FeatureBookState> {
  FeatureBookCubit(this.featureBookUseCase) : super(FeatureBookInitialState());

  final FetchFeatureBookUseCase featureBookUseCase;

  Future<void> fetchFeatureBook({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeatureBookLoadingState());
    } else {
      emit(FeatureBookPagenationLoadingState());
    }
    var result = await featureBookUseCase.call(pageNumber);
    result.fold((failure) {
      if (pageNumber == 0) {
        emit(
          FeatureBookFailureState(message: failure.message),
        );
      } else {
        emit(
          FeatureBookpagenationFailureState(message: failure.message),
        );
      }
    }, (books) {
      emit(
        FeatureBookSuccessState(books: books),
      );
    });
  }
}
