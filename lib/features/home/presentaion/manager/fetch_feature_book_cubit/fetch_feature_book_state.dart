import 'package:libo/features/home/domain/entity/book_entity.dart';

abstract class FeatureBookState {}

class FeatureBookInitialState extends FeatureBookState {}

class FeatureBookLoadingState extends FeatureBookState {}

class FeatureBookPagenationLoadingState extends FeatureBookState {}

class FeatureBookpagenationFailureState extends FeatureBookState {
  final String message;

  FeatureBookpagenationFailureState({required this.message});
}

class FeatureBookFailureState extends FeatureBookState {
  final String message;

  FeatureBookFailureState({required this.message});
}

class FeatureBookSuccessState extends FeatureBookState {
  final List<BookEntity> books;

  FeatureBookSuccessState({required this.books});
}
