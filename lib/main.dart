// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:libo/constant.dart';
import 'package:libo/core/utils/function/service_locator.dart';
import 'package:libo/core/utils/routing.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:libo/core/utils/simple_bloc_observer.dart';
import 'package:libo/features/home/data/data_repo/home_rebo_impelmentaion.dart';
import 'package:libo/features/home/domain/entity/book_entity.dart';
import 'package:libo/features/home/domain/usecase/fetch_feature_book_usecase.dart';
import 'package:libo/features/home/domain/usecase/fetch_newest_book_usecase.dart';
import 'package:libo/features/home/presentaion/manager/fetch_feature_book_cubit/fetch_feature_book_cubit.dart';
import 'package:libo/features/home/presentaion/manager/fetch_newest_book_cubit/fetch_newest_book_cubit.dart';

void main() async {
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.initFlutter();
  setupServiceLocator();
  await Hive.openBox<BookEntity>(rFeaturedBox);
  await Hive.openBox<BookEntity>(rNewestBox);
  Bloc.observer = SimpleBlocobserver();
  runApp(const Libo());
}

class Libo extends StatelessWidget {
  const Libo({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return FeatureBookCubit(
              FetchFeatureBookUseCase(
                homeRepo: getIt.get<HomeRepoImpl>(),
              ),
            )..fetchFeatureBook();
          },
        ),
        BlocProvider(
          create: (context) {
            return NewestBookCubit(
              FetchNewestBookUseCase(
                homeRepo: getIt.get<HomeRepoImpl>(),
              ),
            )..fetchNewestBook();
          },
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: pcolor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
