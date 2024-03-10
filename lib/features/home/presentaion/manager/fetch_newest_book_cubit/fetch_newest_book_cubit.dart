import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libo/features/home/domain/usecase/fetch_newest_book_usecase.dart';

import 'fetch_newest_book_state.dart';

class NewestBookCubit extends Cubit<NewestBookState> {
  NewestBookCubit(this.fetchNewestBookUseCase)
      : super(NewestBookInitialState());

  final FetchNewestBookUseCase fetchNewestBookUseCase;

  Future<void> fetchNewestBook({int pageNumber = 0}) async {
    emit(NewestBookLoadingState());
    var result = await fetchNewestBookUseCase.call();
    result.fold((failure) {
      emit(
        NewestBookFailureState(message: failure.message),
      );
    }, (books) {
      emit(
        NewestBookSuccessState(books: books),
      );
    });
  }
}
