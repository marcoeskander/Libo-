import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:libo/core/utils/api_service.dart';

import '../../../features/home/data/data_repo/home_rebo_impelmentaion.dart';
import '../../../features/home/data/data_source/local_data_source.dart';
import '../../../features/home/data/data_source/remote_data_source.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<APIService>(
    APIService(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      HomeLocalDataSourceImp(),
      HomeRemoteDataSourceImp(
        getIt.get<APIService>(),
      ),
    ),
  );
}
