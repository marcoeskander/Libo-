import 'package:go_router/go_router.dart';
import 'package:libo/features/home/domain/entity/book_entity.dart';
import 'package:libo/features/home/presentaion/home.dart';
import 'package:libo/features/home/presentaion/widgets/book_details_view.dart';
import 'package:libo/features/splash/presentation/splash.dart';

class AppRouter {
  AppRouter(BookEntity book1) {
    book = book1;
  }
  static BookEntity? book;
  static const lHome = '/homeview';
  static const lbookdetails = '/bookdetails';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: lHome,
        builder: (context, state) => const Home(),
      ),
      GoRoute(
        path: lbookdetails,
        builder: (
          context,
          state,
        ) =>
            BookDetailsView(
          book: state.extra as BookEntity,
        ),
      ),
    ],
  );
}
