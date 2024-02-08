import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:vista_movie/Di/di.dart';
import 'package:vista_movie/util/api_exeption.dart';

import '../datasource/auth_datasource.dart';

abstract class IAuthenticationDatasource {
  Future<Either<String, String>> register(
      String username, String email, String password, String passwordConfirm);


Future<Either<String,String>> login(String username , String password);

}

class AutunticationRepository extends IAuthenticationDatasource {
  final IAuthanticationDataSource _datasource = locator.get();

  @override
  Future<Either<String, String>> register(String username, String email,
      String password, String passwordConfirm) async {
    try {
      await _datasource.register(
         username, password, passwordConfirm, email);
      return right('ثبت نام انجام شد!');
    } on ApiExeption catch (e) {
      return left(e.message ?? "خطا محتوا در دسترس نیست");
    }
  }

  @override
  Future<Either<String, String>> login(String username, String password) async{

    try{

      String token=  await _datasource.login(username, password);


      if(token.isNotEmpty){
        return right('ورود موفق');
      }else {
        return left('خطایی در ورود پیش آمد');
      }
    }on ApiExeption catch(ex){
      return left('${ex.message}');
    }


  }

}
