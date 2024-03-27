import 'package:dartz/dartz.dart';
import 'package:vista_movie/Di/di.dart';
import 'package:vista_movie/util/api_exeption.dart';

import '../datasource/auth_datasource.dart';

abstract class IAuthRepository {
  Future<Either<String, String>> register(
      String username, String password, String passwordConfirm, String email);
}

class AutunticationRepository extends IAuthRepository {
  final IAuthanticationDataSource _datasource = locator.get();

  @override
  Future<Either<String, String>> register(String username, String password,
      String passwordConfirm, String email) async {
    try {
      await _datasource.register(username, password, passwordConfirm, email);
      return right('ثبت نام انجام شد!');
    } on ApiExeption catch (e) {
      return left(e.message ?? "خطا محتوا در دسترس نیست");
    }
  }
}
