import 'package:libo/features/home/domain/entity/book_entity.dart';

abstract class NewestBookState {}

class NewestBookInitialState extends NewestBookState {}

class NewestBookLoadingState extends NewestBookState {}

class NewestBookpagenationLoadingState extends NewestBookState {}

class NewestBookpagenationFailureState extends NewestBookState {
  final String message;

  NewestBookpagenationFailureState({required this.message});
}

class NewestBookFailureState extends NewestBookState {
  final String message;

  NewestBookFailureState({required this.message});
}

class NewestBookSuccessState extends NewestBookState {
  final List<BookEntity> books;

  NewestBookSuccessState({required this.books});
}
