import 'package:dartz/dartz.dart';
import 'package:libo/core/erorr/failure.dart';

abstract class GeneralUsecase <type,param>{
    Future <Either <Failure ,type>>  call([param param]);
}
//alternative to void
class NoParam{}