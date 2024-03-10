import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerErorr extends Failure {
  ServerErorr(super.message);
  factory ServerErorr.fromdDioErorr(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerErorr('Connection timeout with api server');
      case DioExceptionType.sendTimeout:
        return ServerErorr('send timeout with api server');
      case DioExceptionType.connectionError:
        return ServerErorr('no Internet conection');
      case DioExceptionType.receiveTimeout:
        return ServerErorr('receive timeout with api server');
      case DioExceptionType.badCertificate:
        return ServerErorr('badCertificate timeout with api server');
      case DioExceptionType.cancel:
        return ServerErorr('Request to ApiServer was canceld');
      case DioExceptionType.unknown:
        return ServerErorr('Opps There was an Error, Please try again');
      case DioExceptionType.badResponse:
        return ServerErorr.fromdBadResponse(
            e.response!.statusCode!, e.response!.data);
    }
  }
  factory ServerErorr.fromdBadResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerErorr('your response was not found , please try again');
    } else if (statusCode == 500) {
      return ServerErorr('there is aproblem with server , please try again');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerErorr(response['error']['message']);
    } else {
      return ServerErorr('There was an error , please try again');
    }
  }
}
